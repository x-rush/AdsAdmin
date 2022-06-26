<?php
include '../system/dbConn.php';
$Password=$_POST['Password'];
$newPassword=$_POST['newPassword'];
$rePassword=$_POST['rePassword'];

session_start();
$admin=$_SESSION["adminname"];

$sql="select * from admins WHERE admin_name='$admin'";
$res=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($res);
$pass=$row['password'];

if ($pass==md5($Password)){
    if ($newPassword==$rePassword){
        $newpass=md5($newPassword);
        $sqll="UPDATE admins set password='$newpass' WHERE admin_name='$admin'";
        mysqli_query($conn,$sqll);
        echo '更新密码成功';
        header("refresh:3;url='changePassword.php'");
    }else{
        echo '密码不一致';
        header("refresh:3;url='changePassword.php'");
    }
}else{
    echo '原密码错误';
    header("refresh:3;url='changePassword.php'");
}