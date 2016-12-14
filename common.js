/**
 * Created by Administrator on 2016/10/17.
 */

/*myApp={
    common:{
        init:function(){
            alert('common:init');
        },
        setting:function(){

        }
    }
};*/

//app命名空间，传入jQuery对象以缩短查找过程
myApp=function($,window,undefined){

    //私有变量和方法,仅在该myApp中可用
    var message='这是消息1';

    function multiplier(x,y){
        return x*y;
    }

    //返回对象包括公共属性和公共方法
    return  {
      "init":function(){
          //初始化逻辑
        },
        "quality":18,
        "specialNumber":function(){
            var num = multiplier(5,6);
            return num;
        }
    };
}(jQuery,window);
