<?php
require_once('tpl/head.php');
include_once('./system/dbConn.php');
?>

<div class="container">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">

            <div class="row">
                <?php
                include 'system/dbConn.php';
                $tid=$_GET['tid'];
                $res=mysqli_query($conn,"select * from videotype WHERE tid='$tid'");
                 $row=mysqli_fetch_assoc($res);
                ?>

                <div class="col-xs-12 col-lg-12 mlist">
                    <h2> <?php echo $row['typename'] ?></h2>
                    <ul class="list-inline row text-center">
                      <?php  $res1=mysqli_query($conn,"select * from video WHERE tid='$tid'limit 0,4");
                      while ($row1=mysqli_fetch_assoc($res1)) {
                       ?>
                        <li class="col-xs-6 col-lg-3">
                            <img src="admin/pic/<?php echo $row1['pic']?>" class="responsive img-thumbnail"/>

                            <p><a href="show.php?vid=<?php echo $row1['vid']?>"><?php echo $row1['videoname']?></a>
                            </p>
                        </li>
                       <?php
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

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
            <div class="list-group text-center" >
                <h2 style="color:white;">排行</h2>
                <ul class="list-inline row text-center">
<?php  $res2=mysqli_query($conn,"select * from video WHERE tid='$tid' ORDER BY hittimes desc limit 4");
while ($row2=mysqli_fetch_assoc($res2)) {
    ?>
                    <li class="col-xs-12 col-lg-6">
                        <img src="admin/pic/<?php echo $row2['pic']?>" class="responsive img-thumbnail"/>

                        <p><a href="show.php?vid=<?php echo $row2['vid']?>"><?php echo $row2['videoname']?></a>
                        </p>
                    </li>
    <?php
}
?>

                </ul>
            </div>

        </div>
    </div>
</div>
<?php
require_once('tpl/foot.php');
?>