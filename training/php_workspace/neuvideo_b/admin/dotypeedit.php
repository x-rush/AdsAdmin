<?php
$tid=$_POST['tid'];
$typename=$_POST['typename'];
include '../system/dbConn.php';
$res=mysqli_query($conn,"update videotype set typename='$typename'WHERE tid='$tid'");
if ($res){
    echo '修改成功';
    header("refresh:3;url='typeList.php'");
}else{

    echo '修改失败';
    echo "<a href='typeList.php'>返回</a>";
}

