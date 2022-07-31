<?php
require_once('tpl/head.php');
include_once('./system/dbConn.php');
?>

<div class="container">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">

            <div class="row">

                <div class="col-xs-12 col-lg-12 mlist">

                    <?php
                    include 'system/dbConn.php';
                    $userid=$_SESSION["uid"];
                    $res=mysqli_query($conn,"select * from comments WHERE uid='$userid'");
                    ?>
                    <form>
                        <h1 align="center">留言列表</h1>
                        <table class="table">
                            <tr>
                                <th>序号</th>
                                <th>视频名称</th>
                                <th>评价内容</th>
                                <th>发表评论的时间</th>
                                <th>操作</th>
                            </tr>
                            <?php

                            while ($row=mysqli_fetch_assoc($res)) {
                                ?>
                                <tr>
                                    <td>
                                        <?php echo $row['cid'] ?>
                                    </td>
                                    <td>
                                        <?php
                                        $vid=$row['vid'];
                                        $usrs=mysqli_fetch_assoc(mysqli_query($conn,"select * from video WHERE vid='$vid'"));
                                        echo $usrs['videoname'] ?>
                                    </td>
                                    <td>
                                        <?php
                                        echo $row['content'] ?>
                                    </td>
                                    <td>
                                        <?php echo $row['cdate'] ?>
                                    </td>
                                    <td>
                                        <a href="usercommentdelete.php?cid=<?php echo $row['cid'] ?>">删除</a>

                                        <a href="usercommentedit.php?cid=<?php echo $row['cid'] ?>" >修改</a>
                                    </td>
                                </tr>
                                <?php
                            }
                            ?>
                        </table>
                    </form>


                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        function edit() {
            $("#Edit_content");
        }
    </script>

</div>

<?php
require_once('tpl/foot.php');
?>
