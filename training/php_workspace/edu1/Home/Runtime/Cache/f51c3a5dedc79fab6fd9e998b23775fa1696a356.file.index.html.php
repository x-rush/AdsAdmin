<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 10:56:16
         compiled from "./Home/Tpl\Test\index.html" */ ?>
<?php /*%%SmartyHeaderCode:977081435cd8dcd01e7d90-40046749%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f51c3a5dedc79fab6fd9e998b23775fa1696a356' => 
    array (
      0 => './Home/Tpl\\Test\\index.html',
      1 => 1393327896,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '977081435cd8dcd01e7d90-40046749',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
    'list' => 0,
    'vo' => 0,
    'showPage' => 0,
    'typelist' => 0,
    'ty' => 0,
    'newlist' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dcd04ba8b',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dcd04ba8b')) {function content_5cd8dcd04ba8b($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>试题列表</title>
        
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
            a:hover{text-decoration:none}
            #alist{
                color:#2C2C2C;
                font-size:20px;
            }
            li.testlist{
                height:20px;
                line-height:5px;
            }
            a.title{
                color:#67246F;
                font-size:15px;
                font-family:微软雅黑;
            }
        </style>
        
       
    </head>
    <body>
    <div id="browser"></div>

    <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="">试题库</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li class="active"><a href="__URL__/index">所有试题浏览</a></li>
                <li><a href="__URL__/myscore">我的历史成绩</a></li>
            </ul>
        </div>
    </div>
</div>
     
<div id="main">
    <div class="container">
        <div class="home_module row">
            <div class="container">
               <!--试题列表块开始-->  
                <div class="col-md-8">    
                    <div class="m_r_list g_t_list mt5"> 
                        <div class="c999 m_n_item_info">
                            <span id="alist"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['title']->value)===null||$tmp==='' ? "全部" : $tmp);?>
试题列表</span>
                        </div>
                        <ul class="list_pb20">
                            <?php if ($_smarty_tpl->tpl_vars['list']->value){?>
                            <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                            <li class="testlist">
                            <em><a class="title" href="__APP__/Test/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</a></em>
                            <small style="float:right">添加时间:<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M");?>
</small>
                            </li>
                            <?php } ?>
                            <?php }else{ ?>
                            <li style="font-size:15px; color:red">试题列表暂为空~</li>
                            <?php }?>
                        </ul>
                    </div>
                    <div class="tc">
                            <ul class="pagination">
                                <?php echo $_smarty_tpl->tpl_vars['showPage']->value;?>

                            </ul>
                    </div>
                </div>
                <!--试题列表块结束--> 

<!-- 右侧 -->
                <div class="col-md-4">
                    <div class="mb30 m_cats" style="width:200px">
                        <div class="tt">
                            <h3>资源分类</h3>
                            <a href="__APP__/Cat/index" class="more"><font size="2">所有分类 »</font></a>
                        </div>
                        <ul class="list_ib">
                            <?php  $_smarty_tpl->tpl_vars['ty'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ty']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['typelist']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['ty']->key => $_smarty_tpl->tpl_vars['ty']->value){
$_smarty_tpl->tpl_vars['ty']->_loop = true;
?>
                            <li><a href="__APP__/Test/index/pid/<?php echo $_smarty_tpl->tpl_vars['ty']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['ty']->value['name'];?>
</a></li>
                            <?php } ?> 
                        </ul>
                    </div>
                    <div class="m_pay_list">
                        <div class="tt">
                            <h3>最新试题榜</h3>
                        </div>
                        
                        <div style="height:300px; width:230px">
                            <ul id="did">
                                <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['newlist']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                                <li class="cc"><span>新</span><a href="__APP__/Test/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</a>
                                </li>
                                <?php } ?>
                             </ul>
                         </div>
                         
                    </div>
                </div>
                <!--右侧结束-->  
            </div>
        </div>
    </div>
</div>
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</body></html>
 <script type="text/javascript" charset="utf-8">
            $(function(){
                var mytime=setInterval(function(){
                    $("#did li:last").hide().prependTo("#did").slideDown(1000);   
                    },800);
                $(".m_pay_list").mouseover(function(){
                    clearInterval(mytime);
                    mytime=null;
                    });
                 $(".m_pay_list").mouseleave(function(){
                    mytime=setInterval(function(){
                    $("#did li:last").hide().prependTo("#did").slideDown(1000);   
                    },800);
                  
                });

                //添加鼠标移入移除事件
                    var cc=null;
                    $(".testlist").mouseover(function(){
                        //鼠标移入事件处理
                    cc=$(this).css("background");
                    var rr=Math.floor(Math.random()*255);
                    var gg=Math.floor(Math.random()*255);
                    var bb=Math.floor(Math.random()*255);
                    if(rr<=150){
                        rr+=150;
                    }
                    if(gg<=150){
                        gg+=150;
                    }
                    if(bb<=150){
                        bb+=150;
                    }
                    var rgb="rgb("+rr+","+gg+","+bb+")";
                    $(this).css("background",rgb);
                      }).mouseout(function(){
                //鼠标移除事件处理
                $(this).css("background",cc);
                });
                $('.testlist').mouseover(function(){
                //鼠标移入事件处理
                 $(this).css("borderColor",'blue');
                }).mouseout(function(){
                //鼠标移除事件处理
                $(this).css("borderColor",'#ddd');
        });
    })
         </script> 
         
<?php }} ?>