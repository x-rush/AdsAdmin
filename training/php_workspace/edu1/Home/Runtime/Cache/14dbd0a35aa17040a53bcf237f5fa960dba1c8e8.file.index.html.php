<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 13:16:45
         compiled from "./Home/Tpl\Question\index.html" */ ?>
<?php /*%%SmartyHeaderCode:9226400945cd8fdbd919875-90810068%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '14dbd0a35aa17040a53bcf237f5fa960dba1c8e8' => 
    array (
      0 => './Home/Tpl\\Question\\index.html',
      1 => 1393439746,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '9226400945cd8fdbd919875-90810068',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'list2' => 0,
    'vo' => 0,
    'list1' => 0,
    'pageinfo' => 0,
    'cat' => 0,
    'ty' => 0,
    'person' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8fdbda2afb',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8fdbda2afb')) {function content_5cd8fdbda2afb($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_truncate')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.truncate.php';
if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>问题浏览</title>
        
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
            <h1><a href="__APP__/Question/index">提问中心</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li class="active"><a href="__APP__/Question/index">所有问题</a></li>
                <li class="btn-upload-w"><a href="__APP__/Question/add" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>提问去~</a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <ul class="navbar-left">
                <li><a href="__APP__/Message/mine"><i class="icon-list"></i>个人中心</a></li>
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
                        <h3>推荐问题浏览</h3>
                    </div>
                    <div class="m_n_item_info f12 c999" style='background:url("__PUBLIC__/images/m_bt.jpg") repeat-x'>
                        <span class="g_topic_t ml10">　　　　问题简介　　　　　</span>
                        <span class="g_topic_t ml10">提问人</span>
                        <span class="g_topic_t ml10">　时间　　</span>
                        <span class="g_topic_t ml10">状态</span>
                    </div>
                    <ul class="list_pb20">
                            
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list2']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                        <li class="messlist" style='margin:5px 0px;height:30px;border-bottom:1px dotted #ddd'> 
                            <div class="t_ml_120" style='margin-left:10px;float:left;width:48%;'>
                                <a href="__URL__/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->iteration;?>
、<?php echo smarty_modifier_truncate(preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['content']),16,'...',true);?>
</a>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='1'){?><img style='margin-top:-2px' src='__PUBLIC__/images/best.png'><?php }?>
                            </div>
                            <span style='margin-left:0px;float:left;width:80px;'>
                                <a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
'><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a>
                            </span>
                            <span style='margin:5px 0px 0px 0px;float:left;width:150px;font:normal 14px "宋体"'>
                                <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                            </span>
                            <?php if ($_smarty_tpl->tpl_vars['vo']->value['replay']==''){?>
                                <span style='border:1px solid #ddd;background:red;color:#fff;margin:5px 0px 0px 0px;text-align:center;float:left;width:60px;font:bold 14px "楷体"'>未回复</span>
                            <?php }else{ ?>
                                <span style='border:1px solid #ddd;background:blue;color:#fff;margin:5px 0px 0px 0px;text-align:center;float:left;width:60px;font:bold 14px "楷体"'>已回复</span>
                            <?php }?>
                        </li>
                        <?php } ?>
                    </ul>
                    <br>
                    <div class="tt">
                        <h3>最新问题</h3>
                    </div>
                    <div class="m_n_item_info f12 c999" style='background:url("__PUBLIC__/images/m_bt.jpg") repeat-x'>
                        <span class="g_topic_t ml10">　　　　问题简介　　　　　</span>
                        <span class="g_topic_t ml10">提问人</span>
                        <span class="g_topic_t ml10">　时间　　</span>
                        <span class="g_topic_t ml10">状态</span>
                    </div>
                    <ul class="list_pb20"> 
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list1']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                        <li class='m_newlist' style='margin:5px 0px;height:30px;border-bottom:1px dotted #ddd'> 
                            <div class="t_ml_120" style='margin-left:10px;float:left;width:48%;'>
                                <a href="__URL__/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->iteration;?>
、<?php echo smarty_modifier_truncate(preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['content']),16,'...',true);?>
</a>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='1'){?><img style='margin-top:-2px' src='__PUBLIC__/images/best.png'><?php }?>
                            </div>
                            <span style='margin-left:0px;float:left;width:80px;'>
                                <a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
'><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a>
                            </span>
                            <span style='margin:5px 0px 0px 0px;float:left;width:150px;font:normal 14px "宋体"'>
                                <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                            </span>
                            <?php if ($_smarty_tpl->tpl_vars['vo']->value['replay']==''){?>
                                <span style='border:1px solid #ddd;background:red;color:#fff;margin:5px 0px 0px 0px;text-align:center;float:left;width:60px;font:bold 14px "楷体"'>未回复</span>
                            <?php }else{ ?>
                                <span style='border:1px solid #ddd;background:blue;color:#fff;margin:5px 0px 0px 0px;text-align:center;float:left;width:60px;font:bold 14px "楷体"'>已回复</span>
                            <?php }?>
                        </li>
                        <?php } ?>
                    </ul>
                    <div class="tc">
                        <ul class="pagination">
                            <?php echo $_smarty_tpl->tpl_vars['pageinfo']->value;?>

                        </ul>
                    </div>
                </div>
                <!-- 右侧 -->
                <div class="col-md-4">
                    <div class="mb30 m_cats">
                        <div class="tt">
                            <h3>问题标签</h3>
                            <a href="__APP__/Cat/index" class="more">所有标签 »</a>
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

    </body>
</html>
<script type="text/javascript" charset='utf-8'>
    $(function(){
        //添加鼠标移入移除事件
        var cc=null;
        $(".messlist").mouseover(function(){
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
        $('.m_newlist').mouseover(function(){
            //鼠标移入事件处理
            $(this).css("borderColor",'blue');
        }).mouseout(function(){
            //鼠标移除事件处理
            $(this).css("borderColor",'#ddd');
        });
    })
</script>
<?php }} ?>