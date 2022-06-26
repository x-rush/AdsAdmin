<?php
include '../system/dbConn.php';

session_start();
$admin=$_SESSION['adminname'];
$res=mysqli_query($conn,"select * from admins where admin_name='$admin'");
$row=mysqli_fetch_assoc($res);

$uplodadmin=$row['admin_id'];
$videoname=$_POST['videoname'];
$videotype=$_POST['videotype'];
$videointro=$_POST['videointro'];
$videoaddress=$_POST['videoaddress'];

if ($_FILES['pic']['error']>0){
    switch ($_FILES['pic']['error']){
        case 1:
            echo '文件过大';
            break;
        case 3:
            echo '部分未上传';
            break;
        case 4:
           echo '未上传';
            break;
        default:
            break;
    }
}else{
    $arr=explode(".", $_FILES["pic"]["name"]);

    $extension = end($arr);
    $allowedExts = array("gif", "jpeg", "JPG", "png","jpg","Bmp","flv");
    if (!in_array($extension,$allowedExts)){
        echo '文件格式错误';
        exit;
    }
    $filepath="pic/";
    $name=date("YmdHis").rand(100,999).".".$extension;
    if ( move_uploaded_file($_FILES["pic"]["tmp_name"], "$filepath" . $name))
    {
       $sql="insert into video VALUES (NULL ,'$videoname','$videotype','$name','$videointro',now(),'$uplodadmin',0,0,'$videoaddress')";
       $rs=mysqli_query($conn,$sql);
       if ($rs){
           echo '添加成功';
           header("refresh:3;url='videoAdd.php'");
       }else{
           echo '添加失败';
       }
    }else{
        echo '上传失败';
        exit;
    }
}