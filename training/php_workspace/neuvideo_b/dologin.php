<?php

$username=$_POST['username'];
$password=$_POST['password'];

include 'system/dbConn.php';

$sql="select * from users WHERE uname='$username' AND password=md5('$password')";

$res=mysqli_query($conn,$sql);

if ($num=mysqli_fetch_assoc($res)){
    session_start();//启动session，为存储数据做准备
    $_SESSION["username"]=$num['uname'];//存储登录名到session中
    $_SESSION["uid"]=$num['uid'];//存储登录名到session中
    if (isset($_POST['vid'])){
        $vid=$_POST['vid'];
        echo '登陆成功';
        header("refresh:3;url='show.php?vid=$vid'");
    }else{
        echo '登陆成功，三秒后跳转到欢迎页';
        header("refresh:3;url='index.php'");
    }

}else{
    echo '操作失败';
    header("refresh:3;url='index.php'");
}