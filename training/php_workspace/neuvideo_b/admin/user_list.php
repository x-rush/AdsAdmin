<?php
require_once('tpl/header.php');
?>
<!DOCTYPE html>
<html >
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <link rel="stylesheet" href="../bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <title>用户信息列表页</title>

</head>

<body>
<table border="1" align="center" class="table table-bordered">
    <?php

    include '../system/dbConn.php';
    $sql='select * from users';
    $res=mysqli_query($conn,$sql);
    $num= mysqli_num_rows($res);
    if (!isset($_GET['page'])){
        $page=1;
    }else{
        $page=$_GET['page'];
    }
    //分移量
    $rowpage=5;
    if ($num==0){
        echo '无记录';
        exit;
    }

    if ($num%$rowpage==0){
        $totalpages=$num/$rowpage;
    }else{
        $totalpages=ceil($num/$rowpage);
    }
    $start=($page-1)*$rowpage;

    ?>
    <caption>注册用户信息列表（共<?php echo $num ?>名用户)</caption>
    <tr class="active">
        <th>用户编号</th>
        <th>用户名</th>
        <th>性别</th>
        <th>生日</th>
        <th>头像</th>
        <th>电子邮件</th>
        <th>操作</th>
    </tr>
    <?php
    if (isset($_GET['key'])){
        $key=trim($_GET['key']);
        $sql="select * from users WHERE uname LIKE '%{$key}%' limit $start,$rowpage";
    }
    else{
        $sql="select * from users limit $start,$rowpage";
    }
    $result=mysqli_query($conn,$sql);
    while ($row=mysqli_fetch_assoc($result)) {
        ?>
        <tr class="active">
            <td><?php echo $row['uid']; ?></td>
            <td><?php echo $row['uname']; ?></td>
            <td><?php if ($row['gender'] == 0) {
                    echo  '男';
                } else {
                    echo  '女';
                } ?>
            </td>
            <td><?php echo $row['birthdate']; ?></td>
            <td><img src="../images/<?php echo $row['pic']; ?>" width="100px" height="100px"></td>
            <td><?php echo $row['email']; ?></td>
            <td><a href="user_edit.php?uid=<?php echo $row['uid']; ?>">修改</a>|<a href="doUserDelete.php?uid=<?php echo $row['uid']; ?>" onclick="return confirm('确定删除么')">删除</a></td>
        </tr>
        <?php
    }
    ?>


</table>
<table align="center" width="70%">
    <tr>
        <td colspan="8" align="center">

            <?php
            echo "共".$num."条记录 分".$totalpages."页 ";
            if (isset($_GET['key'])){
                $key=$_GET['key'];
            }

            if ($page>1){
                $first="<a href=?page=1>首页</a>";
                $pre="<a href=?page=".($page-1).">上一页</a>";
            }else{
                $first='首页';
                $pre='前一页';
            }
            if ($page<$totalpages){
                $last="<a href=?page=$totalpages>尾页</a>";
                $next="<a href=?page=".($page+1).">下一页</a>";
            }else{
                $last='尾页';
                $next='下一页';
            }
            echo $first."&nbsp;".$pre."&nbsp;";
            for ($i=1;$i<=$totalpages;$i++){
                echo "<a href=?page={$i}>&nbsp;第{$i}页&nbsp;</a>";

            }
            echo  $last."&nbsp;".$next."&nbsp;";
            ?>

        </td>
        <tr>
        <td align="center">
            <form action="" method="get">
            <input type="text" name="key" >
            <input type="submit" value="搜索">
            </form>
        </td>
        </tr>

    </tr>
</table>

</body>
</html>

<?php
require_once('tpl/footer.php');
?>