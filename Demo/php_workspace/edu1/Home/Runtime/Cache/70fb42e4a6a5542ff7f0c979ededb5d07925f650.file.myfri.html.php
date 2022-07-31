<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 13:16:39
         compiled from "./Home/Tpl\Message\myfri.html" */ ?>
<?php /*%%SmartyHeaderCode:19384068475cd8fdb7ca6658-19667963%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '70fb42e4a6a5542ff7f0c979ededb5d07925f650' => 
    array (
      0 => './Home/Tpl\\Message\\myfri.html',
      1 => 1393439746,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19384068475cd8fdb7ca6658-19667963',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'user' => 0,
    'mnum' => 0,
    'mnum2' => 0,
    'myfri' => 0,
    'myfs' => 0,
    'list' => 0,
    'vo' => 0,
    'pageinfo' => 0,
    'list2' => 0,
    'pageinfo2' => 0,
    'cat' => 0,
    'ty' => 0,
    'person' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8fdb7e7f14',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8fdb7e7f14')) {function content_5cd8fdb7e7f14($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>我的关注</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/message.css">
        <style type="text/css">
        .ml10{
            margin-left:100px;
        }
        </style>
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script>
       
    </head>
    <body>
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="__APP__/Message/mine">个人中心</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li><a href="__APP__/Message/index">贴吧首页</a></li>
                <li class="btn-upload-w"><a href="__APP__/Message/add" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>发帖去~</a></li>
                <li><a href="__APP__/Question/index">问题首页</a></li>
                <li class="btn-upload-w"><a href="__APP__/Question/add" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>提问去~</a></li>
            </ul>
        </div>
    </div>
</div>
        
<div id="main">
    <div class="container">
        <div class="home_module row">
            <div class="container">
                
                <div class="col-md-8">
                    <div style='border:1px solid #ddd;width:100%;height:100px;background:url("__PUBLIC__/images/t_bg.jpg") 0px 40px no-repeat'>
                        <div style='float:left;width:100px;height:100px;'>
                            <img style='width:100px;height:100px' src="__PUBLIC__/uploads/users/<?php if ($_smarty_tpl->tpl_vars['user']->value['picture']!=''&&$_smarty_tpl->tpl_vars['user']->value['picture']!='1.jpg'){?><?php echo $_smarty_tpl->tpl_vars['user']->value['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['user']->value['picture'];?>
<?php }else{ ?>0/1.jpg<?php }?>">
                        </div>
                        <div style='margin:15px 0px 0px 50px;float:left;width:150px;height:30px;font:bold 20px "楷体";'>
                            <?php if ($_smarty_tpl->tpl_vars['user']->value['name']!=''){?><?php echo $_smarty_tpl->tpl_vars['user']->value['name'];?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['user']->value['username'];?>
<?php }?>
                        </div>
                        <div class='dhf' style='margin:23px 0px 0px 7%;float:left;width:140px;height:17px;font:normal 12px "宋体";'>
                            <?php if ($_smarty_tpl->tpl_vars['user']->value['id']==$_SESSION['user']['id']){?>
                                <a href='__APP__/Message/mynews'>最新动态：待回复消息 <?php echo $_SESSION['user']['hfnum'];?>
</a>
                            <?php }?>
                        </div>
                        <div style='float:left;width:80%;height:2px;'></div>
                        <div style='margin:0px 0px 0px 50px;float:left;width:74%;height:17px;font:normal 12px "宋体";'>
                            发帖：<?php echo $_smarty_tpl->tpl_vars['mnum']->value;?>
　提问：<?php echo $_smarty_tpl->tpl_vars['mnum2']->value;?>

                        </div>
                        <?php if ($_smarty_tpl->tpl_vars['user']->value['id']==$_SESSION['user']['id']){?>
                        <div class='menu'>
                            <a href='__APP__/Message/mymess'>我的帖子</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/myques'>我的问题</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/mynews'>我的动态</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/mylike'>我的收藏</a>
                        </div>
                        <div class='menu' style='background:#A76CAF'>
                            <a style='color:#fff' href='__APP__/Message/myfri'>我的关注</a>
                        </div>
                        <?php }else{ ?>
                        <div class='menu'>
                            <a href='__APP__/Message/mymess/uid/<?php echo $_GET['uid'];?>
'>他的帖子</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/myques/uid/<?php echo $_GET['uid'];?>
'>他的问题</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/mylike/uid/<?php echo $_GET['uid'];?>
'>他的收藏</a>
                        </div>
                        <div class='menu' style='background:#A76CAF'>
                            <a style='color:#fff' href='__APP__/Message/myfri/uid/<?php echo $_GET['uid'];?>
'>他的关注</a>
                        </div>
                        <?php }?>
                    </div>
                    <br>
                    <div>
                        <a href='javascript:void(0)'><span class='myfri' style='background:#6FB4EA;padding:3px;font:bold 14px "宋体";color:#fff;'><?php if ($_smarty_tpl->tpl_vars['user']->value['id']==$_SESSION['user']['id']){?>我的关注<?php }else{ ?>他的关注<?php }?>(<span id='num'><?php echo $_smarty_tpl->tpl_vars['myfri']->value;?>
</span>)</span></a> | 
                        <a href='javascript:void(0)'><span class='myfs' style='background:#fff;padding:3px;font:bold 14px "宋体";color:#888;'><?php if ($_smarty_tpl->tpl_vars['user']->value['id']==$_SESSION['user']['id']){?>我的粉丝<?php }else{ ?>他的粉丝<?php }?>(<?php echo $_smarty_tpl->tpl_vars['myfs']->value;?>
)</span></a>
                    </div>
                    <br>
                    <ul class="list_pb20" id='myfri'>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                        <li style='float:left;width:48%;margin:5px;height:70px;border-bottom:1px dashed #bbb;'>
                            <div style='margin:5px 20px;float:left;width:50px;height:50px;'>
                                <a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['fid'];?>
'><img style='width:50px;height:50px' src='__PUBLIC__/uploads/users/<?php if ($_smarty_tpl->tpl_vars['vo']->value['picture']!=''&&$_smarty_tpl->tpl_vars['vo']->value['picture']!="1.jpg"){?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
<?php }else{ ?>0/0.jpg<?php }?>'></a>
                            </div>
                            <div style='float:left;margin-top:3px;width:150px;font:bold 16px "宋体";'>
                                <a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['fid'];?>
'><?php if ($_smarty_tpl->tpl_vars['vo']->value['name']!=''){?><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
<?php }?></a>
                            </div>
                            <div style='float:left;width:60%'></div>
                            <div style='float:left;width:60px;font:normal 12px "宋体";'>
                                Sex：<?php if ($_smarty_tpl->tpl_vars['vo']->value['sex']==''){?>保密<?php }else{ ?><?php if ($_smarty_tpl->tpl_vars['vo']->value['sex']=='1'){?>男<?php }else{ ?>女<?php }?><?php }?>
                            </div>
                            <div style='float:left;width:50px;font:normal 12px "宋体";'>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['age']!=''){?>Age：<?php echo $_smarty_tpl->tpl_vars['vo']->value['age'];?>
<?php }?>
                            </div>
                            <div style='float:left;font:normal 12px "宋体";'>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['class']!=''){?>Class：<?php echo $_smarty_tpl->tpl_vars['vo']->value['class'];?>
<?php }?>
                            </div>
                            <div class='ll' style='margin-top:8px;float:left;height:25px;width:65%;font:normal 14px "楷体";'>
                                <div style='float:left;'>关注<?php echo $_smarty_tpl->tpl_vars['vo']->value['fri'];?>
 | 粉丝<?php echo $_smarty_tpl->tpl_vars['vo']->value['fs'];?>
</div>
                                <?php if ($_SESSION['user']['id']!=$_smarty_tpl->tpl_vars['vo']->value['fid']){?>
                                <a href='javascript:void(0)'>
                                    <div class='nolike' vv='y' fid='<?php echo $_smarty_tpl->tpl_vars['vo']->value['fid'];?>
' style='display:<?php if ($_smarty_tpl->tpl_vars['vo']->value['like']=="y"){?>block<?php }else{ ?>none<?php }?>;width:70px;text-align:center;float:right;border:1px solid blue;padding:2px;color:red;'>取消关注</div>
                                    <div class='like' vv='n' fid='<?php echo $_smarty_tpl->tpl_vars['vo']->value['fid'];?>
' style='display:<?php if ($_smarty_tpl->tpl_vars['vo']->value['like']=="n"){?>block<?php }else{ ?>none<?php }?>;width:70px;text-align:center;float:right;border:1px solid red;padding:2px;color:blue;'>+ 关注</div>
                                </a>
                                <?php }?>
                            </div>
                        </li>
                        <?php } ?>
                        <div style='width:100%;float:left'>
                        <li style='float:right'><?php echo $_smarty_tpl->tpl_vars['pageinfo']->value;?>
</li>
                    </ul>
                    <ul class="list_pb20" id='myfs' style='display:none'>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list2']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                        <li style='float:left;width:48%;margin:5px;height:70px;border-bottom:1px dashed #bbb;'>
                            <div style='margin:5px 20px;float:left;width:50px;height:50px;'>
                                <a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
'><img style='width:50px;height:50px' src='__PUBLIC__/uploads/users/<?php if ($_smarty_tpl->tpl_vars['vo']->value['picture']!=''&&$_smarty_tpl->tpl_vars['vo']->value['picture']!="1.jpg"){?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
<?php }else{ ?>0/0.jpg<?php }?>'></a>
                            </div>
                            <div style='float:left;margin-top:3px;width:150px;font:bold 16px "宋体";'>
                                <a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
'><?php if ($_smarty_tpl->tpl_vars['vo']->value['name']!=''){?><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
<?php }?></a>
                            </div>
                            <div style='float:left;width:60%'></div>
                            <div style='float:left;width:60px;font:normal 12px "宋体";'>
                                Sex：<?php if ($_smarty_tpl->tpl_vars['vo']->value['sex']==''){?>保密<?php }else{ ?><?php if ($_smarty_tpl->tpl_vars['vo']->value['sex']=='1'){?>男<?php }else{ ?>女<?php }?><?php }?>
                            </div>
                            <div style='float:left;width:50px;font:normal 12px "宋体";'>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['age']!=''){?>Age：<?php echo $_smarty_tpl->tpl_vars['vo']->value['age'];?>
<?php }?>
                            </div>
                            <div style='float:left;font:normal 12px "宋体";'>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['class']!=''){?>Class：<?php echo $_smarty_tpl->tpl_vars['vo']->value['class'];?>
<?php }?>
                            </div>
                            <div class='ll' style='margin-top:8px;float:left;height:25px;width:65%;font:normal 14px "楷体";'>
                                <div style='float:left;'>关注<?php echo $_smarty_tpl->tpl_vars['vo']->value['fri'];?>
 | 粉丝<?php echo $_smarty_tpl->tpl_vars['vo']->value['fs'];?>
</div>
                                <?php if ($_SESSION['user']['id']!=$_smarty_tpl->tpl_vars['vo']->value['uid']){?>
                                <a href='javascript:void(0)'>
                                    <div class='nolike' vv='y' fid='<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
' style='display:<?php if ($_smarty_tpl->tpl_vars['vo']->value['like']=="y"){?>block<?php }else{ ?>none<?php }?>;width:70px;text-align:center;float:right;border:1px solid blue;padding:2px;color:red;'>互相关注</div>
                                    <div class='like' vv='n' fid='<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
' style='display:<?php if ($_smarty_tpl->tpl_vars['vo']->value['like']=="n"){?>block<?php }else{ ?>none<?php }?>;width:70px;text-align:center;float:right;border:1px solid red;padding:2px;color:blue;'>+ 关注</div>
                                </a>
                                <?php }?>
                            </div>
                        </li>
                        <?php } ?>
                        <div style='width:100%;float:left'>
                        <li style='float:right'><?php echo $_smarty_tpl->tpl_vars['pageinfo2']->value;?>
</li>
                    </ul>
                        
                </div>


                <!-- 右侧 -->
                <div class="col-md-4">
                    <div class="mb30 m_cats">
                        <div class="tt">
                            <h3>帖子标签</h3>
                            <a href="__APP__/Cat/index" class="more">所有标签 »</a>
                        </div>
                        <ul class="list_ib" style='width:230px;'>
                            <?php  $_smarty_tpl->tpl_vars['ty'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ty']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['cat']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['ty']->key => $_smarty_tpl->tpl_vars['ty']->value){
$_smarty_tpl->tpl_vars['ty']->_loop = true;
?>
                                <li><a href="__APP__/Message/index2/pid/<?php echo $_smarty_tpl->tpl_vars['ty']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['ty']->value['name'];?>
</a></li>

                            <?php } ?>
                        </ul>
                    </div>

                    
                    <div class="m_pay_list">
                        <div class="tt">
                            <h3>活跃用户</h3>
                        </div>
                        <ol>
                            <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['person']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                            <li><span><?php echo $_smarty_tpl->tpl_vars['vo']->iteration;?>
</span><a href="__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><img style='width:50px;height:50px;' src='__PUBLIC__/uploads/users/<?php if ($_smarty_tpl->tpl_vars['vo']->value['picture']!=''&&$_smarty_tpl->tpl_vars['vo']->value['picture']!="1.jpg"){?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
<?php }else{ ?>0/0.jpg<?php }?>'>　<?php if ($_smarty_tpl->tpl_vars['vo']->value['name']!=''){?><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
<?php }?></a></li>
                            <?php } ?>
                        </ol>
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
        $('.myfri').click(function(){
            if($('#num').html()!='<?php echo $_smarty_tpl->tpl_vars['myfri']->value;?>
'){
                window.location.reload();
            }
            $('#myfri').slideDown("slow");
            $('#myfs').fadeOut("slow");
            $('.myfs').css({'background':'#fff','color':'#888'});
            $('.myfri').css({'background':'#6FB4EA','color':'#fff'});
        });
        $('.myfs').click(function(){
            $('#myfs').slideDown("slow");
            $('#myfri').hide();
            $('.myfri').css({'background':'#fff','color':'#888'});
            $('.myfs').css({'background':'#6FB4EA','color':'#fff'});
        });
        //关注
        $(".like").click(function(){
            var vv=$(this).attr('vv');
            var fid=$(this).attr('fid');
            var div=$(this);
            $.ajax({
                url:"__APP__/Message/friend",     //请求地址
                type:"post",                    //发送方式
                data:{vv:vv,fid:fid},        //发送的数据
                dataType:"json",                //响应数据的方式
                async:true,
                success:function(data){
                    div.hide();
                    div.siblings().show();
                    <?php if ($_smarty_tpl->tpl_vars['user']->value['id']==$_SESSION['user']['id']){?>
                    $('#num').html(parseInt($('#num').html())+1);
                    <?php }?>
                },
                error:function(){
                    alert("亲，请登录！");
                }
            })
        });
        //取消
        $(".nolike").click(function(){
            var vv=$(this).attr('vv');
            var fid=$(this).attr('fid');
            var div=$(this);
            $.ajax({
                url:"__APP__/Message/friend",   //请求地址
                type:"post",                    //发送方式
                data:{vv:vv,fid:fid},           //发送的数据
                dataType:"json",                //响应数据的方式
                async:true,
                success:function(data){
                    div.hide();
                    div.siblings().show();
                    <?php if ($_smarty_tpl->tpl_vars['user']->value['id']==$_SESSION['user']['id']){?>
                    $('#num').html(parseInt($('#num').html())-1);
                    <?php }?>
                },
                error:function(){
                    alert("亲，请登录！");
                }
            })
        });
    })
</script>
<?php }} ?>