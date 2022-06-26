<?php
require_once('tpl/header.php');
?>

    <form class="form-inline" action="dotypeedit.php" method="post">
        <?php
        $tid=$_GET['tid'];
        include '../system/dbConn.php';
        $res=mysqli_query($conn,"SELECT * FROM videotype WHERE tid='$tid'");
        $row=mysqli_fetch_assoc($res);

        ?>
        <div class="form-group">

            <p class="form-control-static">视频类别名称</p>
        </div>
        <div class="form-group">
            <input type="hidden" name="tid" value="<?php echo $row['tid'] ?>">
            <input type="text" name="typename" value="<?php echo $row['typename'] ?>" class="form-control" id="inputPassword2">
        </div>
        <button type="submit" class="btn btn-default">修改</button>
    </form>


<?php
require_once('tpl/footer.php');
?>