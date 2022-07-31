<?php
include 'system/dbConn.php';

$cid=$_POST['cid'];
$content=$_POST['content'];

$res=mysqli_query($conn,"update comments set content='$content' WHERE cid='$cid'");

if ($res){
    echo '修改成功';
    header("refresh:3;url='mycomment.php'");
}else{
    echo '修改失败';
    header("refresh:3;url='mycomment.php'");
}