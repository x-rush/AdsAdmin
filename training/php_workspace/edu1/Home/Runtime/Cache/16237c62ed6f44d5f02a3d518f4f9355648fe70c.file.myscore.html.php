<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:08:31
         compiled from "./Home/Tpl\Test\myscore.html" */ ?>
<?php /*%%SmartyHeaderCode:3387409365cd8dfaf07ec80-34006828%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '16237c62ed6f44d5f02a3d518f4f9355648fe70c' => 
    array (
      0 => './Home/Tpl\\Test\\myscore.html',
      1 => 1393327896,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3387409365cd8dfaf07ec80-34006828',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'list' => 0,
    'vo' => 0,
    'showPage' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dfaf0f012',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dfaf0f012')) {function content_5cd8dfaf0f012($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>我的历史成绩浏览页面</title>
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
            span.g_reply_n{
                font-size:20px;color:#717474;
            }
            #titled{
                width:285px;float:left;
            }
            li.testlist{
                height:20px;line-height:5px;
            }
        </style>
    </head>
    <body>
    <div id="browser"></div>
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="">我的成绩</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li><a href="__URL__/index">试题浏览</a></li>
                <li class="active"><a href="">我的历史成绩</a></li>
            </ul>
        </div>
    </div>
</div>
      
<div id="main">
    <div class="container">
        <div class="home_module row">
            <div class="container"> 
                <div class="col-md-8">
                    <div class="m_r_list g_t_list mt5"> 
                        <div class="c999 m_n_item_info">
                            <span class="g_reply_n">试题名</span>
                            <span class="g_reply_n"></span>
                            <span class="g_reply_n">测试分数</span>
                            <span class="g_reply_n" style="float:right">考试时间</span>
                        </div>

                        <ul class="list_pb20">
                            <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                            <li class="testlist">
                            <div id="titled">
                                <small><font size="4" color="#556CB4" font-family="微软雅黑"><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</font></small> 
                            </div>
                            <small><font size="4" color="#74A790"><?php echo $_smarty_tpl->tpl_vars['vo']->value['score'];?>
分</font></small>
                                <small style="float:right"><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['time'],"%Y-%m-%d %H:%M");?>
</small>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                    <div class="tc">
                            <?php echo $_smarty_tpl->tpl_vars['showPage']->value;?>

                    </div>
                </div>
				
			<div class="col-md-4"> 
				<div class="biquu_d_placeholder mt50 mb40">
					<a href=""><img alt="E-Sch教学网" title="E-Sch教学网" src="__PUBLIC__/images/0000dh.jpg"></a>
				</div>
            </div>
				
				
            </div>
        </div>
    </div>
</div>
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</body></html>
 <script type="text/javascript" charset="utf-8">
            $(function(){
                //添加鼠标移入移除事件
                    var cc=null;
                    $(".testlist").mouseover(function(){
                        //鼠标移入事件处理
                        cc=$(this).css("background");
                        $(this).css("background","rgb(160,175,222)");
					    //this.style.backgroundColor="#aaa"; 
                    }).mouseout(function(){
                        //鼠标移除事件处理
                        $(this).css("background",cc);
                    });
             });
         </script> 
         
<?php }} ?>