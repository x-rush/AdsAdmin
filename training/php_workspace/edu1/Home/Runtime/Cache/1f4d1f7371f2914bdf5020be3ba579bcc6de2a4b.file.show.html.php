<?php /* Smarty version Smarty-3.1.6, created on 2019-05-22 20:59:07
         compiled from "./Home/Tpl\Question\show.html" */ ?>
<?php /*%%SmartyHeaderCode:11829766295ce5479b483cf4-29245630%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1f4d1f7371f2914bdf5020be3ba579bcc6de2a4b' => 
    array (
      0 => './Home/Tpl\\Question\\show.html',
      1 => 1393439746,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11829766295ce5479b483cf4-29245630',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
    'list' => 0,
    'cat' => 0,
    'ty' => 0,
    'person' => 0,
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce5479b585a2',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce5479b585a2')) {function content_5ce5479b585a2($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
            margin-left:50px;
            width:600px;
            font:bold 22px "??????";
            text-align:center;
            color:#000;
        }
        </style>
        
		<script type="text/javascript" src="__PUBLIC__/jquery/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="__PUBLIC__/xheditor/xheditor-1.2.1.min.js"></script>
        <script type="text/javascript" src="__PUBLIC__/xheditor/xheditor_lang/zh-cn.js"></script>
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script>
      
	</head>
    <body>
        <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="__APP__/Question/index">????????????</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li><a href="__APP__/Question/index">????????????</a></li>
                <li class="btn-upload-w"><a href="__APP__/Question/add" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>?????????~</a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <ul class="navbar-left">
                <li><a href="__APP__/Message/mine"><i class="icon-list"></i>????????????</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="main">
    <div class="container">
        <div class="home_module row">
            <div class="container">
                <div class="col-md-8">
                    <div class="tt">
                        <h3>??????????????????</h3>
                    </div>
                    <?php if ($_SESSION['user']['id']==$_smarty_tpl->tpl_vars['list']->value['uid']){?>
                        <h4><a href='__APP__/Question/edit/id/<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value['uid'];?>
'>???????????????</a></h4>
                    <?php }?>
                    <a href='javascript:void(0)'><div class='nolike' vv='y' style='display:<?php if ($_smarty_tpl->tpl_vars['list']->value['like']=="y"){?>block<?php }else{ ?>none<?php }?>;margin:5px;float:left;width:60px;padding:5px 3px;text-align:center;color:#fff;background:#1A7ED3;font:bold 12px "??????";'>?????????</div></a>
                    <a href='javascript:void(0)'><div class='like' vv='n' style='display:<?php if ($_smarty_tpl->tpl_vars['list']->value['like']=="n"){?>block<?php }else{ ?>none<?php }?>;margin:5px;float:left;width:60px;padding:5px 3px;text-align:center;color:#fff;background:#83ADCE;font:bold 12px "??????";'>??????</div></a>
                        <br>
                        <div style='font:normal 14px "??????";margin:10px 50px'>
                            <div style='float:left;width:180px;'>??? ??? ??????<?php echo $_smarty_tpl->tpl_vars['list']->value['username'];?>
</div>
                            ???????????????<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['list']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                        </div>
                        <div style='font:normal 14px "??????";margin-left:50px'>
                            ???????????????<?php echo $_smarty_tpl->tpl_vars['list']->value['cname'];?>

                        </div>
                        <div style='font:normal 14px "??????";margin:10px 50px'>
                            ???????????????<div style='overflow:hidden;margin-left:70px;font:bold 18px "??????"'><?php echo $_smarty_tpl->tpl_vars['list']->value['content'];?>
</div>
                        </div>
                        <hr><hr>
                        <?php if ($_smarty_tpl->tpl_vars['list']->value['replay']==''){?>
                            <div style='font:bold 16px "??????";color:red;margin:10px 220px'>????????????</div>
                        <?php }else{ ?>
                        <div style='font:normal 14px "??????";margin:10px 50px'>
                            <div style='float:left;width:180px;'>??? ??? ??????<?php echo $_smarty_tpl->tpl_vars['list']->value['tname'];?>
</div>
                            ???????????????<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['list']->value['rtime'],"%Y-%m-%d %H:%M:%S");?>

                        </div>
                        <div style='font:normal 14px "??????";margin:10px 50px'>
                            ???????????????<div style='margin-left:70px;font:bold 18px "??????"'><?php echo $_smarty_tpl->tpl_vars['list']->value['replay'];?>
</div>
                        </div>
                        <?php if ($_SESSION['user']['id']==$_smarty_tpl->tpl_vars['list']->value['uid']){?>
                            <div style='float:left;margin:20px 0px 0px 50px;font:normal 16px "??????";color:blue'>??????????????????</div>
                            <div style='float:left;margin:22px 10px;font:bold 14px "??????";color:blue'><a href='__APP__/Message/add/qid/<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
'>?????????????????????!!!</a></div>
                        <?php }?>
                        <?php }?>
                   
                </div>


                <!-- ?????? -->
                <div class="col-md-4">
                    <div class="mb30 m_cats">
                        <div class="tt">
                            <h3>????????????</h3>
                            <a href="__APP__/Cat/index" class="more">???????????? ??</a>
                        </div>
                        <ul class="list_ib" style='width:230px;'>
                            <?php  $_smarty_tpl->tpl_vars['ty'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ty']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['cat']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['ty']->key => $_smarty_tpl->tpl_vars['ty']->value){
$_smarty_tpl->tpl_vars['ty']->_loop = true;
?>
                                <li><a href="__APP__/Question/index2/pid/<?php echo $_smarty_tpl->tpl_vars['ty']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['ty']->value['name'];?>
</a></li>

                            <?php } ?>
                        </ul>
                    </div>
                    <div class="m_pay_list">
                        <div class="tt">
                            <h3>????????????</h3>
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
<?php }else{ ?>0/0.jpg<?php }?>'>???<?php if ($_smarty_tpl->tpl_vars['vo']->value['name']!=''){?><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
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

    </body>
</html>
<script type="text/javascript" charset="utf-8">
    $(function(){
        //????????????
        $(".like").click(function(){
            var vv=$(this).attr('vv');
            var div=$(this);
            $.ajax({
                url:"__APP__/Question/like",     //????????????
                type:"post",                    //????????????
                data:{vv:vv,qid:'<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
'},        //???????????????
                dataType:"json",                //?????????????????????
                async:true,
                success:function(data){
                    $(".like").hide();
                    $(".nolike").show();
                },
                error:function(){
                    alert("??????????????????");
                }
            })
        });
        //????????????
        $(".nolike").click(function(){
            var vv=$(this).attr('vv');
            var div=$(this);
            $.ajax({
                url:"__APP__/Question/like",     //????????????
                type:"post",                    //????????????
                data:{vv:vv,qid:'<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
'},        //???????????????
                dataType:"json",                //?????????????????????
                async:true,
                success:function(data){
                    $(".nolike").hide();
                    $(".like").show();
                },
                error:function(){
                    alert("??????????????????");
                }
            })
        });
    });
</script>
<?php }} ?>