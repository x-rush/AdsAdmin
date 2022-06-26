<?php
require_once('tpl/head.php');
include_once('./system/dbConn.php');



//$sql6="select * from videotype where typename='电视剧'";
//$result6=mysqli_query($sql6);
//$row6=mysqli_fetch_assoc($result6);
//$tid6=$row6["tid"];
//
//$sql22="select * from videos where tid=$tid2 limit 6";
//$result22=mysql_query($sql22);
//
//$sql3="select * from videotype where typename='动画片'";
//$result3=mysql_query($sql3);
//$row3=mysql_fetch_assoc($result3);
//$tid3=$row3["tid"];
//
//$sql33="select * from videos where tid=$tid3 limit 6";
//$result33=mysql_query($sql33);
//
//$sql5="select * from videos   order by hittimes desc limit 4";
//$result5=mysql_query($sql5);
//$sql6="select * from videos   order by hittimes desc limit 4";
//$result6=mysql_query($sql6);
?>

<div class="container">
<!--幻灯片开始-->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="assets/images/img4.jpg" class="img-responsive" alt="img4">

           
        </div>
        <div class="item">
            <img src="assets/images/img2.jpg" class="img-responsive" alt="img2">

           
        </div>
        <div class="item">
            <img src="assets/images/img3.jpg" class="img-responsive" alt="img3">

            
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
<!--幻灯片结束-->



    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">

            <?php
            include 'system/dbConn.php';

            $res=mysqli_query($conn,"select * from videotype");
            while ($row=mysqli_fetch_assoc($res)) {
            ?>
            <div class="row text-center">
                <div class="col-xs-12 col-lg-12 mlist">
                    <h2><?php echo $row['typename']?></h2>
                    <ul class="list-inline row text-center">
                        <?php $tid=$row['tid']; $res1=mysqli_query($conn,"select * from video WHERE tid='$tid'limit 0,6");
                         while ($row1=mysqli_fetch_assoc($res1)) {
                        ?>
                        <li class="col-xs-4 col-sm-3 col-lg-2">
                            <img src="admin/pic/<?php echo $row1['pic']?>" class="responsive img-thumbnail"/>

                            <p><a href="show.php?vid=<?php echo $row1['vid']?>" ><?php echo $row1['videoname']?></a>
                            </p>
                        </li>
                        <?php
                        }
                        ?>
                    </ul>
<!--                    --><?php
//                    $sql5="select * from videotype where typename='电影'";
//                    $result5=mysqli_query($conn,$sql5);
//                    $row5=mysqli_fetch_assoc($result5);
//                    $tid5=$row5["tid"];
//                    ?>
                    <p><a class="btn btn-default" href="list.php?tid=<?php echo $tid ?>" role="button">更多 &raquo;</a></p>
                </div>
                <!--/.col-xs-6.col-lg-4-->

            </div>
                <?php
            }
            ?>
            <!--/row-->
        </div>
        <!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
            <div class="list-group text-center">
                <h2 style="color:white;" >排行</h2>
                <ul class="list-inline row text-center">
                    <?php  $res3=mysqli_query($conn,"select * from video  ORDER BY hittimes desc limit 4");
                    while ($row3=mysqli_fetch_assoc($res3)) {
                        ?>
                        <li class="col-xs-12 col-lg-6">
                            <img src="admin/pic/<?php echo $row3['pic']?>" class="responsive img-thumbnail"/>

                            <p><a href="show.php?vid=<?php echo $row3['vid']?>"><?php echo $row3['videoname']?></a>
                            </p>
                        </li>
                        <?php
                    }
                    ?>

                </ul>
            </div>

        </div>
        <!--/.sidebar-offcanvas-->
    </div>
    <!--/row-->

   

</div>
<!--/.container-->
 <?php
require_once('tpl/foot.php');
?>