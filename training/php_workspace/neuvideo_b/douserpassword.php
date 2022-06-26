<?php

include 'system/dbConn.php';

$Password=$_POST['oldpassword'];
$newPassword=$_POST['newpassword'];
$rePassword=$_POST['renewpassword'];

session_start();
$admin=$_SESSION["uid"];

$sql="select * from users WHERE uid='$admin'";
$res=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($res);
$pass=$row['password'];
if ($pass==md5($Password)){
    if ($newPassword==$rePassword){
        $newpass=md5($newPassword);
        $sqll="UPDATE users set password='$newpass' WHERE uid='$admin'";
        mysqli_query($conn,$sqll);
        echo '更新密码成功';

        session_destroy();
        header("refresh:3;url='index.php'");
    }else{
        echo '密码不一致';
        header("refresh:3;url='index.php'");
    }
}else{
    echo '原密码错误';
    header("refresh:3;url='index.php'");
}