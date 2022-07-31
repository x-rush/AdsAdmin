<?php
include '../system/dbConn.php';
$cid=$_GET['cid'];

$res=mysqli_query($conn,"delete  from comments WHERE cid='$cid'");

if ($res){
    echo '删除成功';
    header("refresh:3;url='commentList.php'");
}else{
    echo '删除失败';
    header("refresh:3;url='commentList.php'");
}