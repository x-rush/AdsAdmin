<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 10:56:20
         compiled from "./Home/Tpl\Test\score.html" */ ?>
<?php /*%%SmartyHeaderCode:16703770045cd8dcd42c7b66-15612779%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e0b1d02b81d2a59d3f7f0b31a00fea37dd0f55b1' => 
    array (
      0 => './Home/Tpl\\Test\\score.html',
      1 => 1393001506,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16703770045cd8dcd42c7b66-15612779',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'score' => 0,
    'tid' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dcd432577',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dcd432577')) {function content_5cd8dcd432577($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>试题得分</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=10">
        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script>
        <style type="text/css">
            #score{
                width:800px;
                height:70px;
                text-align:center;
            }
            #red{
                color:red;
                font-size:30px;
                font-family:微软雅黑;
            }
            font.black{
                color:black;
            }
        </style>
    </head>
    <body>
    <div id="browser"></div>
        <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="">成绩</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li class="active"><a href="">测试成绩</a></li>
                <li><a href="__URL__/myscore">我的历史成绩</a></li>
            </ul>
        </div>
    </div>
</div>
      
<div id="main">
        <div class="home_module row">
            <div class="container">  
                <div class="col-md-8" style="width:943px">
                    <center>
                    <div class="m_r_list g_t_list mt5"> 
                        <!--显示分数块-->
                        <div id="score">
                             <span><font id="red">
                                <?php if ($_smarty_tpl->tpl_vars['score']->value>80){?>
                                本次考试成绩为<font class="black"><?php echo $_smarty_tpl->tpl_vars['score']->value;?>
</font>分!
                                <?php }elseif($_smarty_tpl->tpl_vars['score']->value>=60){?>
                                    本次考试成绩为<font class="black"><?php echo $_smarty_tpl->tpl_vars['score']->value;?>
</font>分!
                                <?php }else{ ?>
                                    本次考试成绩为<font class="black"><?php echo $_smarty_tpl->tpl_vars['score']->value;?>
</font>分!
                                <?php }?>
                             </font></span>
                        </div>
                    </center>
                        <!--显示分数块-->
                        <center>
                         <div class="mb30 m_cats" style="margin-top:20px">
                                <ul>  
                                    <li><a href="__URL__/answer/tid/<?php echo $_smarty_tpl->tpl_vars['tid']->value;?>
" STYLE="height:50px;width:222px ">点击查看正确答案</a></li>
                                </ul>
                            </div>
                            </center>
                    </div>
                </div>    
            </div>
        </div>
</div>
        
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</body></html>
<?php }} ?>