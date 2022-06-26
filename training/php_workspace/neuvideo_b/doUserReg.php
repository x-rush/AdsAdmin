<?php
include 'system/dbConn.php';
$username=trim($_POST['username']);
$password=md5($_POST['password']);
$gender=$_POST['gender'];
$email=$_POST['email'];
$birthdate=$_POST['birthdate'];


$allowedExts = array("gif", "jpeg", "JPG", "png","jpg");
$temp = explode(".", $_FILES["pic"]["name"]);
$extension = end($temp);
$name=date("YmdHis").rand(100,999).".".$extension;
if (!in_array($extension,$allowedExts)){
    echo '文件格式错误';
    exit;
}
$filepath="images/";

if ( move_uploaded_file($_FILES["pic"]["tmp_name"], "$filepath" . $name))
{
    $sql="INSERT INTO users VALUES (NULL,'$username','$password',$gender,'$birthdate','$name','$email')";
    $retval = mysqli_query($conn,$sql);
}else{
    echo '上传失败';
    exit;
}

if(! $retval )
{
    die('无法插入数据: ' . mysqli_error($conn));
}
echo "注册成功\n";

header("refresh:3;url='index.php'");


