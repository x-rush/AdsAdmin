<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 13:16:39
         compiled from "./Home/Tpl\Message\mylike.html" */ ?>
<?php /*%%SmartyHeaderCode:20348861875cd8fdb70a0184-01855307%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '457a699624395749bd2a47d74d8e5e6ca21c9bde' => 
    array (
      0 => './Home/Tpl\\Message\\mylike.html',
      1 => 1393463458,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20348861875cd8fdb70a0184-01855307',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'user' => 0,
    'mnum' => 0,
    'mnum2' => 0,
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
  'unifunc' => 'content_5cd8fdb724216',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8fdb724216')) {function content_5cd8fdb724216($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_truncate')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.truncate.php';
if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>ζηζΆθ</title>
        
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
            <h1><a href="__APP__/Message/mine">δΈͺδΊΊδΈ­εΏ</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li><a href="__APP__/Message/index">θ΄΄ε§ι¦ι‘΅</a></li>
                <li class="btn-upload-w"><a href="__APP__/Message/add" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>εεΈε»~</a></li>
                <li><a href="__APP__/Question/index">ι?ι’ι¦ι‘΅</a></li>
                <li class="btn-upload-w"><a href="__APP__/Question/add" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>ζι?ε»~</a></li>
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
                        <div style='margin:15px 0px 0px 50px;float:left;width:150px;height:30px;font:bold 20px "ζ₯·δ½";'>
                            <?php if ($_smarty_tpl->tpl_vars['user']->value['name']!=''){?><?php echo $_smarty_tpl->tpl_vars['user']->value['name'];?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['user']->value['username'];?>
<?php }?>
                        </div>
                        <div class='dhf' style='margin:23px 0px 0px 7%;float:left;height:17px;font:normal 12px "ε?δ½";'>
                            <?php if ($_smarty_tpl->tpl_vars['user']->value['id']==$_SESSION['user']['id']){?>
                                <a href='__APP__/Message/mynews'>ζζ°ε¨ζοΌεΎεε€ζΆζ― <?php echo $_SESSION['user']['hfnum'];?>
</a>
                            <?php }?>
                        </div>
                        <?php if ($_smarty_tpl->tpl_vars['user']->value['id']!=$_SESSION['user']['id']){?>
                        <button class='nolike' vv='y' style='display:<?php if ($_smarty_tpl->tpl_vars['user']->value['like']=="y"){?>block<?php }else{ ?>none<?php }?>;margin:15px 0px 0px 150px;float:left;width:55px;color:#f00;background:#1A7ED3;height:25px;font:bold 12px "ε?δ½";'>ε·²ε³ζ³¨</button>
                        <button class='like' vv='n' style='display:<?php if ($_smarty_tpl->tpl_vars['user']->value['like']=="n"){?>block<?php }else{ ?>none<?php }?>;margin:15px 0px 0px 150px;float:left;width:55px;color:#f00;background:#83ADCE;height:25px;font:bold 12px "ε?δ½";'><b>+</b> ε³ζ³¨</button>
                        <?php }?>
                        <div style='float:left;width:80%;height:2px;'></div>
                        <div style='margin:0px 0px 0px 50px;float:left;width:74%;height:17px;font:normal 12px "ε?δ½";'>
                            εεΈοΌ<?php echo $_smarty_tpl->tpl_vars['mnum']->value;?>
γζι?οΌ<?php echo $_smarty_tpl->tpl_vars['mnum2']->value;?>

                        </div>
                        <?php if ($_smarty_tpl->tpl_vars['user']->value['id']==$_SESSION['user']['id']){?>
                        <div class='menu'>
                            <a href='__APP__/Message/mymess'>ζηεΈε­</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/myques'>ζηι?ι’</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/mynews'>ζηε¨ζ</a>
                        </div>
                        <div class='menu' style='background:#A76CAF'>
                            <a style='color:#fff' href='__APP__/Message/mylike'>ζηζΆθ</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/myfri'>ζηε³ζ³¨</a>
                        </div>
                        <?php }else{ ?>
                        <div class='menu'>
                            <a href='__APP__/Message/mymess/uid/<?php echo $_GET['uid'];?>
'>δ»ηεΈε­</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/myques/uid/<?php echo $_GET['uid'];?>
'>δ»ηι?ι’</a>
                        </div>
                        <div class='menu' style='background:#A76CAF'>
                            <a style='color:#fff' href='__APP__/Message/mylike/uid/<?php echo $_GET['uid'];?>
'>δ»ηζΆθ</a>
                        </div>
                        <div class='menu'>
                            <a href='__APP__/Message/myfri/uid/<?php echo $_GET['uid'];?>
'>δ»ηε³ζ³¨</a>
                        </div>
                        <?php }?>
                    </div>
                    <br>
                    <div class="tt">
                        <h3>ζΆθηεΈε­</h3>
                    </div>
                    <div class="m_n_item_info f12 c999" style='background:url("__PUBLIC__/images/m_bt.jpg") repeat-x'>
                        <span class="g_topic_t ml10">γγγγεΈε­ζ ι’γγγγγγγ</span>
                        <span class="g_topic_t ml10">εεΈδΊΊ</span>
                        <span class="g_topic_t ml10">γγεεΈζΆι΄</span>
                    </div>
                    <ul class="list_pb20">
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                        <li class='m_newlist'> 
                            <div class="t_ml_120" style='margin-left:0px;float:left;width:49%;'>
                                <a href="__URL__/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->iteration;?>
γ<?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['vo']->value['title'],13,'...',true);?>
</a>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['img']=='y'){?><img style='margin-top:-2px' src='__PUBLIC__/images/img.png'><?php }?>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='1'){?><img style='margin-top:-2px' src='__PUBLIC__/images/best.png'><?php }?>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['ishot']=='1'){?><img style='margin-top:-2px' src='__PUBLIC__/images/hot.png'><?php }?>
                            </div>
                            <span style='margin:5px 0px 0px 20px;float:left;width:110px;font:normal 14px "ε?δ½"'>
                                <a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
'><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a>
                            </span>
                            <span style='margin:5px 0px 0px 0px;float:left;width:150px;font:normal 14px "ε?δ½"'>
                                <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                            </span>
                        </li>
                        <?php } ?>
                    </ul>
                        <div class="tc">
                            <ul class="pagination">
                                <?php echo $_smarty_tpl->tpl_vars['pageinfo']->value;?>

                            </ul>
                        </div>
                    <div class="tt">
                        <h3>ζΆθηι?ι’</h3>
                    </div>
                    <div class="m_n_item_info f12 c999" style='background:url("__PUBLIC__/images/m_bt.jpg") repeat-x'>
                        <span class="g_topic_t ml10">γγγγι?ι’η?δ»γγγγγγγγγ</span>
                        <span class="g_topic_t ml10">ζΆι΄</span>
                        <span class="g_topic_t ml10">γγ ηΆζ</span>
                    </div>
                    <ul class="list_pb20">
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list2']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                        <li class='m_newlist'> 
                            <div class="t_ml_120" style='margin-left:0px;float:left;width:50%'>
                                <a href="__APP__/Question/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->iteration;?>
γ<?php echo smarty_modifier_truncate(preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['content']),16,'...',true);?>
</a>
                                <?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='1'){?><img style='margin-top:-2px' src='__PUBLIC__/images/best.png'><?php }?>
                            </div>
                            <span style='margin:5px 0px 0px 0px;float:left;width:140px;font:normal 14px "ε?δ½"'>
                                <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                            </span>
                            <?php if ($_smarty_tpl->tpl_vars['vo']->value['replay']==''){?>
                                <span style='border:1px solid #ddd;background:red;color:#fff;margin:5px 0px 0px 30px;text-align:center;float:left;width:60px;font:bold 14px "ζ₯·δ½"'>ζͺεε€</span>
                            <?php }else{ ?>
                                <span style='border:1px solid #ddd;background:blue;color:#fff;margin:5px 0px 0px 30px;text-align:center;float:left;width:60px;font:bold 14px "ζ₯·δ½"'>ε·²εε€</span>
                            <?php }?>
                        </li>
                        <?php } ?>
                    </ul>
                        <div class="tc">
                            <ul class="pagination">
                                <?php echo $_smarty_tpl->tpl_vars['pageinfo2']->value;?>

                            </ul>
                        </div>
                   
                </div>


                <!-- ε³δΎ§ -->
                <div class="col-md-4">
                    <div class="mb30 m_cats">
                        <div class="tt">
                            <h3>εΈε­ζ η­Ύ</h3>
                            <a href="__APP__/Cat/index" class="more">ζζζ η­Ύ Β»</a>
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
                            <h3>ζ΄»θ·η¨ζ·</h3>
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
<?php }else{ ?>0/0.jpg<?php }?>'>γ<?php if ($_smarty_tpl->tpl_vars['vo']->value['name']!=''){?><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
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
<script type="text/javascript" charset='utf-8'>
    $(function(){
        //ε³ζ³¨
        $(".like").click(function(){
            var vv=$(this).attr('vv');
            var div=$(this);
            $.ajax({
                url:"__APP__/Message/friend",     //θ―·ζ±ε°ε
                type:"post",                    //ειζΉεΌ
                data:{vv:vv,fid:'<?php echo $_smarty_tpl->tpl_vars['user']->value['id'];?>
'},        //ειηζ°ζ?
                dataType:"json",                //εεΊζ°ζ?ηζΉεΌ
                async:true,
                success:function(data){
                    $(".like").hide();
                    $(".nolike").show();
                },
                error:function(){
                    alert("δΊ²οΌθ―·η»ε½οΌ");
                }
            })
        });
        //εζΆ
        $(".nolike").click(function(){
            var vv=$(this).attr('vv');
            var div=$(this);
            $.ajax({
                url:"__APP__/Message/friend",     //θ―·ζ±ε°ε
                type:"post",                    //ειζΉεΌ
                data:{vv:vv,fid:'<?php echo $_smarty_tpl->tpl_vars['user']->value['id'];?>
'},        //ειηζ°ζ?
                dataType:"json",                //εεΊζ°ζ?ηζΉεΌ
                async:true,
                success:function(data){
                    $(".nolike").hide();
                    $(".like").show();
                },
                error:function(){
                    alert("δΊ²οΌθ―·η»ε½οΌ");
                }
            })
        });
        //ζ·»ε ιΌ ζ η§»ε₯η§»ι€δΊδ»Ά
        $('.m_newlist').mouseover(function(){
            //ιΌ ζ η§»ε₯δΊδ»Άε€η
            $(this).css("borderColor",'blue');
        }).mouseout(function(){
            //ιΌ ζ η§»ι€δΊδ»Άε€η
            $(this).css("borderColor",'#ddd');
        });
    })
</script>
<?php }} ?>