<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 10:56:39
         compiled from "E:\PHP\wamp64\www\edu1\Home\Tpl\Public\head2.html" */ ?>
<?php /*%%SmartyHeaderCode:17085651005cd8dce73a0899-88413983%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '95ee417527e784f81c6ca591852a80fa17016d2a' => 
    array (
      0 => 'E:\\PHP\\wamp64\\www\\edu1\\Home\\Tpl\\Public\\head2.html',
      1 => 1412054808,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17085651005cd8dce73a0899-88413983',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dce73bbe1',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dce73bbe1')) {function content_5cd8dce73bbe1($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        <style type="text/css">
        /*ipad fix*/
        @media (min-width:992px){
            .home_module .m_cover_list li:nth-last-child(-n+3) {
                display: none;
            }
            .col-md-4{
                /*display: none;*/
            }
        }
        @media (min-width:1200px){
            .home_module .m_cover_list li:nth-last-child(-n+3) {
                *display: inline;
                display: inline-block;
                zoom:1;
            }
        }

        .content_list{
            overflow: hidden;
        }
        .content_list li img{
            height: 140px;
            width: 100px;
        }
        .content_list li{
            float: left;
            width: 100px;
            text-align: center;
            margin-right: 19px;
            margin-bottom: 20px;
        }
        .c_rating i{
            font-style: normal;
            font-size: 12px;
            vertical-align: top;
            line-height: 18px;
            /*padding-left: 10px;*/
            color: #d7b120;
        }
        .content_load{
            display: none;
            text-align: center;
        }
        .ml10{
            margin-left:100px;
        }
        </style>
        
        
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script>
       
    </head>
    <body>
    <div id="browser"></div>
 
        <div id="header">
            <div class="navbar navbar-default" role="navigation">
                <div class="container">
                    
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">切换导航</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="__APP__/Index/index">E-Sch</a>
                    </div>

                    <div class="collapse navbar-collapse navbar-ex1-collapse">

                        <ul class="nav navbar-nav g_nav">

                            <li><a href="__APP__/Video/index" class="animated">视频</a></li>
                            <li><a href="__APP__/Note/index" class="animated">手记</a></li>
                            <li><a href="__APP__/Library/index" class="animated">文库</a></li>
                            <li><a href="__APP__/Message/index" class="animated">贴吧</a></li>
                            <?php if ($_SESSION['user']){?>
                            <li><a href="__APP__/Test/index" class="animated">考试</a></li>
                            <?php }else{ ?>
                            <li><a href="javascript:alert('请先登录！')" class="animated">考试</a></li>
                            <?php }?>
                        </ul>

                        <form class="navbar-form navbar-right" role="search" action="__APP__/Cat/show" method="GET" autocompelte="off">
                            <div class="form-group">
                                <input type="text" name="q" class="form-control" placeholder="搜索">
                            </div>
                            <button type="submit" class="btn btn-default"><i class="icon-search"></i></button>
                        </form>

                         <ul class="nav navbar-nav navbar-right" id="userinfo">
                            

                            <li><a href="__APP__/Message/mynews">提醒(<?php if ($_SESSION['user']['hfnum']){?><?php echo $_SESSION['user']['hfnum'];?>
<?php }else{ ?>0<?php }?>)</a></li>
                            <li class="navbar-nav-user">
                                <a class="user-avatar" href="__APP__/Users/myedu">
                                    <img alt="<?php echo $_SESSION['user']['username'];?>
" title="<?php echo $_SESSION['user']['username'];?>
" <?php if ($_SESSION['user']['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/0.jpg"<?php }else{ ?>src="__PUBLIC__/Uploads/users/<?php echo $_SESSION['user']['username'];?>
/s_<?php echo $_SESSION['user']['picture'];?>
"<?php }?> class="avatar_sm">　<?php echo $_SESSION['user']['username'];?>
</a>
                                </a>
                                <div class="dropdown">
                                    <a href="__APP__/Users/settings"><i class="icon-wrench"></i> 设置</a>
                                    <a href="__APP__/Users/loginout"><i class="icon-signout"></i> 退出</a>
                                </div>
                            </li>
 
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function(){
                // 导航搜索框
                $('#header .navbar-form input').focus(function(){
                    $(this).attr('placeholder', '视频、资源、手记、帖子')
                    //$(this).parents('.navbar-form').eq(0).addClass('search_opend')
                    $(this).animate({width: '+250px'}, "fast");
                    $("#userinfo").fadeOut("fast");
                }).blur(function(){
                    $(this).attr('placeholder', '搜索')
                    //$(this).parents('.navbar-form').eq(0).removeClass('search_opend')
                    $(this).animate({width: '70px'}, "fast");
                    $("#userinfo").show(1000);
                })       
                //设置头部的图片滚动
                
            })
        </script>
<?php }} ?>