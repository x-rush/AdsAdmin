<?php /* Smarty version Smarty-3.1.6, created on 2019-05-12 19:34:08
         compiled from "./Home/Tpl\Note\index.html" */ ?>
<?php /*%%SmartyHeaderCode:11359599165cd804b0f0d045-30481600%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f877718030ef7fc1581c208d48fd8c0f9d22c284' => 
    array (
      0 => './Home/Tpl\\Note\\index.html',
      1 => 1393460400,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11359599165cd804b0f0d045-30481600',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
    'list' => 0,
    'vo' => 0,
    'showPage' => 0,
    'newlist' => 0,
    'new' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd804b103056',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd804b103056')) {function content_5cd804b103056($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
if (!is_callable('smarty_modifier_truncate')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.truncate.php';
?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>视频手记列表</title>
        
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
            .newlist li a:hover{
                color:blue;
                font-size:130%;
                text-decoration:none;
            }
            /**弹出层效果**/
            .raceShow{background:url("__PUBLIC__/images/103923O21-2.gif");z-index:10000;border:solid 1px #ccc;position:absolute;display:none;width:300px;height:100px;padding:30px;font-size:16px;color:red;text-align:center;}
        </style>
        <script type="text/javascript" charset="utf-8">
            $(function(){
                //弹出层
                var speed = 500;//动画速度
                $("a.please").click(function(event){//绑定事件处理
                    event.stopPropagation();
                    //var offset = $(event.target).offset();//取消事件冒泡
		            $("#racePop").css({ top:event.pageY + "px", left: event.pageX-"300" + "px" });//设置弹出层位置
                    $("#racePop").slideDown(speed);//动画显示
                    });
                $("#racePop").click(function(event) { $("#racePop").fadeOut(speed) });//单击弹出层则自身隐藏
                $(document).click(function(event) { $("#racePop").fadeOut(speed) });//单击空白区域隐藏    
            });
        </script>
    </head>
    <body>
    <div id="browser"></div>
 
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

        
<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="">手记</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li class="active"><a href="__URL__/index">手记列表</a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <ul class="navbar-left">
                <li><?php if ($_SESSION['user']){?>
                <a href="__URL__/index/uid/<?php echo $_SESSION['user']['id'];?>
"><i class="icon-list"></i> 我的手记</a>
                <?php }else{ ?>
                <a href="javascript:;" class="please"><i class="icon-list"></i> 我的手记</a>
                <?php }?></li>
                <li><?php if ($_SESSION['user']){?>
                <a href="__URL__/index/collid/<?php echo $_SESSION['user']['id'];?>
"><i class="icon-list"></i> 我收藏的</a>
                <?php }else{ ?>
                <a href="javascript:;" class="please"><i class="icon-list"></i> 我收藏的</a>
                <?php }?></li>
            </ul>
        </div>
        <div id="racePop" class="raceShow"><b>请先登录！点击此处取消...</b></div>
    </div>
</div>



        
<div id="main">
    <div class="container">
        <div class="home_module row">
            <div class="container">
                
                <div class="col-md-8">

                    
                    
                    <div class="tt">
                        
                        <h3><?php echo (($tmp = @$_smarty_tpl->tpl_vars['title']->value)===null||$tmp==='' ? "热门手记精选" : $tmp);?>
</h3>
                        
                        
                    </div>
                    <div class="m_notes_list mt5">
                    
                        <ul class="list_pb30 list_ov">
                            <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                            <li style="width:700px">
                                <div class="item_cover pull-left" style="width:150px">
                                    <img style="width:150px;height:140px" alt="<?php echo $_smarty_tpl->tpl_vars['vo']->value['videoname'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['vo']->value['videoname'];?>
" src="__PUBLIC__/Uploads/videopic/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picname'];?>
">
                                    <a class="m_cover_item_info" href="__APP__/Video/play/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vid'];?>
" title="点击播放" style="width:150px">
                                        <span class="play-item"><i class="icon-play"></i></span>
                                        <em>点击率 <?php echo $_smarty_tpl->tpl_vars['vo']->value['clicknum'];?>
</em>
                                    </a>
                                </div>
                                <div class="t_ml_120" style="margin-left:160px;width:430px;">
                                    <h4><a href="__URL__/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</a></h4>
                                    <div class="c999 m_n_item_info f12">
                                        <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
"><img alt="<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/s_<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
" class="avatar_md"></a>
                                        创作人 <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a> <i style="float:right;margin-top:12px">创建时间 <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</i>
                                    </div>
                                    <p><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['vo']->value['content'],80,"...");?>
</p>
                                    <div class="pt5 c999 f12 review_act">
                                        <i class="btn btn-sm btn-default btn-like " data-content_id="35" data-content_type="note"><i class="icon-heart"></i> <em><?php echo $_smarty_tpl->tpl_vars['vo']->value['collnum'];?>
</em>人收藏</i>
                                        <i class="btn btn-sm btn-default btn-like " data-content_id="35" data-content_type="note"><i class="icon-heart"></i> <em><?php echo $_smarty_tpl->tpl_vars['vo']->value['commnum'];?>
</em>条回复</i>
                                    </div>
                                </div>
                            </li>
                            <?php } ?>
                        </ul>
                        <br>
                        <div class="tc">
                            <?php echo $_smarty_tpl->tpl_vars['showPage']->value;?>

                        </div>
                    
                    </div>

                </div>
                    

                
                <div class="col-md-4">

                    
                    <div class="biquu_d_placeholder mt50 mb40">
                        <a href=""><img alt="E-Sch教学网" title="E-Sch教学网" src="__PUBLIC__/images/0000dh.jpg"></a>
                    </div>
                    
                    <div class="m_pay_list">
                        <div class="tt">
                            <h3>最新手记</h3>
                        </div>
                        <div id="scrollDiv" style="height:240px;overflow:hidden;">
                        <ol class="newlist">
                            <?php  $_smarty_tpl->tpl_vars['new'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['new']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['newlist']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['new']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['new']->key => $_smarty_tpl->tpl_vars['new']->value){
$_smarty_tpl->tpl_vars['new']->_loop = true;
 $_smarty_tpl->tpl_vars['new']->iteration++;
?>
                            <li><span><?php echo $_smarty_tpl->tpl_vars['new']->iteration;?>
</span><a href="__URL__/detail/id/<?php echo $_smarty_tpl->tpl_vars['new']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['new']->value['title'];?>
</a></li>
                            <?php } ?>
                        </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="__PUBLIC__/js/scroll.js"></script> 
<script type="text/javascript" charset="utf-8">
//设置最新手记榜滚动
$(document).ready(function(){
$("#scrollDiv").Scroll({line:8,speed:1000,timer:2000});
});
</script>
<!-- 多行滚动 -->  
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
 
    
</body></html>
<?php }} ?>