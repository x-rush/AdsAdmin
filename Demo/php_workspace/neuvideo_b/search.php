<?php
require_once('tpl/head.php');
include_once('./system/dbConn.php');

?>

    <div class="container">

        <div class="row row-offcanvas row-offcanvas-right">

            <div class="col-xs-12 col-sm-9">

                <div class="row">

                    <div class="col-xs-12 col-lg-12 mlist">
                        <h2>搜索结果</h2>
                        <ul class="list-inline row text-center">
                            <?php
                            include 'system/dbConn.php';
                            if ($_POST['content']) {
                                $contet = trim($_POST['content']);
                                $sql1 ="select * from video where videoname like '%{$contet}%'";
                                $result = mysqli_query($conn, $sql1);
                                while ($row1 = mysqli_fetch_assoc($result)) {

                                    ?>
                                    <li class="col-xs-6 col-lg-3">
                                        <img src="admin/pic/<?php echo $row1['pic'] ?>" class="responsive img-thumbnail"/>

                                        <p>
                                            <a href="show.php?vid=<?php echo $row1['vid'] ?>"><?php echo $row1['videoname'] ?></a>
                                        </p>
                                    </li>
                                    <?php
                                }
                            }
                            ?>

                        </ul>
                        <nav class="text-center">
                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>


                    </div>

                </div>
            </div>

        </div>

    </div>

<?php
require_once('tpl/foot.php');
?>