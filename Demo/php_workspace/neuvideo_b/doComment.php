<?php
include 'system/dbConn.php';
session_start();
$uid=$_SESSION['uid'];
$content=$_POST['comment'];
$vid=$_POST['vid'];
$cdate=date("Y-m-d H:i:s", time());
$res=mysqli_query($conn,"insert into comments VALUES (NULL ,'$content','$cdate','$uid','$vid')");
if ($res){

    echo '评论成功';
    header("refresh:3;url='show.php?vid=$vid'");
}else{
    echo '评论失败';
    header("refresh:3;url='show.php?vid=$vid'");
}