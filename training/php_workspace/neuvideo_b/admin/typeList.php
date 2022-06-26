<?php
require_once('tpl/header.php');
?>

    <table class="table table-striped">
        <th>编号</th>
        <th>名字</th>
        <th>操作</th>
        <?php
        include '../system/dbConn.php';
        $sql="select * from videotype";
        $res=mysqli_query($conn,$sql);

        while ( $row=mysqli_fetch_assoc($res)) {

            ?>
            <tr>
                <td><?php echo $row['tid']; ?></td>
                <td><?php echo $row['typename']; ?></td>
                <td><a href="dotype_delete.php?tid=<?php echo $row['tid']; ?>"  onclick="return confirm('确认删除吗？')">删除</a>|<a href="typeedit.php?tid=<?php echo $row['tid']; ?>">修改</a></td>
            </tr>

            <?php
        }
            ?>

<?php
require_once('tpl/footer.php');
?>