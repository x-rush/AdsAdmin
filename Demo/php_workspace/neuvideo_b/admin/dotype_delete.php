<?php
$tid=$_GET['tid'];

include '../system/dbConn.php';

$res=mysqli_query($conn,"delete  from videotype WHERE tid='$tid'");
if ($res){
    echo '删除成功';
    header("refresh:3;url='typelist.php'");
}else{
    echo '添加失败';
    echo "<a href='typelist.php'>返回</a>";
}
