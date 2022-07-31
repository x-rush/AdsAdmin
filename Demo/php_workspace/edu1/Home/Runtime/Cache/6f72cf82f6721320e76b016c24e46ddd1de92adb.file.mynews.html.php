<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 10:56:37
         compiled from "./Home/Tpl\Message\mynews.html" */ ?>
<?php /*%%SmartyHeaderCode:1581599635cd8dce5e06152-06716669%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6f72cf82f6721320e76b016c24e46ddd1de92adb' => 
    array (
      0 => './Home/Tpl\\Message\\mynews.html',
      1 => 1393439744,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1581599635cd8dce5e06152-06716669',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'user' => 0,
    'mnum' => 0,
    'mnum2' => 0,
    'hf1' => 0,
    'vo1' => 0,
    'hf2' => 0,
    'vo2' => 0,
    'hf3' => 0,
    'vo3' => 0,
    'vo' => 0,
    'cat' => 0,
    'ty' => 0,
    'person' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dce600811',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dce600811')) {function content_5cd8dce600811($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>我的动态</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    
        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/message.css">
        
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
                        <?php if ($_smarty_tpl->tpl_vars['user']->value['id']!=$_SESSION['user']['id']){?>
                        <button class='nolike' vv='y' style='display:<?php if ($_smarty_tpl->tpl_vars['user']->value['like']=="y"){?>block<?php }else{ ?>none<?php }?>;margin:15px 0px 0px 0px;float:left;width:55px;color:#f00;background:#1A7ED3;height:25px;font:bold 12px "宋体";'>已关注</button>
                        <button class='like' vv='n' style='display:<?php if ($_smarty_tpl->tpl_vars['user']->value['like']=="n"){?>block<?php }else{ ?>none<?php }?>;margin:15px 0px 0px 0px;float:left;width:55px;color:#f00;background:#83ADCE;height:25px;font:bold 12px "宋体";'><b>+</b> 关注</button>
                        <?php }?>
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
                        <div class='menu' style='background:#A76CAF':if expand("%") == ""|browse confirm w|else|confirm w|endif
                            >
                            <a style='color:#fff' href='__APP__/Message/mynews'>我的动态</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/mylike'>我的收藏</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/myfri'>我的关注</a>
                        </div>
                        <?php }?>
                    </div>
                    <br>
                    <div class="tt">
                        <h3>我的动态</h3>
                    </div>
                    <?php if ($_SESSION['user']['hfnum']!='0'){?>
                    <form action='__APP__/Message/readall' method='post'>
                        <input type='hidden' name='id' value='<?php  $_smarty_tpl->tpl_vars['vo1'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo1']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['hf1']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo1']->key => $_smarty_tpl->tpl_vars['vo1']->value){
$_smarty_tpl->tpl_vars['vo1']->_loop = true;
?><?php echo $_smarty_tpl->tpl_vars['vo1']->value['id'];?>
,<?php } ?><?php  $_smarty_tpl->tpl_vars['vo2'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo2']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['hf2']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo2']->key => $_smarty_tpl->tpl_vars['vo2']->value){
$_smarty_tpl->tpl_vars['vo2']->_loop = true;
?><?php echo $_smarty_tpl->tpl_vars['vo2']->value['id'];?>
,<?php } ?>'>
                        <input type='hidden' name='qid' value='<?php  $_smarty_tpl->tpl_vars['vo3'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo3']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['hf3']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo3']->key => $_smarty_tpl->tpl_vars['vo3']->value){
$_smarty_tpl->tpl_vars['vo3']->_loop = true;
?><?php echo $_smarty_tpl->tpl_vars['vo3']->value['id'];?>
,<?php } ?>'>
                        <input style='background:#F02424;color:#fff;float:right;padding:1px 2px;border:0px solid red;' type='submit' name='sub' value='全部标为已读'>
                    </form>
                    <?php }?>
                    <div style='float:left;width:100%;font:bold 16px "黑体";color:#F24350;margin-top:2px;'>评论消息</div>
                    <br>
                    <ul class="list_pb20">
                        <?php if ($_smarty_tpl->tpl_vars['hf1']->value==array()){?><div style='float:left;width:90%;height:30px;margin-left:20px;'>无</div><?php }?>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['hf1']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                        <div style='float:left;margin:5px;border-bottom:1px dashed #bbb;width:100%;'> 
                            <div class="t_ml_120" style='margin-left:10px;float:left;width:73%;'>
                                <a href="__URL__/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
" target='blank'><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a> 评论了我的帖子 <a href="__URL__/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['mid'];?>
" target='blank'>《<?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
》</a>：<br>
                                <div style='margin:5px;float:left;text-indent:6ex;font:normal 16px "宋体";color:#222;'><b><?php echo preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['content']);?>
</b><?php if (preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['content'])!=$_smarty_tpl->tpl_vars['vo']->value['content']){?>&lt;图片&gt;<?php }?></div>
                            </div>
                            <span style='margin:8px 0px 0px 10px;float:right;width:130px;font:normal 12px "宋体"'>
                                <a class='hf' href='javascript:void(0)'><span style='font-weight:bold;margin-left:10px;'>回复</span></a>　　
                                <a class='del' href='__APP__/Message/delcomm/cid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
'><span style='font-weight:bold'>删除</span></a><br><br>
                                <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                            </span>
                        </div>
                        <div class='replay' style='display:none;float:right;width:90%'>
                            <textarea class='text' style='margin:5px' name="content" rows="2" cols="55%"></textarea>
                            <input class='pid' type='hidden' name='pid' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
'>
                            <input class='mid' type='hidden' name='mid' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['mid'];?>
'>
                            <input class='hf' type='hidden' name='hf' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
'>
                            <input class='button' style='float:right;font:bold 14px "楷体";width:50px;height:25px;margin:5px;' type='submit' name='sub' value='回复'>
                        </div>
                        <?php } ?>            
                    </ul>
                    <div style='float:left;width:100%;'></div>
                    <div style='float:left;width:100%;font:bold 16px "黑体";color:#F24350;margin-top:2px;'>回复消息</div>
                    <br>
                    <ul class="list_pb20">
                        <?php if ($_smarty_tpl->tpl_vars['hf2']->value==array()){?><div style='float:left;width:90%;height:30px;margin-left:20px;'>无</div><?php }?>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['hf2']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                        <div style='float:left;margin:5px;border-bottom:1px dashed #bbb;width:100%;'> 
                            <div class="t_ml_120" style='margin-left:10px;float:left;width:73%;'>
                                <a href="__URL__/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
" target='blank'><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a> 回复了我在帖子 <a href="__URL__/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['mid'];?>
" target='blank'>《<?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
》</a> 的评论（<?php echo preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['mypl']);?>
）：<br>
                                <div style='float:left;margin:5px;text-indent:6ex;font:bold 16px "宋体";color:#222;'><b><?php echo preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['content']);?>
</b><?php if (preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['content'])!=$_smarty_tpl->tpl_vars['vo']->value['content']){?>&lt;图片&gt;<?php }?></div>
                            </div>
                            <span style='margin:8px 0px 0px 15px;float:right;width:130px;font:normal 12px "宋体"'>
                                <a class='hf' href='javascript:void(0)'><span style='margin-left:10px;font-weight:bold'>回复</span></a>　　
                                <a class='del' href='__APP__/Message/delcomm/cid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
'><span style='font-weight:bold'>删除</span></a><br><br>
                                <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                            </span>
                        </div>
                        <div class='replay' style='display:none;float:right;width:90%;'>
                            <textarea class='text' style='margin:5px' name="content" rows="2" cols="55%"></textarea>
                            <input class='pid' type='hidden' name='pid' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['pid'];?>
'>
                            <input class='mid' type='hidden' name='mid' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['mid'];?>
'>
                            <input class='hf' type='hidden' name='hf' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
'>
                            <input class='button' style='float:right;font:bold 14px "楷体";width:50px;height:25px;margin:5px;' type='submit' name='sub' value='回复'>
                        </div>
                        <?php } ?>            
                    </ul>
                    <div style='float:left;width:100%;'></div>
                    <div style='float:left;width:100%;font:bold 16px "黑体";color:#F24350;margin-top:2px;'>我的问题提示消息</div>
                    <br>
                    <ul class="list_pb20">
                        <?php if ($_smarty_tpl->tpl_vars['hf3']->value==array()){?><div style='float:left;width:90%;height:30px;margin-left:20px;'>无</div><?php }?>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['hf3']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                        <div style='float:left;margin:5px;border-bottom:1px dashed #bbb;width:100%;'> 
                            <div class="t_ml_120" style='margin-left:10px;float:left;width:73%;'>
                                <a href="__URL__/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['tid'];?>
" target='blank'><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a> 回答了我的问题 <a href="__APP__/Question/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
/r/1" target='blank'>《<?php echo preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['content']);?>
</b><?php if (preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['content'])!=$_smarty_tpl->tpl_vars['vo']->value['content']){?>&lt;图片&gt;<?php }?>》</a>：<br>
                                <div style='float:left;margin:5px;text-indent:6ex;font:bold 16px "宋体";color:#222;'><b><?php echo preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['replay']);?>
</b><?php if (preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['replay'])!=$_smarty_tpl->tpl_vars['vo']->value['replay']){?>&lt;图片&gt;<?php }?></div>
                            </div>
                            <span style='margin:35px 0px 0px 15px;float:right;width:130px;font:normal 12px "宋体"'>
                                <a href='__APP__/Question/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
/r/1' target='blank'><span style='font-weight:bold'>查看详情</span></a>
                            </span>
                        </div>
                        <div class='replay' style='display:none;float:right;width:90%;'>
                            <textarea class='text' style='margin:5px' name="content" rows="2" cols="55%"></textarea>
                            <input class='pid' type='hidden' name='pid' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['pid'];?>
'>
                            <input class='mid' type='hidden' name='mid' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['mid'];?>
'>
                            <input class='hf' type='hidden' name='hf' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
'>
                            <input class='button' style='float:right;font:bold 14px "楷体";width:50px;height:25px;margin:5px;' type='submit' name='sub' value='回复'>
                        </div>
                        <?php } ?>            
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
        //鼠标移入移除事件
        $('.m_newlist').mouseover(function(){
            //鼠标移入事件处理
            $(this).css("borderColor",'blue');
        }).mouseout(function(){
            //鼠标移除事件处理
            $(this).css("borderColor",'#ddd');
        });
        //回复按钮
        $('.hf').click(function(){
            if($(this).text()=='回复'){
                $(this).parent().parent().next().slideDown("slow");
            }else{
                $(this).parent().parent().next().slideUp("normal");
            }
        });
        //添加回复
        $(".button").click(function(){
            var $content=$(this).parent('.replay').find('.text').val();
            if(!$content.trim()){
                die;
            }
            var $pid=$(this).parent('.replay').find('.pid').val();
            var $mid=$(this).parent('.replay').find('.mid').val();
            var $hf=$(this).parent('.replay').find('.hf').val();
            var div=$(this).parent('.replay');
            $.ajax({
                url:"__APP__/Message/comm",     //请求地址
                type:"post",                    //发送方式
                data:{content:$content,mid:$mid,pid:$pid,hf:$hf},        //发送的数据
                dataType:"json",                //响应数据的方式
                async:true,
                success:function(data){
                    div.slideUp("normal");
                    div.prev().find('.hf').text('已回复');
                    div.prev().find('.hf').css('color','red');
                    $('.hfnum').text(parseInt($('.hfnum').text())-1);
                },
                error:function(){
                    alert("亲，请登录！");
                }
            });
        });
    });
</script>
<?php }} ?>