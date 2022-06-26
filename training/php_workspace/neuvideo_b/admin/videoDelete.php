<?php
include '../system/dbConn.php';

$vid=$_GET['vid'];
$sql="select * from video WHERE vid='$vid'";

$result=mysqli_query($conn,$sql);

$row=mysqli_fetch_assoc($result);

$filename="pic/".$row['pic'];

if (file_exists($filename)){
    unlink($filename);

    $res=mysqli_query($conn,"delete  from video WHERE vid='$vid'");
    if ($res){
        echo '删除成功';
        header("refresh:3;url='videoList.php'");
    }else{
        echo '删除失败';
        echo "<a href='videoList.php'>返回</a>";
    }
}else{
    echo '删除失败';
    echo "<a href='videoList.php'>返回</a>";
}
