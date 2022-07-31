<?php /* Smarty version Smarty-3.1.6, created on 2019-05-12 19:41:26
         compiled from "./Home/Tpl\Message\show.html" */ ?>
<?php /*%%SmartyHeaderCode:1192217585cd80666a2f0e6-42161865%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '08e64c763461a8e7150b92f597acc87080c0efc1' => 
    array (
      0 => './Home/Tpl\\Message\\show.html',
      1 => 1393439744,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1192217585cd80666a2f0e6-42161865',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
    'list' => 0,
    'list1' => 0,
    'vo' => 0,
    'hf' => 0,
    'pageinfo' => 0,
    'cat' => 0,
    'ty' => 0,
    'person' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd80666ad321',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd80666ad321')) {function content_5cd80666ad321($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
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
            font:bold 22px "楷体";
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
            <h1><a href="__APP__/Message/index">贴吧</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li><a href="__APP__/Message/index">帖子总览</a></li>
                <li><a href="__APP__/Message/hot">大家都在看</a></li>
                <li class="btn-upload-w"><a href="__APP__/Message/add" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>发帖去~</a></li>
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
                        <h3><?php echo $_smarty_tpl->tpl_vars['list']->value['title'];?>
</h3>
                    </div>
                    <?php if ($_SESSION['user']['id']==$_smarty_tpl->tpl_vars['list']->value['uid']){?>
                        <h4><a href='__APP__/Message/edit/id/<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value['uid'];?>
'>修改一下下</a></h4>
                    <?php }?>
                    
                    <a href='javascript:void(0)'><div class='nolike' vv='y' style='display:<?php if ($_smarty_tpl->tpl_vars['list']->value['like']=="y"){?>block<?php }else{ ?>none<?php }?>;margin:5px;float:left;width:60px;padding:5px 3px;text-align:center;color:#fff;background:#1A7ED3;font:bold 12px "宋体";'>已收藏</div></a>
                    <a href='javascript:void(0)'><div class='like' vv='n' style='display:<?php if ($_smarty_tpl->tpl_vars['list']->value['like']=="n"){?>block<?php }else{ ?>none<?php }?>;margin:5px;float:left;width:60px;padding:5px 3px;text-align:center;color:#fff;background:#83ADCE;font:bold 12px "宋体";'>收藏</div></a>
                    <div class="m_n_item_info f12 c999" style='background:#fff'>
                        <div style='float:right;color:#555;margin-top:-5px'>
                            <div style='float:left;margin-right:10px;width:200px;'>发帖人：<a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value['uid'];?>
'><b><?php echo $_smarty_tpl->tpl_vars['list']->value['username'];?>
</b></a></div>
                            <div style='float:left;width:170px;'><b><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['list']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</b></div>
                        </div>
                        <br>
                        <div style='float:right;color:#555;margin-top:-10px'>
                            <div style='float:left;margin-right:10px;width:270px;'>标　签：<?php echo $_smarty_tpl->tpl_vars['list']->value['cname'];?>
</div>
                            <div style='float:left;width:100px;'>浏 览 量：<b><?php echo $_smarty_tpl->tpl_vars['list']->value['scan'];?>
</b></div>
                        </div>
                    </div>
                    <div style='width:100%;overflow:hidden;border-top:2px solid #ccc;margin-top:10px'>
                        <br>
                        <?php echo $_smarty_tpl->tpl_vars['list']->value['content'];?>

                    </div>
                    <br>
                    <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list1']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                        <div style='float:left;border:1px solid #ccc;width:100%;'>
                            <div style='float:left;width:100px;'>
                                <a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
'><img style='width:100px;height:100px;' src='__PUBLIC__/uploads/users/<?php if ($_smarty_tpl->tpl_vars['vo']->value['picture']!=''&&$_smarty_tpl->tpl_vars['vo']->value['picture']!="1.jpg"){?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
<?php }else{ ?>0/0.jpg<?php }?>'>
                                <div style='width:100px;height:30px;float:left;text-align:center;font:bold 16px "宋体"'>
                                    <?php if ($_smarty_tpl->tpl_vars['vo']->value['name']!=''){?><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
<?php }?>
                                </div></a>
                            </div>
                            <div style='float:right;width:80%;height:30px;font:normal 12px "宋体";margin:5px 0px 0px 10px'>
                                <b>评论内容：</b>(<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
)
                                <span style='float:right;margin-top:-5px;padding-top:3px;width:20px;height:25px;background:url("__PUBLIC__/images/fn.jpg");font:bold 14px "黑体";text-align:center;color:#fff;'><?php if ($_GET['p']>0){?><?php echo $_smarty_tpl->tpl_vars['vo']->iteration+(($_GET['p']-1)*5);?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['vo']->iteration;?>
<?php }?></span>
                                <?php if ($_SESSION['user']['id']==$_smarty_tpl->tpl_vars['vo']->value['uid']||$_SESSION['user']['id']==$_smarty_tpl->tpl_vars['list']->value['uid']){?>
                                <span style='float:right;margin-top:0px;width:20px;height:25px;text-align:center;'><a href='__APP__/Message/delcomm/cid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
/id/<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
'><img src='__PUBLIC__/images/del.png'></a></span>
                                <?php }?>
                            </div>
                            <div style='float:right;width:80%;margin:5px 0px 0px 10px'>
                                &nbsp;&nbsp;&nbsp;&nbsp;<?php echo $_smarty_tpl->tpl_vars['vo']->value['content'];?>

                                <br>
                            </div>
                            <div style='float:right;text-align:center;width:730px;height:2px;border:0px solid red;'>
                                
                            </div>
                            <div class='ckhf' style='text-align:center;float:right;width:80px;font:normal 12px "宋体";border:3px dotted #EDE6ED;'>
                                <a href='javascript:void(0)'>查看回复(<b class='hnum'><?php echo count($_smarty_tpl->tpl_vars['vo']->value['hf']);?>
</b>)</a>
                            </div>
                            <div style='float:right;text-align:center;width:100%;height:0px;border:0px solid red;'>
                                
                            </div>
                            <div class="replay" style='background:#EDE6ED;display:none;float:right;width:80%;'>
                                <?php  $_smarty_tpl->tpl_vars['hf'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['hf']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['vo']->value['hf']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['hf']->key => $_smarty_tpl->tpl_vars['hf']->value){
$_smarty_tpl->tpl_vars['hf']->_loop = true;
?>
                                    <div style="float:left;width:95%;margin:3px 15px 5px 15px;border-bottom:1px dashed #bbb;">
                                        <a href='__APP__/Message/mine/uid/<?php echo $_smarty_tpl->tpl_vars['hf']->value['uid'];?>
'><img style='float:left;width:50px;height:50px;' src='__PUBLIC__/uploads/users/<?php if ($_smarty_tpl->tpl_vars['hf']->value['picture']!=''&&$_smarty_tpl->tpl_vars['hf']->value['picture']!="1.jpg"){?><?php echo $_smarty_tpl->tpl_vars['hf']->value['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['hf']->value['picture'];?>
<?php }else{ ?>0/0.jpg<?php }?>'>
                                        <div style='width:85%;float:right;font:normal 12px "宋体"'>
                                            <b><?php if ($_smarty_tpl->tpl_vars['hf']->value['name']!=''){?><?php echo $_smarty_tpl->tpl_vars['hf']->value['name'];?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['hf']->value['username'];?>
<?php }?>：</b></a>
                                            <?php echo $_smarty_tpl->tpl_vars['hf']->value['content'];?>

                                            <br>
                                            <?php if ($_SESSION['user']['id']==$_smarty_tpl->tpl_vars['hf']->value['uid']){?>
                                                <span style='float:right'><a href='__APP__/Message/delcomm/cid/<?php echo $_smarty_tpl->tpl_vars['hf']->value['id'];?>
/id/<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
'>删除</a></span><br>
                                            <?php }?>
                                            <span style='float:right'><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['hf']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</span>
                                        </div>
                                    </div>
                                <?php } ?>
                                <div class='rr'>
                                </div>
                                <textarea class='text' style='margin:5px' name="content" rows="2" cols="47%"></textarea>
                                <input class='pid' type='hidden' name='pid' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
'>
                                <input class='button' style='float:right;font:bold 14px "楷体";width:50px;height:25px;margin:5px;' type='submit' name='sub' value='回复'>
                            </div>
                        </div>
                    <?php } ?>
                    <?php echo $_smarty_tpl->tpl_vars['pageinfo']->value;?>

                                
                    <form method="post" action="__APP__/Message/comm/id/<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
" class="pageForm required-validate" onsubmit="return iframeCallback(this)">
                        <input type='hidden' name='status' value="<?php if ($_SESSION['user']['id']==$_smarty_tpl->tpl_vars['list']->value['uid']){?>1<?php }else{ ?>0<?php }?>">
                        <div style='font:bold 14px "宋体";margin:10px 0px;color:red;'>
                            评论：
                        </div>
                        <div id="name" style='width:100%;overflow:hidden;'>
                            <textarea cols="100%" rows="4" class="xheditor-simple {upImgUrl:'__URL__/doupload',upImgExt:'jpg,jpeg,gif,png',html5Upload:false}" name="content"></textarea>
                            <button type="submit" style='width:60px;height:30px;float:right;'> G O</button>
                        </div>
                    </form>

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
        //查看回复
        $('.ckhf').click(function(){
            if($(this).next().next().css('display')=='none'){
                $(this).next().next().slideDown("slow");
                $(this).css('background','#eee');
            }else{
                $(this).next().next().slideUp("normal");
                $(this).css('background','#fff');
            }
        });
        //添加回复
        $(".button").click(function(){
            var $content=$(this).parent('.replay').find('.text').val();
            if(!$content.trim()){
                die;
            }
            var $pid=$(this).parent('.replay').find('.pid').val();
            var div=$(this).parent('.replay');
            $.ajax({
                url:"__APP__/Message/comm",     //请求地址
                type:"post",                    //发送方式
                data:{content:$content,mid:'<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
',pid:$pid,status:<?php if ($_SESSION['user']['id']==$_smarty_tpl->tpl_vars['list']->value['uid']){?>1<?php }else{ ?>0<?php }?>},        //发送的数据
                dataType:"json",                //响应数据的方式
                async:true,
                success:function(data){
                    var str='';
                    str+='<div style="float:left;width:95%;margin:3px 15px 5px 15px;border-bottom:1px dashed #bbb;">';
                    str+="<img style='float:left;width:50px;height:50px;' src='__PUBLIC__/uploads/users/<?php if ($_SESSION['user']['picture']!=''&&$_SESSION['user']['picture']!='1.jpg'){?><?php echo $_SESSION['user']['username'];?>
/<?php echo $_SESSION['user']['picture'];?>
<?php }else{ ?>0/0.jpg<?php }?>'>";
                    str+="<div style='width:85%;float:right;font:normal 12px \"宋体\"'>";
                    str+="<a href='__APP__/Message/mine/uid/"+data['uid']+"'><b><?php if ($_SESSION['user']['name']){?><?php echo $_SESSION['user']['name'];?>
<?php }else{ ?><?php echo $_SESSION['user']['username'];?>
<?php }?>：</b></a>";
                    str+=data['content'];
                    str+="<br>";
                    str+="<span style='float:right'><a href='__APP__/Message/delcomm/cid/"+data['id']+"/id/<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
'>删除</a></span><br>";
                    str+="<span style='float:right'>"+data['addtime']+"</span>";
                    str+="</div></div>";
                    div.find('.rr').append(str);
                    div.find('.text').val('');
                    div.siblings('.ckhf').find('.hnum').text(parseInt(div.siblings('.ckhf').find('.hnum').text())+1);
                },
                error:function(){
                    alert("亲，请登录！");
                }
            })
        });
        //添加收藏
        $(".like").click(function(){
            var vv=$(this).attr('vv');
            var div=$(this);
            $.ajax({
                url:"__APP__/Message/like",     //请求地址
                type:"post",                    //发送方式
                data:{vv:vv,mid:'<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
'},        //发送的数据
                dataType:"json",                //响应数据的方式
                async:true,
                success:function(data){
                    $(".like").hide();
                    $(".nolike").show();
                },
                error:function(){
                    alert("亲，请登录！");
                }
            })
        });
        //取消收藏
        $(".nolike").click(function(){
            var vv=$(this).attr('vv');
            var div=$(this);
            $.ajax({
                url:"__APP__/Message/like",     //请求地址
                type:"post",                    //发送方式
                data:{vv:vv,mid:'<?php echo $_smarty_tpl->tpl_vars['list']->value['id'];?>
'},        //发送的数据
                dataType:"json",                //响应数据的方式
                async:true,
                success:function(data){
                    $(".nolike").hide();
                    $(".like").show();
                },
                error:function(){
                    alert("亲，请登录！");
                }
            })
        });
    });
</script>
<?php }} ?>