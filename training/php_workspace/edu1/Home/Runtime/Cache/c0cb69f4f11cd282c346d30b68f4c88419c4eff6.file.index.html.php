<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:18:49
         compiled from "./Home/Tpl\Cat\index.html" */ ?>
<?php /*%%SmartyHeaderCode:10775849845cd8e219784553-34350851%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c0cb69f4f11cd282c346d30b68f4c88419c4eff6' => 
    array (
      0 => './Home/Tpl\\Cat\\index.html',
      1 => 1393327900,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '10775849845cd8e219784553-34350851',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'list' => 0,
    'vo' => 0,
    'zilist' => 0,
    'zi' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8e2197edcf',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8e2197edcf')) {function content_5cd8e2197edcf($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>资源类别三维图</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
        <script type="text/javascript" src="__PUBLIC__/js/w3c2.js"></script>
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/type2.css">

        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script> 
    </head>
    <body>
    <div id="browser"></div>

    <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>


        
<div id="main" style='background:url(__PUBLIC__/images/bg_cat3.jpg)'>
    <div class="container">
        <div class="home_module row">
            <div class="container">
                
                <div class="col-md-8" style='width:100%'>
                    <div class="mb30 m_cats" style='float:left'>
                        <ul>
                            <li><a href='__APP__/Cat/index' style="font-size:20px">类别总览</a>
                            <a href='__APP__/Cat/index/id/1' style='color:red'>红色为一级分类</a>
                            <a href='__APP__/Cat/index/id/2' style='color:blue'>蓝色为二级分类</a></li>
                        </ul>
                    </div>
                    <div id="div1">
                        <?php if ($_GET['id']!='2'){?>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                        <a href="__APP__/Cat/show/pid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
/r/1" style='color:red'><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
</a>
                        <?php } ?>
                        <?php }?>
                        <?php if ($_GET['id']!='1'){?>
                        <?php  $_smarty_tpl->tpl_vars['zi'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['zi']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['zilist']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['zi']->key => $_smarty_tpl->tpl_vars['zi']->value){
$_smarty_tpl->tpl_vars['zi']->_loop = true;
?>
                        <a href="__APP__/Cat/show/pid/<?php echo $_smarty_tpl->tpl_vars['zi']->value['id'];?>
/r/1" style='color:blue'><?php echo $_smarty_tpl->tpl_vars['zi']->value['name'];?>
</a>
                        <?php } ?>
                        <?php }?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

    
</body></html>
<?php }} ?>