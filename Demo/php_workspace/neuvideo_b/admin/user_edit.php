<?php
require_once('tpl/header.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>根据用户ID修改用户信息</title>
</head>
<body>
<h1>请修改用户信息</h1>

<form action="doUserEdit.php" method="post" enctype="multipart/form-data">
    <?php
    $uid=$_GET['uid'];
    include '../system/dbConn.php';
    $sql="select * from users WHERE uid='$uid'";
    $res=mysqli_query($conn,$sql);
    $row= mysqli_fetch_assoc($res);
    ?>
    <input type="hidden" name="uid" value="<?php echo $row['uid'] ?>">
<table border="1" class="table table-bordered">

    <tr>
        <td>用户名</td>
        <td><input type="text" name="username" value="<?php echo $row['uname'] ?>"></td>
    </tr>
    <tr>
        <td>性别</td>
        <td>
            <input type="radio" name="gender" value="0" <?php if ($row['gender']==0) echo 'checked'?>>男
            <input type="radio" name="gender" value="1" <?php if ($row['gender']==1) echo 'checked'?>>女
        </td>
    </tr>
    <tr>
        <td>生日</td>

        <td><input type="date" name="birthdate" value=<?php echo $row['birthdate'] ?> >
        </td>
    </tr>
    <tr>
        <td>头像</td>
        <td><input type="file" name="pic" >
            原头像 <img src="../images/<?php echo $row['pic'] ?>" width="100px"
                     height="100px">
        </td>
    </tr>
    <tr>
        <td>邮箱</td>
        <td><input type="email" name="email" value="<?php echo $row['email'] ?>" >
        </td>
    </tr>
    <tr >
        <td colspan="2"> <input type="submit" value="更新"></td>

    </tr>
</table>
</form>
</body>
</html>
<?php
require_once('tpl/footer.php');
?>
