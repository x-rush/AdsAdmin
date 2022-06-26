<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 10:56:21
         compiled from "./Home/Tpl\Test\answer.html" */ ?>
<?php /*%%SmartyHeaderCode:8883203945cd8dcd587f211-61000272%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '495d94275eb5364e3391a440fd683c923671b8dc' => 
    array (
      0 => './Home/Tpl\\Test\\answer.html',
      1 => 1393327896,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8883203945cd8dcd587f211-61000272',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'list' => 0,
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dcd58b9b9',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dcd58b9b9')) {function content_5cd8dcd58b9b9($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>正确答案页面</title>
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
            #content{
                font-size:20px;
                font-family:微软雅黑;
                color:#5D5D5D;
            }
            #radio{
                color:#838383;
                font-size:15px; 
                font-family:微软雅黑";
            }
            
        </style>
    </head>
    <body>
    <div id="browser"></div>
        <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

        
<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="">正确答案</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                
                <li class="active"><a href="">查看正确答案</a></li>
                <li><a href="__URL__/index">返回试题列表</a></li>
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
                        <div class="mb30 m_cats">
                            <ul>  
                                <li><b type="submit" class="btn btn-primary btn-lg btn-block">以下就是本次测试的正确答案啦!!!</b></li>
                            </ul>
                            <ul class="quest">
                            <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                                <li id="content"><?php echo $_smarty_tpl->tpl_vars['vo']->iteration;?>
.<?php echo $_smarty_tpl->tpl_vars['vo']->value['content'];?>
</br></br>
                                <p id="radio">
                                    <input type="radio" name="test[<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
]" value="A" <?php if ($_smarty_tpl->tpl_vars['vo']->value['answer']=="A"){?>checked<?php }?>> A.<?php echo $_smarty_tpl->tpl_vars['vo']->value['aA'];?>
&nbsp;&nbsp;
                                    <input type="radio" name="test[<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
]" value="B" <?php if ($_smarty_tpl->tpl_vars['vo']->value['answer']=="B"){?>checked<?php }?>> B.<?php echo $_smarty_tpl->tpl_vars['vo']->value['aB'];?>
&nbsp;&nbsp;
                                    <input type="radio" name="test[<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
]" value="C" <?php if ($_smarty_tpl->tpl_vars['vo']->value['answer']=="C"){?>checked<?php }?>> C.<?php echo $_smarty_tpl->tpl_vars['vo']->value['aC'];?>
&nbsp;&nbsp;
                                    <input type="radio" name="test[<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
]" value="D" <?php if ($_smarty_tpl->tpl_vars['vo']->value['answer']=="D"){?>checked<?php }?>> D.<?php echo $_smarty_tpl->tpl_vars['vo']->value['aD'];?>

                                </p>
                                </li>
                            <?php } ?>
                        </ul>
                        </div>
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
<?php }} ?>