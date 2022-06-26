<?php
$username=$_POST['username'];
$password=$_POST['password'];

include '../system/dbConn.php';

$sql="select * from admins WHERE admin_name='$username' AND password='$password'";

$res=mysqli_query($conn,$sql);

if ($num=mysqli_fetch_row($res)){
    session_start();//启动session，为存储数据做准备
    
    $_SESSION["adminname"]=$username;//存储登录名到session中
    echo '登陆成功，三秒后跳转到欢迎页';
    header("refresh:3;url='welcome.php'");
}else{
    echo '操作失败';
    header("refresh:3;url='index.php'");
}