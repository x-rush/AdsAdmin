<?php /* Smarty version Smarty-3.1.6, created on 2019-05-22 20:55:32
         compiled from "./Home/Tpl\Notice\datail.html" */ ?>
<?php /*%%SmartyHeaderCode:18137598115ce546c4e660a1-86356653%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '861890ea551884620b0d729ef8853ff37bbbedd2' => 
    array (
      0 => './Home/Tpl\\Notice\\datail.html',
      1 => 1393466424,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18137598115ce546c4e660a1-86356653',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'list' => 0,
    'notice' => 0,
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce546c4f19bd',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce546c4f19bd')) {function content_5ce546c4f19bd($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?> <!DOCTYPE html>
<html lang="en">
    <head>
        <title>公告详情浏览</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script>
        <STYLE>
			h3.title{
				color:#AA71B2;
			}
		</STYLE>
    </head>
    <body>
    <div id="browser"></div>
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

        
<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="">公告展示</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li class="active"><a href="">公告浏览</a></li>
            </ul>
        </div>
    </div>
</div>

<div id="main">
    <div class="container">
        <div class="home_module m_movie row">
            <div class="container">
                <!-- 左侧 -->
                <div class="col-md-8">
                    <!-- 公告内容 -->
                    <div class="tt">
                        <h2 class="title">☞<?php echo $_smarty_tpl->tpl_vars['list']->value['title'];?>
</h2>
                    </div>
                    <div class="review_content">
                        <div class="c999 m_n_item_info">
                            添加者:<?php echo $_smarty_tpl->tpl_vars['list']->value['author'];?>
&nbsp;&nbsp;&nbsp;&nbsp;添加时间:<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['list']->value['addtime'],"%Y-%m-%d %H:%M");?>

                        </div>
                        <div class="c999 m_n_item_info">
                            公告内容:
                        </div>
                        <div class="review_content_p" style="border:5px #eee solid">
                           <p><?php echo $_smarty_tpl->tpl_vars['list']->value['content'];?>
</p>  
                        </div>
                        
                    </div>
                </div>
                <!-- 右侧 -->
                <div class="col-md-4" style="height:330px">
                     <div class="m_pay_list" style="height:330px;width:300px">
                        <div class="tt">
                            <h3 class="title">最新公告</h3>
                        </div>
                        <div id="scrollDiv" style="height:300px;overflow:hidden">
                            <ol id="did">
                                <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['notice']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                                <li class="cc"><span>新</span><a href="__APP__/Notice/datail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</a></li>
                                <li><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M");?>
</li>
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
<!--页脚开始-->
<script type="text/javascript" charset="utf-8">
            $(function(){
                /*  
                var mytime=setInterval(function(){
                    $("li.cc:last").hide().prependTo("#did").slideDown(1000);   
                    },1400);
                $(".m_pay_list").mouseover(function(){
                    clearInterval(mytime);
                    mytime=null;
                    });
                 $(".m_pay_list").mouseleave(function(){
                    mytime=setInterval(function(){
                    $("#did li:last").hide().prependTo("#did").slideDown(1000);   
                    },800);
                  
                    });*/
                    
                //设置最新公告滚动
                $("#scrollDiv").Scroll({line:5,speed:1000,timer:2000});

             });
</script> 
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

        
</body></html>
<?php }} ?>