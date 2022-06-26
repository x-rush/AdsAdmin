<?php /* Smarty version Smarty-3.1.6, created on 2019-05-12 19:32:24
         compiled from "./Home/Tpl\Index\index.html" */ ?>
<?php /*%%SmartyHeaderCode:12143291425cd80448c61962-51158832%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a0df498f3fa8ed5d3704c11b76d93149f0b249f5' => 
    array (
      0 => './Home/Tpl\\Index\\index.html',
      1 => 1446612480,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12143291425cd80448c61962-51158832',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'threeVideo' => 0,
    'three' => 0,
    'newvideo' => 0,
    'vith' => 0,
    'newlib' => 0,
    'new' => 0,
    'bestnote' => 0,
    'note' => 0,
    'notice' => 0,
    'vo' => 0,
    'video' => 0,
    'vi' => 0,
    'videocat' => 0,
    'vcat' => 0,
    'clickvideo' => 0,
    'click' => 0,
    'library' => 0,
    'lib' => 0,
    'hotuser' => 0,
    'hot' => 0,
    'notehotuser' => 0,
    'notehot' => 0,
    'cat' => 0,
    'tt' => 0,
    'ques' => 0,
    'qv' => 0,
    'flink' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd80448d4429',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd80448d4429')) {function content_5cd80448d4429($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_truncate')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.truncate.php';
if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>在线教学网</title>
       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/biquu.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/kandytabs.css">
        
        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <style type="text/css">
		body{font-family:"Microsoft Yahei";}
        /*ipad fix*/
        @media (min-width:992px){
            .home_module .m_cover_list li:nth-last-child(-n+2) {
                display: none;
            }
        }
        @media (min-width:1200px){
            .home_module .m_cover_list li:nth-last-child(-n+2) {
                *display: inline;
                display: inline-block;
                zoom:1;
            }
        }
        .content_load{
            display: none;
            text-align: center;
        }
        .ml10{
            margin-left:100px;
        }
       
        #wrapper .navbar-form input{width: 60px;}
    </style>
    <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="__PUBLIC__/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="__PUBLIC__/js/index.js"></script>
    <script type="text/javascript" src="__PUBLIC__/js/application.js"></script>
    <script type="text/javascript" src="__PUBLIC__/js/retina.js"></script>
    
    
    <script type="text/javascript">
    $(function(){
        // 导航搜索框
        $('#wrapper .navbar-form input').focus(function(){
            $(this).attr('placeholder', '视频、资源、手记、帖子')
            //$(this).parents('.navbar-form').eq(0).addClass('search_opend')
            $(this).animate({width: '+250px'}, "slow");
            $("#userinfo").fadeOut("fast");
        }).blur(function(){
            $(this).attr('placeholder', '搜索')
            //$(this).parents('.navbar-form').eq(0).removeClass('search_opend')
            $(this).animate({width: '60px'}, "slow");
            $("#userinfo").show(1000);
        })       
        //设置头部的图片滚动
        
    })
    </script>
    </head>

    <body style="" class="loaded">
    <div id="browser"></div>
    <i class="icon-refresh icon-spin f16"></i>
    
    <div id="wrapper">
        
        <div class="header-navigation navbar-dynamic navbar navbar-default navbar-fixed-top loaded navbar-transparent" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">切换导航</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                        <a class="navbar-brand animated" href="" style="background:url('__PUBLIC__/images/logo-bq.png') no-repeat center"><span class="animated">E-Sch</span></a>
                </div>

                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav g_nav">
                        <li><a href="__APP__/Video/index" class="btn btn-primary btn-signup animated">教学视频</a></li>
                        <li><a href="__APP__/Note/index" class="btn btn-primary btn-signup animated">教学笔记</a></li>
                        <li><a href="__APP__/Library/index" class="btn btn-primary btn-signup animated">教学资料</a></li>
                        <li><a href="__APP__/Message/index" class="btn btn-primary btn-signup animated">交流论坛</a></li>
                        <?php if ($_SESSION['user']){?>
                            <li><a href="__APP__/Test/index" class="btn btn-primary btn-signup animated">在线考试</a></li>
                            <?php }else{ ?>
                            <li><a href="javascript:alert('请先登录！')" class="btn btn-primary btn-signup animated">在线考试</a></li>
                            <?php }?>
                    </ul>

                        <form class="navbar-form navbar-right" role="search" action="__APP__/Cat/show" method="GET" autocompelte="off">
                            <div class="form-group">
                                <input type="text" name="q" class="form-control" placeholder="搜索">
                            </div>
                            <button type="submit" class="btn btn-default"><i class="icon-search"></i></button>
                        </form>
                    <script type="text/javascript" charset="utf-8">
                        //定义存放图片信息的变量
                        var list = null;
                        var m=0;//定义图片播放时的变量控制
                        var mytime = null;//计时事件变量
                        
                        //当页面加载完以后载入所有图片
                        window.onload = function(){
                            //获取所有图片对象
                            list = document.getElementsByClassName("tabcont");
                            doMouse();//调用函数 图片自动变换
                        }
                        //定义鼠标动作函数
                        function doMouse(){
                            if (mytime==null) {
                                //设置图片计时操作
                                mytime = setInterval(doPlay,2000);
                            }else{
                                clearInterval(mytime);
                                mytime = null;
                            }
                        }
                        //定义图片定时函数
                        function doPlay(){
                            doShow(m);
                            m++;
                            //若m的值等于图片总个数 则恢复初始化值
                            if (m == list.length) {
                                m=0;
                            };
                        }
                        //定义图片显示的函数
                        function doShow(n){
                            //循环遍历图片显示
                            for (var i = 0; i < list.length; i++) {
                                if (i==n) {
                                    //list[i].attribute("class") = "tabcont active";
                                    list[i].style.opacity = "1";
                                }else{
                                    //list[i].attribute("class") = "tabcont";
                                    list[i].style.opacity = "0";
                                }
                            }
                        }
                    </script>
                    
                    <?php if ($_SESSION['user']){?>
                        <ul class="nav navbar-nav navbar-right" id="userinfo">
                            <li class="navbar-nav-user animated">
                                <a class="user-avatar" href="__APP__/Users/myedu" style="height:60px">
                                    <img alt="<?php echo $_SESSION['user']['username'];?>
" title="<?php echo $_SESSION['user']['username'];?>
" <?php if ($_SESSION['user']['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/0.jpg"<?php }else{ ?>src="__PUBLIC__/Uploads/users/<?php echo $_SESSION['user']['username'];?>
/s_<?php echo $_SESSION['user']['picture'];?>
"<?php }?> class="avatar_sm">　<?php echo $_SESSION['user']['username'];?>
</a>
                            </li>
                            <li><a href="__APP__/Users/loginout" class="user-avatar animated">注销</a></li>
                        </ul>

                    <?php }else{ ?>

                        <ul class="nav navbar-nav navbar-right" id="userinfo">
                            <li><a href="__APP__/Users/index" class="btn btn-primary btn-signup animated">注 册</a></li>
                            <li><a href="__APP__/Users/login" class="btn btn-primary btn-signup animated">登录</a></li>
                        </ul>
                    
                    <?php }?>
                    
                </div>
            </div>
        </div>

        <ul id="postshow" class="kandyLoop active">
 
            <li class="tabbody" style="position: relative; overflow: hidden; height: 450px;">
            
            <?php  $_smarty_tpl->tpl_vars['three'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['three']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['threeVideo']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['three']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['three']->key => $_smarty_tpl->tpl_vars['three']->value){
$_smarty_tpl->tpl_vars['three']->_loop = true;
 $_smarty_tpl->tpl_vars['three']->iteration++;
?>
            <div class="tabcont active" onmouseover="doMouse()" onmouseout="doMouse()" style="display: block; float: left; position: absolute; width: 100%; z-index: 0;">
                <div class="page-header dynamic-height" style="background-image:url(__PUBLIC__/Uploads/video_first/<?php echo $_smarty_tpl->tpl_vars['three']->iteration;?>
.jpg)">
                    <div class="container" style="margin:0 auto">
                        <div class="postshow-intro-wrap col-md-4" style="opacity: 1;">
                            <div class="postshow-intro">
                                <h3><font color="white"><?php echo $_smarty_tpl->tpl_vars['three']->value['videoname'];?>
