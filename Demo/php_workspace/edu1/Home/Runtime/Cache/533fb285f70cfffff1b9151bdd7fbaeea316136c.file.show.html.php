<?php /* Smarty version Smarty-3.1.6, created on 2019-05-12 19:41:38
         compiled from "./Home/Tpl\Cat\show.html" */ ?>
<?php /*%%SmartyHeaderCode:15397877485cd80672953125-03615801%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '533fb285f70cfffff1b9151bdd7fbaeea316136c' => 
    array (
      0 => './Home/Tpl\\Cat\\show.html',
      1 => 1393437686,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15397877485cd80672953125-03615801',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'cname' => 0,
    'list1' => 0,
    'vo' => 0,
    'list2' => 0,
    'list3' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd806729d013',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd806729d013')) {function content_5cd806729d013($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
if (!is_callable('smarty_modifier_truncate')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.truncate.php';
?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>分类搜索结果</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script> 
        <style type="text/css">
            
            
        </style>
    </head>
    <body>
    <div id="browser"></div>

    <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>


        
<div id="main" style='background:url()'>
    <div class="container">
        <div class="home_module row">
            <div class="container">
                <div class="col-md-8" style='width:100%'>
                    <?php if ($_GET['pid']){?>
                    <div class="mb30 m_cats" style='float:left'>
                        <ul>
                            <li><a href='__APP__/Cat/index' style="font-size:20px">类别总览</a>
                            <a href='__APP__/Cat/index/id/1' style='color:red'>红色为一级分类</a>
                            <a href='__APP__/Cat/index/id/2' style='color:blue'>蓝色为二级分类</a></li>
                        </ul>
                    </div>
                    <?php }?>
                    <div class="tt" style='width:100%'>
                        <h3 style="color:#666;">搜索——<?php if ($_smarty_tpl->tpl_vars['cname']->value){?><?php echo $_smarty_tpl->tpl_vars['cname']->value;?>
<?php }else{ ?><?php echo $_GET['q'];?>
<?php }?></h3>
                    </div>
                    <div class="mb30 m_cats" style='float:left;width:100%;float:left;font:bold 16px "宋体";color:#aaa'>
                        <ul>
                            <li><a id='video' style='background:#2C6248' href='javascript:void(0)'>视频</a>　
                            <a id='library' style='background:#7BCAA5' href='javascript:void(0)'>文库</a>　
                            <a id='message' style='background:#7BCAA5' href='javascript:void(0)'>帖子</a></li>
                        </ul>
                    </div>
                    <ul class="content_list" id='vv' style="margin-left:6%;display:block">
                        <?php if ($_smarty_tpl->tpl_vars['list1']->value){?>
                        <div style='width:100%'><a style='color:#AF17AD' href='__APP__/Video/index/pid/<?php if ($_GET['pid']){?><?php echo $_GET['pid'];?>
<?php }else{ ?>0<?php }?>/q/<?php echo $_GET['q'];?>
'>查看更多>></a></div>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list1']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                        <li style="border:0px solid red;float:left;width:150px;margin:5px">
                            <div class="item_cover" style="width:150px">
                                <img alt="<?php echo $_smarty_tpl->tpl_vars['vo']->value['videoname'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['vo']->value['videoname'];?>
" style="width:150px;height:140px" src="__PUBLIC__/Uploads/videopic/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picname'];?>
">
                                <a class="m_cover_item_info" href="__APP__/Video/play/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" title="点击播放" style="width:150px">
                                    <span class="play-item"><i class="icon-play"></i></span>
                                    <em>点击率 <?php echo $_smarty_tpl->tpl_vars['vo']->value['clicknum'];?>
</em>
                                </a>
                            </div>
                            <span class="title" style="float:left;font-size:12px;width:150px;text-align:center"><a href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['tid'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['videoname'];?>
</a></span>
                            <a style="margin-left:40px" href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['tid'];?>
" class="btn btn-primary btn-sm">查看详情</a>
                        </li>
                        <?php } ?>
                        <?php }else{ ?>
                        <div style="border:0px solid red;float:left;width:100%">暂无该分类视频</div>
                        <?php }?>
                    </ul>
                    <ul id='ll' class="list_pb20" style="margin-left:6%;display:none">
                        <?php if ($_smarty_tpl->tpl_vars['list2']->value){?>
                        <div style='width:100%'><a style='color:#AF17AD' href='__APP__/Library/index/pid/<?php if ($_GET['pid']){?><?php echo $_GET['pid'];?>
<?php }else{ ?>0<?php }?>/q/<?php echo $_GET['q'];?>
'>查看更多>></a></div>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list2']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                            <li style="border:0px solid red;float:left;width:60%;margin-left:1px">
                                <div class="g_reply_n pull-left">
                                    <span title="">
                                        <i class="icon-eye-open icon-color-red"></i>
                                        <em><?php echo $_smarty_tpl->tpl_vars['vo']->value['clicknum'];?>
</em>
                                    </span>
                                    <span title="">
                                        <i class="icon-eye-open icon-color-red"></i>
                                        <em><?php echo $_smarty_tpl->tpl_vars['vo']->value['favonum'];?>
</em>
                                    </span>
                                </div>
                                <div class="t_ml_120">
                                    <h4><a href="__APP__/Library/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</a></h4>
                                    <p>
                                    <a href=""><img alt="<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/s_<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
" class="avatar_md"></a>
                                    上传者 <a href=""><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a> <i style="float:right;"><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</i>    
                                    </p>
                                </div>
                            </li>
                            <?php } ?>
                            <?php }else{ ?>
                            <div style="border:0px solid red;float:left;width:100%;">暂无该分类资源</div>
                        <?php }?>
                    </ul>
                    <ul id='mm' class="list_pb20" style="margin-left:6%;display:none">
                        <?php if ($_smarty_tpl->tpl_vars['list3']->value){?>
                        <div style='width:100%'><a style='color:#AF17AD;' href='__APP__/Message/index2/pid/<?php if ($_GET['pid']){?><?php echo $_GET['pid'];?>
<?php }else{ ?>0<?php }?>/q/<?php echo $_GET['q'];?>
'>查看更多>></a></div>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list3']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                        <li class='m_newlist' style="height:30px;border-bottom:1px dotted #ccc;float:left;width:70%;"> 
                            <div class="t_ml_120" style='margin-left:0px;float:left;width:42%;'>
                                <a href="__APP__/Message/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['vo']->value['title'],13,'...',true);?>
</a>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['img']=='y'){?><img style='margin-top:-2px' src='__PUBLIC__/images/img.png'><?php }?>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='1'){?><img style='margin-top:-2px' src='__PUBLIC__/images/best.png'><?php }?>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['ishot']=='1'){?><img style='margin-top:-2px' src='__PUBLIC__/images/hot.png'><?php }?>
                            </div>
                            <span style='margin-left:0px;float:left;width:90px;'>
                                <a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
'><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a>
                            </span>
                            <span style='margin:5px 0px 0px 0px;float:left;width:150px;font:normal 14px "宋体"'>
                                <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                            </span>
                            <span style='margin-top:5px;float:left;width:100px;font:bold 13px "宋体"'>
                                <div style='width:48px;float:left;text-align:right;color:#670A67'><?php echo $_smarty_tpl->tpl_vars['vo']->value['scan'];?>
</div>
                                <div style='margin:0px 5px;width:5px;float:left;color:black'>/</div>
                                <div style='width:35px;float:left;color:#F51231'><?php echo $_smarty_tpl->tpl_vars['vo']->value['plnum'];?>
</div>
                            </span>
                        </li>
                        <?php } ?>
                        <?php }else{ ?>
                        <div style="border:0px solid red;float:left;width:100%;margin-left:70px">暂无该分类帖子</div>
                    </ul>
                    <?php }?>
                </div>
            </div>
        </div>
    </div>
</div>

    <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

    
</body></html>
<script type="text/javascript" charset="utf-8">
    $(function(){
        $('#video').click(function(){
            $('#vv').show();
            $('#video').css("background","#2C6248");
            $('#ll').hide();
            $('#library').css("background","#7BCAA5");
            $('#mm').hide();
            $('#message').css("background","#7BCAA5");
        });
        $('#library').click(function(){
            $('#ll').show();
            $('#library').css("background","#2C6248");
            $('#vv').hide();
            $('#video').css("background","#7BCAA5");
            $('#mm').hide();
            $('#message').css("background","#7BCAA5");
        });
        $('#message').click(function(){
            $('#mm').show();
            $('#message').css("background","#2C6248");
            $('#ll').hide();
            $('#library').css("background","#7BCAA5");
            $('#vv').hide();
            $('#video').css("background","#7BCAA5");
        })
    })
</script>
<?php }} ?>