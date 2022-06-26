<?php
require_once('tpl/head.php');
include_once('./system/dbConn.php');
?>

<?php
include 'system/dbConn.php';

$vid=$_GET['vid'];
$res=mysqli_query($conn,"select * from video WHERE vid='$vid'");
$row=mysqli_fetch_assoc($res);

$sqlupdatcishu="update video set hittimes=hittimes+1 WHERE vid='$vid'";
mysqli_query($conn,$sqlupdatcishu);
?>
<div class="container">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-12">


            <div class="row box">
                <div class="col-lg-4 text-center">

                    <video width="100%" height="345px" controls="controls" poster="admin/pic/<?php echo $row["pic"];?>">
                        <source src="<?php echo $row["address"];?>" type="video/mp4">  <!-- 视频地址 视频格式 -->
                        </video>
                    <p><?php echo $row['videoname']?></p>

                </div><!--放视频海报和标题-->
                <div class="col-lg-8 text-center">
                    <table class="table table-striped">

                       <tr>
                           <td>专栏</td>
                           <td><?php
                               $tid=$row['tid'];
                               $result=mysqli_query($conn,"select * from videotype WHERE tid='$tid'");
                               $row1=mysqli_fetch_assoc($result);
                               echo $row1['typename']?></td>
                       </tr>
                        <tr>
                            <td>上传时间</td>
                            <td><?php echo $row['uploaddate']?></td>
                        </tr>
                        <tr>
                            <td>点击次数</td>
                            <td><?php echo $row['hittimes']?></td>
                        </tr>
                        <tr>
                            <td>上传人</td>
                            <td><?php
                                $admin=$row['uploadadmin'];
                                $res1=mysqli_query($conn,"select * from admins WHERE admin_id='$admin'");
                                $row2=mysqli_fetch_assoc($res1);
                                echo $row2['admin_name']?></td>
                        </tr>
                        <tr>
                            <td>下载次数</td>
                            <td><?php echo $row['downtimes']?></td>
                        </tr>
                        <tr>
                            <td>有事找站长</td>
                            <td><a>意见箱</a></td>
                        </tr>
                        <tr>
                            <td>下载地址</td>
                            <td><a href="<?php echo $row['address']?>">点击这里下载</a></td>
                        </tr>
                        <tr>
                            <td>评分</td>
                            <td>1111111</td>
                        </tr>
                    </table>

                </div><!--表格显示视频详细信息-->


            </div>
            <!--/row-->
            <div class="row box">

                <div class="col-lg-12">
                    <h2 class="intro-text text-center">内容简介

                    </h2>

                    <div class="col-md-12">

                        <textarea class="form-control" rows="3" disabled="disabled"><?php echo $row['intro']?></textarea>

                    </div>
                </div>

            </div>  <!--/row-->

            <div class="row box">

                    <div class="col-lg-12">
                        <h2 class="intro-text text-center">留言列表

                        </h2>
                        <table class="table">
                           <tr>
                               <th>编号</th>
                               <th>留言内容</th>
                               <th>留言时间</th>
                               <th>留言人</th>
                           </tr>
                            <?php
                            $res2=mysqli_query($conn,"select * from comments WHERE vid='$vid' ORDER BY cdate DESC limit 10");
                            $i=1;
                            while ($row3=mysqli_fetch_assoc($res2)) {
                                ?>
                                 <tr>
                                     <td><?php echo $i++ ?></td>
                                     <td><?php echo $row3['content'] ?></td>
                                     <td><?php echo $row3['cdate']  ?></td>
                                     <td><?php
                                         $uid=$row3['uid'];
                                         $username=mysqli_fetch_assoc(mysqli_query($conn,"select * from users WHERE uid='$uid'"));
                                         echo $username['uname']  ?></td>
                                 </tr>

                                <?php
                            }
                            ?>
                        </table>
                    </div>
            </div>  <!--/row-->
            <form action="doComment.php" method="post">
            <div class="row box">
            <?php

            if(isset($_SESSION['username']))
            {
                ?>
                    <div class="col-lg-12">
                        <h2 class="intro-text text-center">请留言
                        <input type="hidden" name="vid" value="<?php echo $row['vid'] ?>" >
                        </h2>
                        <div class="col-md-12">

                            <textarea class="form-control" rows="3" name="comment"></textarea>

                        </div>
                        <div class="col-md-12">

                            <button type="submit" class="btn btn-default btn-lg" style="text-align: center">提交评论</button>
                        </div>
                    </div>

            <?php
            }else {
                ?>
                <div class="col-lg-12">
                    <h2 class="intro-text text-center">请先<a href="#" data-toggle="modal" data-target="#login1">登陆</a>后留言</h2>
                </div>
                <?php
            }
                ?>
            </div>  <!--/row-->
            </form>
        </div>
        <!--/.col-xs-12.col-sm-12-->
        <!-- /登录模态框开始 -->
        <div class="modal fade" id="login1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">登陆</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" action="./dologin.php" method="post">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-2 control-label">用户名</label>
                                <div class="col-md-10">
                                    <input type="hidden" value="<?php echo $row['vid']; ?>" name="vid">
                                    <input type="text" name="username" class="form-control" id="inputEmail3" placeholder="Username">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-md-2 control-label">密码</label>
                                <div class="col-md-10">
                                    <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">Sign in</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" onclick="location.replace('index.php')" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /登录模态框结束 -->
    </div>

</div>

<?php
require_once('tpl/foot.php');
include_once('./system/dbConn.php');
?>
