<?php
include '../system/dbConn.php';

$type=$_POST['typename'];

$sql="INSERT INTO videotype VALUES (NULL,'$type')";
$res=mysqli_query($conn,$sql);
if ($res){
    echo '添加成功';
    header("refresh:3;url='add_type.php'");
}else{
    echo '添加失败';
    echo "<a href='add_type.php'>返回</a>";
}