</font></h3>
                                <br>
                                
                                <div class="m_info">
                                    点击率 <i><?php echo $_smarty_tpl->tpl_vars['three']->value['clicknum'];?>
</i>
                                    <a href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['three']->value['id'];?>
" title="查看详情" class="m_detail">查看详情</a>
                                </div>
                                <p>
                                    简介： <?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['three']->value['descr'],80,"...");?>

                                </p>
                            </div>
                        </div>
                    </div>
                        <a href="__APP__/Video/play/id/<?php echo $_smarty_tpl->tpl_vars['three']->value['id'];?>
" class="play-btn" title="点击播放"><i class="icon-play"></i></a>
                </div>
            </div>
            <?php } ?>
            
            </li>
            <!--<li class="tabnav">
            <em class="tabprev" title="点一下就显示前一张图片">‹</em>
            <span class="tabpage">
                <b class="tabnow">1</b>
                <i>&nbsp;/&nbsp;</i>
                <b class="taball">5</b>
            </span>
            <em class="tabnext" title="点一下就显示下一张图片">›</em>
            </li>-->
        </ul>



        
        <div class="home_module m_hot">
            <div class="container">
                <div class="col-md-2">
                    <h2><a href="javascript:void(0)">最新热点</a></h2>
                    <ul>
                        <li><a href=""></a></li>
                        <li><a href="__APP__/Note/index">课堂笔记</a></li>
                        <li><a href="__APP__/Library/index">资料库</a></li>
                    </ul>
                </div>
                <div class="col-md-7" style="height:550px">
                    <div class="tt">
                        <h3>最新教学视频</h3>
                    </div>
                    <div class="hot-content-list">
                        
                        
                        
                        <div class="hot-c-r" style='width:100%'>
                            
                            
                            <div class="hot-comment">
                                <div class="hot-comment-title">最新更新 Top-Three</div>
                                <ul>
                                    <?php  $_smarty_tpl->tpl_vars['vith'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vith']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['newvideo']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vith']->key => $_smarty_tpl->tpl_vars['vith']->value){
$_smarty_tpl->tpl_vars['vith']->_loop = true;
?>

                                    <li style="width:150px;margin-left:5px;float:left">

                                        <div class="item_cover" style="width:150px">
                                            <img alt="<?php echo $_smarty_tpl->tpl_vars['vith']->value['videoname'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['vith']->value['videoname'];?>
" style="width:150px;height:140px;" src="__PUBLIC__/Uploads/videopic/<?php echo $_smarty_tpl->tpl_vars['vith']->value['picname'];?>
">
                                        </div>
                                        <span class="title"><a href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['vith']->value['id'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['vith']->value['tid'];?>
"><?php echo $_smarty_tpl->tpl_vars['vith']->value['videoname'];?>
</a>
                                        </span>
                                    </li>
                                    <?php } ?>
                                </ul>
                               
                            </div>
                            
                            <div style="clear:both"></div><br>
                            <div class="hot-comment">
                                <div class="hot-comment-title">最热度 Top-Three</div>

                                    <?php  $_smarty_tpl->tpl_vars['new'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['new']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['newlib']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['new']->key => $_smarty_tpl->tpl_vars['new']->value){
$_smarty_tpl->tpl_vars['new']->_loop = true;
?>
                                    <div class="hot-com-list" style="height:25px">
                                        <div class="hot-comment-content">
                                            <a style='width:200px;float:left;border:0px solid red' href="__APP__/Library/detail/id/<?php echo $_smarty_tpl->tpl_vars['new']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['new']->value['title'];?>
</a>　
                                            <small>
                                                <span>上传者</span><a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['new']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['new']->value['username'];?>
</a>
                                                time:<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['new']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                                            </small>
                                        </div>
                                    </div>
                                    <?php } ?>
                            </div>
                            
                            <div class="hot-comment">
                                <div class="hot-comment-title">笔记 Top-Three</div>

                                    <?php  $_smarty_tpl->tpl_vars['note'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['note']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['bestnote']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['note']->key => $_smarty_tpl->tpl_vars['note']->value){
$_smarty_tpl->tpl_vars['note']->_loop = true;
?>
                                    <div class="hot-com-list">
                                        <div class="hot-comment-content"><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['note']->value['content'],40,"...");?>
</div>
                                        <div class="hot-comment-info">
                                            <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['note']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['note']->value['username'];?>
</a>
                                            <span>创建手记</span>
                                            <a href="__APP__/Note/detail/id/<?php echo $_smarty_tpl->tpl_vars['note']->value['nid'];?>
">《<?php echo $_smarty_tpl->tpl_vars['note']->value['title'];?>
》</a>
                                        </div>
                                    </div>
                                    <?php } ?>
                            </div>
                        
                        </div>
                        

                    </div>
                </div>
                <div class="col-md-3">

                    <div class="mb30" style="height:550px">
                        <div class="tt">
                            <h3 style="color:#6C6767">最新公告</h3>
                        </div>
                        <!--遍历出公告信息-->
                        <div>
                        <ul id="did" class="hot-activity-list">
                            <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['notice']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                            <li id="notice">
                                <a href="__APP__/Notice/datail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" style="font-size:15px; color:#FE6C6C">☞<?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</a>
                                <br>
                                <span class="act-time" style="color:#C67676">时间:  <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M");?>
