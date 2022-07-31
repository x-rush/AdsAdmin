
<?php
include '../system/dbConn.php';
$vid=$_POST['vid'];
$videoname=$_POST['videoname'];
$videotype=$_POST['videotype'];
$videointro=$_POST['videointro'];
$address=$_POST['videoaddress'];

if ($_FILES['pic']['error']>0){
    switch ($_FILES['pic']['error']){
        case 1:
            echo '文件过大';
            break;
        case 3:
            echo '部分未上传';
            break;
        case 4:
            $sql="update video set videoname='$videoname',tid='$videotype',intro='$videointro',address='$address' WHERE vid='$vid'";
            $res=mysqli_query($conn,$sql);
            echo '更新成功';
            header("refresh:3;url='videoList.php'");
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
        $sql1="select * from video WHERE vid='$vid'";
        $result=mysqli_query($conn,$sql1);
        $row1=mysqli_fetch_assoc($result);
        $filename=$filepath.$row1['pic'];

        if (file_exists($filename)){
            unlink($filename);
        }
        $sql2="update video set videoname='$videoname',tid='$videotype',intro='$videointro',address='$address',pic='$name' WHERE vid='$vid'";
        $ress=mysqli_query($conn,$sql2);
    }else{
        echo '上传失败';
        exit;
    }
    $num=mysqli_affected_rows($conn);
    if ($num!=1){
        echo '失败';
        echo "<a href='videoList.php'>返回</a>";
    }else{
        echo '更新成功';
        header("refresh:3;url='videoList.php'");
    }

}


?>




