<?php

/**
 * 依赖注入示例代码，主要提高 高内聚低耦合  原则
 * 传统思路:是应用程序用到一个Foo类，就会创建Foo类并调用Foo类内部方法，假如这个方法内需要一个Bar类，
 * 就会创建Bar类并调用Bar类的方法，而这个方法内需要一个Bim类，就会创建Bim类，接着做些其他工作
 */
class Bim
{
    public function doSomething()
    {
        echo __METHOD__ . '|';
    }
}

function aaa()
{
    echo __FUNCTION__;
}


class Bar
{
    public function doSomething()
    {
        $bim = new Bim();
        $bim->doSomething();
        echo __METHOD__ . '|';
    }
}

class Foo
{
    public function doSomething()
    {
        $bar = new Bar();
        $bar->doSomething();
        echo __METHOD__ . '|';
    }

}

$foo = new Foo();
$foo->doSomething();

/**
 * 以上代码是传统的实现思路
 * 那么使用依赖注入的思路是应用程序用到Foo类，Foo类需要Bar类，Bar类需要Bim类,那么首先创建Bim类,在创建Bar类并把
 * Bim 注入,再创建Foo类，并把Bar类注入,在调用Foo方法，Foo调用Bar方法,做其他工作
 */
// 代码【2】
class Bim
{
    public function doSomething()
    {
        echo __METHOD__, '|';
    }
}

class Bar
{
    private $bim;

    public function __construct(Bim $bim)
    {
        $this->bim = $bim;
    }

    public function doSomething()
    {
        $this->bim->doSomething();
        echo __METHOD__, '|';
    }
}

class Foo
{
    private $bar;

    public function __construct(Bar $bar)
    {
        $this->bar = $bar;
    }

    public function doSomething()
    {
        $this->bar->doSomething();
        echo __METHOD__;
    }
}

$foo = new Foo(new Bar(new Bim()));
$foo->doSomething(); // Bim::doSomething|Bar::doSomething|Foo::doSomething


/**
 * 总之容器负责实例化，注入依赖，处理依赖关系等工作
 * 以下是一个容器类(第1阶段)
 */
class Container
{
    private $s = [];

    public function __set($name, $value)
    {
        $this->s[$name] = $value;
    }

    public function __get($name)
    {
        return $this->s[$name]($this);
    }
}

$container = new Container();
$container->bim = function () {
    return new Bim();
};
$container->bar = function ($container) {
    return new Bar();
};

$container->foo = function ($container) {
    return new Foo();
};

$foo = $container->foo;
$foo->doSomething();


/**
 * 对以上代码进行优化(第2阶段)
 */
class Ioc
{
    protected static $registry = [];

    public static function bind($name, Callable $resolver)
    {
        static::$registry[$name] = $resolver;
    }

    public static function make($name)
    {
        if (isset(static::$registry[$name])) {
            $resolver = static::$registry[$name];
            return $resolver();
        }

        throw new Exception('Alias does not exist in the IoC registry');

    }

}

IoC::bind('bim', function () {
    return new Bim();
});

IoC::bind('bar',function(){
    return new Bar(IoC::make('bim'));
});

IoC::bind('foo',function(){
    return new Foo(Ioc::make('bar'));
});

$foo=IoC::make('foo');
$foo->doSomething();


/**
 *  (第三阶段)
    自动绑定（Autowiring）或 自动解析（Automatic Resolution）
    注释解析器（Annotations）
    延迟注入（Lazy injection）

 */
class Bim
{
    public function doSomething()
    {
        echo __METHOD__, '|';
    }
}

class Bar
{
    private $bim;

    public function __construct(Bim $bim)
    {
        $this->bim = $bim;
    }

    public function doSomething()
    {
        $this->bim->doSomething();
        echo __METHOD__, '|';
    }
}

class Foo
{
    private $bar;

    public function __construct(Bar $bar)
    {
        $this->bar = $bar;
    }

    public function doSomething()
    {
        $this->bar->doSomething();
        echo __METHOD__;
    }
}

class Container
{
    private $s = array();

    public function __set($k, $c)
    {
        $this->s[$k] = $c;
    }

    public function __get($k)
    {
        // return $this->s[$k]($this);
        return $this->build($this->s[$k]);
    }

    /**
     * 自动绑定（Autowiring）自动解析（Automatic Resolution）
     *
     * @param string $className
     * @return object
     * @throws Exception
     */
    public function build($className)
    {
        // 如果是匿名函数（Anonymous functions），也叫闭包函数（closures）
        if ($className instanceof Closure) {
            // 执行闭包函数，并将结果
            return $className($this);
        }

        /** @var ReflectionClass $reflector */
        $reflector = new ReflectionClass($className);

        // 检查类是否可实例化, 排除抽象类abstract和对象接口interface
        if (!$reflector->isInstantiable()) {
            throw new Exception("Can't instantiate this.");
        }

        /** @var ReflectionMethod $constructor 获取类的构造函数 */
        $constructor = $reflector->getConstructor();

        // 若无构造函数，直接实例化并返回
        if (is_null($constructor)) {
            return new $className;
        }

        // 取构造函数参数,通过 ReflectionParameter 数组返回参数列表
        $parameters = $constructor->getParameters();

        // 递归解析构造函数的参数
        $dependencies = $this->getDependencies($parameters);

        // 创建一个类的新实例，给出的参数将传递到类的构造函数。
        return $reflector->newInstanceArgs($dependencies);
    }

    /**
     * @param array $parameters
     * @return array
     * @throws Exception
     */
    public function getDependencies($parameters)
    {
        $dependencies = [];

        /** @var ReflectionParameter $parameter */
        foreach ($parameters as $parameter) {
            /** @var ReflectionClass $dependency */
            $dependency = $parameter->getClass();

            if (is_null($dependency)) {
                // 是变量,有默认值则设置默认值
                $dependencies[] = $this->resolveNonClass($parameter);
            } else {
                // 是一个类，递归解析
                $dependencies[] = $this->build($dependency->name);
            }
        }

        return $dependencies;
    }

    /**
     * @param ReflectionParameter $parameter
     * @return mixed
     * @throws Exception
     */
    public function resolveNonClass($parameter)
    {
        // 有默认值则返回默认值
        if ($parameter->isDefaultValueAvailable()) {
            return $parameter->getDefaultValue();
        }

        throw new Exception('I have no idea what to do here.');
    }
}

// ----
$c = new Container();
$c->bar = 'Bar';
$c->foo = function ($c) {
    return new Foo($c->bar);
};
// 从容器中取得Foo
$foo = $c->foo;
$foo->doSomething(); // Bim::doSomething|Bar::doSomething|Foo::doSomething

// ----
$di = new Container();

$di->foo = 'Foo';

/** @var Foo $foo */
$foo = $di->foo;

var_dump($foo);
/*
Foo#10 (1) {
  private $bar =>
  class Bar#14 (1) {
    private $bim =>
    class Bim#16 (0) {
    }
  }
}
*/

$foo->doSomething(); // Bim::doSomething|Bar::doSomething|Foo::doSomething


