</span>
                            </li> 
                            <?php } ?>
                        </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        



        <div class="home_module m_movie index_movie">
            <div class="container">
                <div class="col-md-2">
                    <h2><a href="__APP__/Video/index">视频库</a></h2>
                    <ul>
                        <li><a href=""></a></li>
                        <li><a href="__APP__/Video/index">精选</a></li>
                        <li><a href="__APP__/Cat/index">分类</a></li>
                    </ul>
                </div>
                <div class="col-md-7">
                    <div class="tt">
                        <h3 style="color:#6C6767">精选推荐</h3>
                        <a href="__APP__/Video/index" class="more">更多 »</a>
                    </div>
                    <div class="m_cover_list">
                        <ul class="list_ib">
                              
                        <?php  $_smarty_tpl->tpl_vars['vi'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vi']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['video']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vi']->key => $_smarty_tpl->tpl_vars['vi']->value){
$_smarty_tpl->tpl_vars['vi']->_loop = true;
?>
                        <li style="width:120px;margin-left:11px">
                            <div class="item_cover" style="width:150px">
                                <img alt="<?php echo $_smarty_tpl->tpl_vars['vi']->value['videoname'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['vi']->value['videoname'];?>
" style="width:150px;height:140px;" src="__PUBLIC__/Uploads/videopic/<?php echo $_smarty_tpl->tpl_vars['vi']->value['picname'];?>
">
                                <a class="m_cover_item_info" href="__APP__/Video/play/id/<?php echo $_smarty_tpl->tpl_vars['vi']->value['id'];?>
" title="点击播放" style="width:150px">
                                    <span class="play-item"><i class="icon-play"></i></span>
                                    <em>点击率 <?php echo $_smarty_tpl->tpl_vars['vi']->value['clicknum'];?>
</em>
                                </a>
                            </div>
                            <span class="title" style="width:150px"><a href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['vi']->value['id'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['vi']->value['tid'];?>
"><?php echo $_smarty_tpl->tpl_vars['vi']->value['videoname'];?>
</a></span>
                            <div class="c_rating" style="width:150px">
                                <i><?php echo $_smarty_tpl->tpl_vars['vi']->value['favonum'];?>
人赞</i>
                            </div>
                            <a href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['vi']->value['id'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['vi']->value['tid'];?>
" style="margin-left:20px" class="btn btn-primary btn-sm">查看详情</a>
                        </li>
                        <?php } ?>
                                         
                        </ul>
                    </div>
                    
                </div>
                <div class="col-md-3">

                    <div class="mb30 m_cats" style="width:200px">
                        <div class="tt">
                            <h3 style="color:#6C6767">热门分类</h3>
                            <a href="__APP__/Cat/index" class="more">更多 »</a>
                        </div>
                        <ul class="list_ib">
                            <?php  $_smarty_tpl->tpl_vars['vcat'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vcat']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['videocat']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vcat']->key => $_smarty_tpl->tpl_vars['vcat']->value){
$_smarty_tpl->tpl_vars['vcat']->_loop = true;
?>
                            <li><a href="__APP__/Video/index/pid/<?php echo $_smarty_tpl->tpl_vars['vcat']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vcat']->value['name'];?>
</a></li>
                            <?php } ?>
                        </ul>
                    </div>

                    <div class="m_pay_list">
                        <div class="tt">
                            <h3 style="color:#6C6767">教学点击榜</h3>
                            <a href="__APP__/Video/index" class="more">更多 »</a>
                        </div>
                        <ol>
                            <?php  $_smarty_tpl->tpl_vars['click'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['click']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['clickvideo']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['click']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['click']->key => $_smarty_tpl->tpl_vars['click']->value){
$_smarty_tpl->tpl_vars['click']->_loop = true;
 $_smarty_tpl->tpl_vars['click']->iteration++;
?>
                            <li><span><?php echo $_smarty_tpl->tpl_vars['click']->iteration;?>
</span><a href="__APP__/Video/play/id/<?php echo $_smarty_tpl->tpl_vars['click']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['click']->value['videoname'];?>
</a></li>
                            <?php } ?>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="home_module m_review index_review">
            <div class="container">
                <div class="col-md-2">
                    <h2><a href="__APP__/Library/index">军火库</a></h2>
                    <ul>
                        <li><a href="__APP__/Library/index">文学榜</a></li>
                        <li><a href="__APP__/Library/index">人气榜</a></li>
                    </ul>
                </div>
                <script type="text/javascript" charset="utf-8">
                    $(function(){
                        //设置资源列表页的鼠标斑马线
                        var bg = null;    
                        $("#goodlib li").mouseover(function(){
                            bg = $(this).css("background-color");
                            $(this).css("background-color","#7BAACA");
                        }).mouseout(function(){
                            $(this).css("background-color",bg);      
                        });
                         
                    })
                </script>
                <div class="col-md-7">
                    <div class="tt">
                        <h3 style="color:#6C6767">资源精选</h3>
                        <a href="__APP__/Library/index" class="more">更多 »</a>
                    </div>
                    <div class="m_r_list index-r-list" id="goodlib">
                        <ul class="list_pt10 list_pb10 list_ov list_b_d_ddd">
                            <?php  $_smarty_tpl->tpl_vars['lib'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['lib']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['library']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['lib']->key => $_smarty_tpl->tpl_vars['lib']->value){
$_smarty_tpl->tpl_vars['lib']->_loop = true;
?>
                            <li>
                                <div class="t_ml_120" style="margin:0 auto">
                                    ♥ <a href="__APP__/Library/detail/id/<?php echo $_smarty_tpl->tpl_vars['lib']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['lib']->value['title'];?>
</a> 
                                    <i style="float:right">下载量：<?php echo $_smarty_tpl->tpl_vars['lib']->value['dwloadnum'];?>
 &nbsp;&nbsp;&nbsp;发布时间 <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['lib']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</i>
                                    
                                </div>
                            </li>
                            <?php } ?>
                            
                        </ul>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="mb0">
                        <div class="tt">
                            <h3 style="color:#6C6767">活跃用户</h3>
                            <a href="__APP__/Users/stranger" class="more">更多 »</a>
                        </div>
                        <ul class="list_pb10">
                            <?php  $_smarty_tpl->tpl_vars['hot'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['hot']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['hotuser']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['hot']->key => $_smarty_tpl->tpl_vars['hot']->value){
$_smarty_tpl->tpl_vars['hot']->_loop = true;
?>
                            <li>
                            <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['hot']->value['uid'];?>
" class="pull-left"><img alt="<?php echo $_smarty_tpl->tpl_vars['hot']->value['username'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['hot']->value['username'];?>
" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['hot']->value['username'];?>
/s_<?php echo $_smarty_tpl->tpl_vars['hot']->value['picture'];?>
" class="avatar_md"></a>
                                <div class="t_ml_60">
                                    <p><a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['hot']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['hot']->value['username'];?>
</a></p>
                                    <span><?php echo $_smarty_tpl->tpl_vars['hot']->value['fansnum'];?>
人关注</span>
                                </div>
                            </li>
                            <?php } ?>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="home_module m_notes index_notes">
            <div class="container">
                <div class="col-md-2">
                    <h2><a href="__APP__/Note/index">手记</a></h2>
                    <ul>
                        <li><a href="__APP__/Users/stranger">创作人</a></li>
                    </ul>
                </div>

                <div class="col-md-7">
                    <div class="tt">
                        <h3 style="color:#6C6767">最有料</h3>
                        <a href="__APP__/Note/index" class="more">更多 »</a>
                    </div>
                    <div class="m_notes_list index-notes-list">
                        <ul class="list_pt10 list_pb10 list_ov list_b_d_ddd">
                            
                            <?php  $_smarty_tpl->tpl_vars['note'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['note']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['bestnote']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['note']->key => $_smarty_tpl->tpl_vars['note']->value){
$_smarty_tpl->tpl_vars['note']->_loop = true;
?>
                            <li style="width:100%;">
                                
                                <div style="width:500px">
                                    <h4>☆ <a href="__APP__/Note/detail/id/<?php echo $_smarty_tpl->tpl_vars['note']->value['nid'];?>
"><?php echo $_smarty_tpl->tpl_vars['note']->value['title'];?>
</a></h4>
                                    <div class="c999 m_n_item_info f12">
                                        创作人 <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['note']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['note']->value['username'];?>
</a> 记录 <a href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['note']->value['vid'];?>
"><?php echo $_smarty_tpl->tpl_vars['note']->value['videoname'];?>
</a>
                                    </div>
                                    <p><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['note']->value['content'],80,"...");?>
</p>
                                    <div class="pt5 c999 f12 review_act">
                                        <a class="btn btn-sm btn-default btn-like " data-content_id="35" data-content_type="note" href="javascript:void(0)"><i class="icon-heart"></i> <em><?php echo $_smarty_tpl->tpl_vars['note']->value['num'];?>
</em>人赞</a>
                                    </div>
                                </div>
                            </li>
                            <?php } ?>  
                            
                        </ul>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="mb0">
                        <div class="tt">
                            <h3 style="color:#6C6767">热门创作人</h3>
                            <a href="__APP__/Users/stranger" class="more">更多 »</a>
                        </div>
                        <ul class="list_pb10">
                            <?php  $_smarty_tpl->tpl_vars['notehot'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['notehot']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['notehotuser']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['notehot']->key => $_smarty_tpl->tpl_vars['notehot']->value){
$_smarty_tpl->tpl_vars['notehot']->_loop = true;
?>
                            <li>
                            <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['notehot']->value['uid'];?>
" class="pull-left"><img alt="<?php echo $_smarty_tpl->tpl_vars['notehot']->value['username'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['notehot']->value['username'];?>
" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['notehot']->value['username'];?>
/s_<?php echo $_smarty_tpl->tpl_vars['notehot']->value['picture'];?>
" class="avatar_md"></a>
                                <div class="t_ml_60">
                                    <p><a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['notehot']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['notehot']->value['username'];?>
</a></p>
                                    <span><?php echo $_smarty_tpl->tpl_vars['notehot']->value['num'];?>
篇手记</span>
                                </div>
                            </li>
                            <?php } ?>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="home_module m_group index_group">
            <div class="container">
                <div class="col-md-2">
                    <h2><a href="__APP__/Message/index">贴吧</a></h2>
                    <ul>
                        <li><a href="__APP__/Message/index">精华帖</a></li>
                        <li><a href="__APP__/Message/hot">大家都在看</a></li>
                    </ul>
                </div>

                <div class="col-md-7">
                    <div class="tt">
                        <h3 style="color:#6C6767">分类推荐</h3>
                        <a href="__APP__/Message/index" class="more">更多 »</a>
                    </div>
                    <div class="m_group_list">
                        <ul class="list_pb20 list_ib">
                            <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['cat']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                            <?php if ($_smarty_tpl->tpl_vars['vo']->value['count']!='0'){?>
                            <li style='border:0px solid red;height:100px;width:50%;margin:5px 0px' class='mess_li'>
                            <h4 style='height:100px;width:80px;border-right:1px solid #ddd;float:left'><a href="__APP__/Message/index2/pid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" style='color:#7C3B83;'><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
</a></h4>
                                <div class="t_ml_90" style='border:0px solid blue;width:60%'>
                                    <?php  $_smarty_tpl->tpl_vars['tt'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['tt']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['vo']->value['mess']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['tt']->key => $_smarty_tpl->tpl_vars['tt']->value){
$_smarty_tpl->tpl_vars['tt']->_loop = true;
?><p style='border:0px solid red;font:normal 13px "宋体"'><a href='__APP__/Message/show/id/<?php echo $_smarty_tpl->tpl_vars['tt']->value['id'];?>
' target='blank'>★ <?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['tt']->value['title'],9,'...',true);?>
</a></p><?php } ?>
                                    <p><?php echo $_smarty_tpl->tpl_vars['vo']->value['count'];?>
个帖子</p>
                                </div>
                            </li>
                            <?php }?>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
                <script type="text/javascript" charset="utf-8">
                    $(function(){
                        //设置资源列表页的鼠标斑马线
                        var bg = null;    
                        $(".mess_li").mouseover(function(){
                            bg = $(this).css("background-color");
                            $(this).css("background-color","#eee");
                        }).mouseout(function(){
                            $(this).css("background-color",bg);      
                        });
                         
                    })
                </script>

                <div class="col-md-3">
                    <div class="mb0">
                        <div class="tt">
                            <h3 style="color:#6C6767">热门问题</h3>
                            <a href="__APP__/Question/index" class="more">更多 »</a>
                        </div>
                        <ul class="list_pb10">
                            <?php  $_smarty_tpl->tpl_vars['qv'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['qv']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['ques']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['qv']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['qv']->key => $_smarty_tpl->tpl_vars['qv']->value){
$_smarty_tpl->tpl_vars['qv']->_loop = true;
 $_smarty_tpl->tpl_vars['qv']->iteration++;
?>
                            <li>
                                <span><?php echo $_smarty_tpl->tpl_vars['qv']->iteration;?>
</span>
                                <div class="t_ml_30">
                                    <a href="__APP__/Question/show/id/<?php echo $_smarty_tpl->tpl_vars['qv']->value['id'];?>
" style='font-size:15px;color:#7C3B83;' target='blank'><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['qv']->value['content'],12,'...',true);?>
</a>
                                    <p>来自用户 <a href="__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['qv']->value['uid'];?>
" style='color:#C993D1' target='blank'><?php echo $_smarty_tpl->tpl_vars['qv']->value['username'];?>
</a></p>
                                </div>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

         <div id="footer">
            <div class="container">
                <div class="col-md-2">
                   <a href="__APP__/Index/index"><img alt="E-Sch教学网" title="E-Sch教学网" src="__PUBLIC__/images/logo-bq.png"></a>
                </div>

                <div class="col-md-7" style="line-height:25px;">
                    <a href="">关于我们</a>
                    <a href="">联系我们</a>
                    <a href="">免责声明</a>
                    <a href="">作品授权</a>
                    <a href="">意见反馈</a>
                    <br>
                    <a href="javascript:void(0)">友情链接:</a>
                    <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['flink']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                    <a target="_blank" href="<?php echo $_smarty_tpl->tpl_vars['vo']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['webname'];?>
</a>
                    <?php } ?>
                </div>

                <div class="col-md-3">
                    <p class="pb10">© 2014 E-Sch.com. all rights reserved </p>
                    <p>京公网安备11010802012355号</p>
                </div>
            </div>
        </div>
    </div>
    
</body></html>
<?php }} ?>