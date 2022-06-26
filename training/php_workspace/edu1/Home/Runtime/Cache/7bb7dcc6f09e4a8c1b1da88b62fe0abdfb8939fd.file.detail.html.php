<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 10:56:17
         compiled from "./Home/Tpl\Test\detail.html" */ ?>
<?php /*%%SmartyHeaderCode:18628156805cd8dcd195fc96-36869694%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7bb7dcc6f09e4a8c1b1da88b62fe0abdfb8939fd' => 
    array (
      0 => './Home/Tpl\\Test\\detail.html',
      1 => 1393232820,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18628156805cd8dcd195fc96-36869694',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
    'tid' => 0,
    'list' => 0,
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dcd19aa02',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dcd19aa02')) {function content_5cd8dcd19aa02($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>试题详情页</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="__PUBLIC__/js/zDialog.js.js"></script>
        <script type="text/javascript" src="__PUBLIC__/js/zDrag.js.js"></script>
    </head>
    <body>
    <div id="browser"></div>
        <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

        
<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="">试题详情</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li><a href="__URL__/index">试题列表</a></li>
            </ul>
        </div>
    </div>
</div>
        <script type="text/javascript" charset="utf-8">
            
            $(function(){
                $(".quest").css("display","none");

                var min=$("#min").html();
                var sec=$("#sec").html();
                var mytime=null;
                min = parseInt(min);
                sec = parseInt(sec);
                
                $("#bigin").click(function(){
                    $(".quest").css("display","block");
                    $(this).css("display","none");
                    mytime = setInterval(fun,1000);
                });
                function fun(){
                    sec--;
                    if(sec<0){
                        min--;
                        sec=59;
                        if(min<0){
                            alert("答题时间到,系统自动提交!");
                            clearInterval(mytime);
                            mytime=null;
                            $("#form").submit();
                            return;
                        };
                    };
                    //min=(min<10?"0"+min:min);
                    sec=(sec<10) ? "0"+sec : sec;
                    $("#min").html(min);
                    $("#sec").html(sec);
            
                }
            
            });
        </script>
        <style type="text/css">
            #dada{
                width:943px;height:70px;background-color:#EDE6ED;text-align:center;
            }
            #title{
                color:#1cd1a0;font-size:30px;font-family:微软雅黑;
            }
            #time{
                width:943px;height:70px;background-color:#EDE6ED;text-align:center; 
            }
            font.time1{
                color:#aaa;font-size:20px;
                
            }
            font.time2{
                color:red;font-size:30px;font-family:微软雅黑;
            }
            #content{
                background-color:#EDE6ED;
            }
            h4.quest{
                font-size:20px;font-family:微软雅黑;color:#5D5D5D;margin:10px;
            }
            #cont{
                font-size:17px;font-family:微软雅黑; color:#5D5D5D;line-height:20px;
            }
            #radio{
                color:#838383;font-size:15px;font-family:微软雅黑;
            }
        </style>
<div id="main">
    <div class="container">
        <div class="home_module row">
            <div class="container">
                    <div class="m_r_list g_t_list mt5">
                        <div id="dada" style="width:100%">
                            <span><font id="title">☻__<?php echo $_smarty_tpl->tpl_vars['title']->value;?>
__☻</font></span>
                        </div>
                         <div id="time" style="width:100%">
                             <span>
                                 <font class="time1">本次测试时间剩余</font>
                                 <font class="time2"><b id="min"> 20 </b></font>
                                 <font class="time1">分钟 </font>
                                 <font class="time2"><b id="sec"> 00 </b></font>
                                 <font class="time1">秒,30分钟后自动提交</font>
                             </span>
                         </div>
                         <div id="content">
                            <h4 class="quest">单选题:本套题共二十题,每题五分,总分100分</h4>
                            <form id="form" method="post" action="__APP__/Test/score">
                            <input type="hidden" name="tid" value="<?php echo $_smarty_tpl->tpl_vars['tid']->value;?>
">
                            <input type="hidden" name="uid" value="<?php echo $_SESSION['user']['id'];?>
">
                            <ul class="quest">
                            <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                                <li id="cont"><?php echo $_smarty_tpl->tpl_vars['vo']->iteration;?>
.<?php echo $_smarty_tpl->tpl_vars['vo']->value['content'];?>
</br></br>
                                <p id="radio">
                                    <input type="radio" name="test[<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
]" value="A"> A.<?php echo $_smarty_tpl->tpl_vars['vo']->value['aA'];?>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="test[<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
]" value="B"> B.<?php echo $_smarty_tpl->tpl_vars['vo']->value['aB'];?>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="test[<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
]" value="C"> C.<?php echo $_smarty_tpl->tpl_vars['vo']->value['aC'];?>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="test[<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
]" value="D"> D.<?php echo $_smarty_tpl->tpl_vars['vo']->value['aD'];?>

                                </p>
                                </li>
                            <?php } ?>
                        </ul>
                        </div>
                            <ul>
                                <li>
                                    <div id="bigin"  class="btn btn-primary btn-lg btn-block">点我开始答题哦^_^!</div>
                                </li>
                            </ul>
                            <div class="mb30 m_cats">
                                <ul class="quest">  
                                    <li><button type="submit" class="btn btn-primary btn-lg btn-block">答题完毕,提交试题</button></li>
                                </ul>
                            </div>
                            </form>
                        </div>
                </div>
        </div>
    </div>
</div>

    <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>


  </body></html>
<?php }} ?>