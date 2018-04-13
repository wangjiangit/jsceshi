
<?php
      session_start();
    /**
     * 登录页面Auth
     */
     $uri=$_SERVER['REQUEST_URI'];
    //登录用户
     $users=[
        [ 'name'=>'zhangsan', 'password'=>'123456']
     ];
     //权限点
     $nodes=[
        '/datatable.php'
     ];

     //公共函数
     function  toJson(Array $param=[]){
         header('Content-Type:application/json');
         echo json_encode($param);
         exit;
     }


     $Arr['name']=trim($_POST['name']);
     $Arr['password']=trim($_POST['password']);

     //验证
     if(empty($Arr['name']) || empty($Arr['password'])){
        toJson(['errcode'=>1,'errmsg'=>'用户名或密码不能为空']);
     }

     $isLogin=false;  //是否可以登录标识
     foreach($users as $key=>$value){
         if($value['name']==$Arr['name'] && $value['password']==$Arr['password']){
             $isLogin=true;
            break;
         }
     }


    if($isLogin){
        $_SESSION['xxkj_name']=$Arr['name'];
        $_SESSION['xxkj_password']=$Arr['password'];
        header('Location:'.$nodes[0]);
    }else{
        toJson(['errcode'=>1,'errmsg'=>'用户名或密码错误']);
    }

