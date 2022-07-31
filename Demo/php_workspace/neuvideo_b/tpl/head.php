<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>视频信息管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="assets/css/offcanvas.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
    <script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<nav class="navbar navbar-fixed-top navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.php">首页</a></li>

          <?php
          include 'system/dbConn.php';
          session_start();
          $res=mysqli_query($conn,"select * from videotype");
          while ($row=mysqli_fetch_assoc($res)) {
              ?>
              <li><a href="list.php?tid=<?php echo $row['tid']?>"><?php echo $row['typename']?></a></li>
              <?php
          }
          ?>
      </ul>
      <form class="navbar-form navbar-left" role="search" action="./search.php" method="post">
        <div class="form-group">
          <input type="text" name="content" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
          <?php

          if(isset($_SESSION['username']))
          {
          ?>
              <li><a><?php echo '欢迎'.$_SESSION['username']; ?></a></li>

                  <li><a href="./loginout.php">注销</a></li>
              <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                 aria-haspopup="true" aria-expanded="false">个人中心<span class="charset"></span></a>
              <ul class="dropdown-menu">
                  <li><a href="#" data-toggle="modal" data-target="#changePassword">修改个人密码</a></li>
                  <li><a href="#" data-toggle="modal" data-target="#changeInfor">修改个人信息</a></li>
                  <li><a href="./mycomment.php">我的评价</a></li>
              </ul>
              </li>



              <?php
          }else {
          ?>
              <li><a href="#" data-toggle="modal" data-target="#login">登录</a></li>
              <li><a href="#" data-toggle="modal" data-target="#reg">注册</a></li>
              <?php
          }
          ?>

      
      </ul>


    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- /.navbar -->
<!-- /注册模态框 -->
 <div class="modal fade" id="reg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">registration</h4>
      </div>
      <div class="modal-body">

          <form class="form-horizontal" action="doUserReg.php" method="post" enctype="multipart/form-data">
              <div class="form-group">
                  <label for="inputUser" class="col-md-2 control-label">用户名</label>
                  <div class="col-md-6">
                      <input type="text" class="form-control" id="user" name="username" placeholder="用户名">
                  </div>
              </div>

              <div class="form-group">
                  <label for="inputPassword3" class="col-md-2 control-label">密码</label>
                  <div class="col-md-6">
                      <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="密码">
                  </div>
              </div>

              <div class="form-group">
                  <label  class="col-md-2 control-label">性别</label>
                  <div class="col-md-6">
                      <label class="radio-inline">
                          <input type="radio" name="gender"  id="inlineRadio1" value="0"> 男
                      </label>
                      <label class="radio-inline">
                          <input type="radio" name="gender" id="inlineRadio2" value="1"> 女
                      </label>
                  </div>
              </div>

              <div class="form-group">
                  <label  class="col-md-2 control-label">生日</label>
                  <div class="col-md-6">
                      <input type="date" class="form-control"  name="birthdate" placeholder="密码">
                  </div>
              </div>

              <div class="form-group">
                  <label for="inputPassword3" class="col-md-2 control-label">头像</label>
                  <div class="col-md-6">
                      <input type="file"  name="pic" placeholder="密码">
                  </div>
              </div>

              <div class="form-group">
                  <label for="inputPassword3" class="col-md-2 control-label">邮箱</label>
                  <div class="col-md-6">
                      <input type="email"  name="email" placeholder="邮箱">
                  </div>
              </div>


              <div class="form-group">
                  <div class="col-sm-offset-2 col-md-6">
                      <input type="submit" name="提交" class="btn btn-default">
                      <input type="reset" name="重置" class="btn btn-default">
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
<!-- /注册模态框结束 -->
<!-- /登录模态框开始 -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
<!--                      <input type="hidden" value="">-->
                      <input type="text" name="username" class="form-control" id="inputEmail3" placeholder="Username">
                  </div>
              </div>
              <div class="form-group">
                  <label for="inputPassword3" class="col-md-2 control-label">密码</label>
                  <div class="col-md-10">
                      <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
                  </div>
              </div>
<!--              <div class="form-group">-->
<!--                  <div class="col-sm-offset-2 col-sm-10">-->
<!--                      <div class="checkbox">-->
<!--                          <label>-->
<!--                              <input type="checkbox"> Remember me-->
<!--                          </label>-->
<!--                      </div>-->
<!--                  </div>-->
<!--              </div>-->
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

<!--修改密码-->
<div class="modal fade" id="changePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">登陆</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="./douserpassword.php" method="post">

                    <div class="form-group">
                        <label for="inputPassword3" class="col-md-2 control-label">原密码</label>
                        <div class="col-md-10">
                            <input type="text" name="oldpassword" class="form-control" id="inputPassword3" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-md-2 control-label">新密码</label>
                        <div class="col-md-10">
                            <input type="text" name="newpassword" class="form-control" id="inputPassword3" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-md-2 control-label">确认密码</label>
                        <div class="col-md-10">
                            <input type="text" name="renewpassword" class="form-control" id="inputPassword3" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">确定</button>
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

<!--修改个人信息-->
<div class="modal fade" id="changeInfor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">修改信息</h4>
            </div>
            <div class="modal-body">

                <?php
                $userid=$_SESSION['uid'];
                $rsss=mysqli_query($conn,"select * from users WHERE uid='$userid'");
                $ress=mysqli_fetch_assoc($rsss);
                ?>
                <form class="form-horizontal" action="./douseredit.php" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="inputUser" class="col-md-2 control-label">用户名</label>
                        <div class="col-md-6">
                            <input type="hidden" name="uid" value="<?php echo $ress['uid'] ?>">
                            <input type="text" class="form-control" id="user" name="username" placeholder="用户名" value="<?php echo $ress['uname'] ?>">
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-md-2 control-label">性别</label>
                        <div class="col-md-6">
                            <label class="radio-inline">
                                <input type="radio" name="gender"  id="inlineRadio1" value="0" <?php if ($ress['gender']==0) echo 'checked'?>> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio2" value="1" <?php if ($ress['gender']==1) echo 'checked'?>> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-md-2 control-label">生日</label>
                        <div class="col-md-6">
                            <input type="date" class="form-control"  name="birthdate"  value=<?php echo $ress['birthdate'] ?>>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-md-2 control-label">头像</label>
                        <div class="col-md-6">
                            <input type="file"  name="pic" placeholder="密码">
                            原头像 <img src="./images/<?php echo $ress['pic'] ?>" width="100px"
                                     height="100px">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-md-2 control-label" >邮箱</label>
                        <div class="col-md-6">
                            <input type="email"  name="email" placeholder="邮箱" value="<?php echo $ress['email'] ?>">
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-offset-2 col-md-6">
                            <input type="submit" name="提交" class="btn btn-default">
                            <input type="reset" name="重置" class="btn btn-default">
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