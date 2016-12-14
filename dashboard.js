/**
 * Created by Administrator on 2016/10/17.
 */
/*

myApp.dashboard={
    "init":function(){
        alert('dashboard.init');
    },
    "setting":function(){

    }
};*/

myApp.dashboard=function($,window,undefined){

    //私有变量和方法,仅在该myApp中可用
    var message='这是消息2';

    function multiplier(x,y){
        return x*y;
    }

    //返回对象包括公共属性和公共方法
    return  {
        "init":function(){
            //初始化逻辑
        },
        "quality":16,
        "showMessage":function(){
            return message;
        }
    };

}(jQuery,window);
