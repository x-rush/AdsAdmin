<?php
$uid=$_GET['uid'];

include '../system/dbConn.php';

$sql="select * from users WHERE uid='$uid'";

$res=mysqli_query($conn,$sql);

$row=mysqli_fetch_assoc($res);

$filename="../images/".$row['pic'];

if (file_exists($filename)){
    unlink($filename);
}

$date="delete  from users WHERE uid='$uid'";

$res1=mysqli_query($conn,$date);

if (mysqli_affected_rows($conn)){
    echo '删除成功';
    header("refresh:3;url='user_list.php'");
}else{

    echo '删除失败';
    echo "<a href='user_list.php'>返回</a>";
}

