<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 13:16:18
         compiled from "./Home/Tpl\Message\add.html" */ ?>
<?php /*%%SmartyHeaderCode:9219038255cd8fda25ac5a9-69809142%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'dc5cb2a66fb493274dea5885bd13e2bd9af58eee' => 
    array (
      0 => './Home/Tpl\\Message\\add.html',
      1 => 1393439746,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '9219038255cd8fda25ac5a9-69809142',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
    'ql' => 0,
    'kw' => 0,
    'vo' => 0,
    'cat' => 0,
    'ty' => 0,
    'person' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8fda2667dd',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8fda2667dd')) {function content_5cd8fda2667dd($_smarty_tpl) {?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
            <h1><a href="__APP__/Message/index">??????</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li><a href="__APP__/Message/index">????????????</a></li>
                <li><a href="__APP__/Message/hot">???????????????</a></li>
                <li><a href="__APP__/Message/add" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>?????????~</a></li>
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
                        <h3>??????</h3>
                    </div>
                    <form method="post" action="__APP__/Message/insert" class="pageForm required-validate" onsubmit="return iframeCallback(this)">
                        <p style='text-align:left;'>???????????????</p>
                        <p style='text-align:left;'><input id='title' type='text' name='title' size='50' style='width:500px;font:bold 20px "??????"' value='<?php echo preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['ql']->value['content']);?>
'></p>
                        <p id='ttitle' style='color:blue'></p>
                        <p style='text-align:left;'>???????????????????????????</p>
                        <div style='float:left;' class='hehe'>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['kw']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['vo']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
 $_smarty_tpl->tpl_vars['vo']->iteration++;
?>
                            <a href='javascript:void(0)'><div class="keyword" tt='<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
'><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
</div></a>
                        <?php } ?>
                        </div>
                     
                        <div style='text-align:left;float:left;width:100%;'>
                            <input type='hidden' value='<?php if ($_smarty_tpl->tpl_vars['ql']->value['keyword']!=''){?><?php echo $_smarty_tpl->tpl_vars['ql']->value['keyword'];?>
,<?php }?>' lala='<?php echo $_smarty_tpl->tpl_vars['ql']->value['cname'];?>
' name='keyword' id='hkw'>
                            <div id='kw' style='width:500px;border:2px inset #999;height:31px'>
                                
                            </div>
                        </div>
                        <p style='text-align:left;float:left'>?????????</p>
                        <textarea cols="100%" rows="15" class="xheditor-simple {upImgUrl:'__URL__/doupload',upImgExt:'jpg,jpeg,gif,png',html5Upload:false}" name="content"><?php if ($_smarty_tpl->tpl_vars['ql']->value['content']!=''){?><b>???????????????</b><?php echo $_smarty_tpl->tpl_vars['ql']->value['content'];?>
<br><br><b>?????????</b><?php echo $_smarty_tpl->tpl_vars['ql']->value['replay'];?>
<?php }?></textarea>
                        <input type="reset" name='res' value='??????' style='width:60px;height:30px;float:right;font:bold 16px "??????"'>
                        <?php if ($_smarty_tpl->tpl_vars['ql']->value['content']==''){?>
                        <input id='sub' type="submit" name='sub' disabled value='??????' style='margin-right:8px;width:60px;height:30px;float:right;font:bold 16px "??????"'>
                        <?php }else{ ?>
                        <input id='sub' type="submit" name='sub' value='??????' style='margin-right:8px;width:60px;height:30px;float:right;font:bold 16px "??????"'>
                        <?php }?>
                    </form>
                    
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
                                <li><a href="__APP__/Message/index2/pid/<?php echo $_smarty_tpl->tpl_vars['ty']->value['id'];?>
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

</body></html>
<script type="text/javascript">
    //?????????????????????????????????
    $(document).ready(function(){
        var str=$('#hkw').val().split(',');
        var name=$('#hkw').attr('lala').split(',');
        for(var i=0;i<str.length-1;i++){
            $("#kw").append('<a href="javascript:void(0)"><div onclick=doRemove(\'cc'+str[i]+'\') class="ckw" name="cc'+str[i]+'">'+name[i]+'</div></a>');
        }
    });
	//jquery?????????
	$(function(){
        $(".keyword").click(function(){
            if($('#hkw').val().indexOf($(this).attr('tt'))==-1 && $('.ckw').length<3){
                $("#kw").append('<a href="javascript:void(0)"><div onclick=doRemove(\'cc'+$(this).attr('tt')+'\') class="ckw" id="cc'+$(this).attr('tt')+'"name="cc'+$(this).attr('tt')+'">'+$(this).text()+'</div></a>');
                $('#hkw').val($('#hkw').val()+$(this).attr('tt')+',');
            }
        });
    });
    function doRemove(name){
        var aa=document.getElementById(name);
        var bb=document.getElementById('hkw');
        var cc=bb.value.split(',');
        var dd='';
        var ee=0;
        for(var i=0;i<cc.length-1;i++){
            if('cc'+cc[i]==name && ee!=1){
                ee=1;
                continue;
            }
            dd=dd+cc[i]+',';
        }
        aa.parentNode.removeChild(aa);
        bb.value=dd;
    }
    //????????????
    $(function(){
        $('#title').blur(function(){
            if($(this).val().length>15){
                $('#ttitle').text('??????????????????');
                $('#ttitle').css('color','red');
                $('#sub').attr('disabled','1');
            }else if($(this).val().length==0 || $(this).val().trim()==''){
                $('#ttitle').text('?????????????????????');
                $('#ttitle').css('color','red');
                $('#sub').attr('disabled','1');
            }else{
                $('#ttitle').text('???????????????');
                $('#ttitle').css('color','green');
                $('#sub').removeAttr('disabled');
            }
        }).focus(function(){
            $('#ttitle').text('??????????????????15????????????');
            $('#ttitle').css('color','blue');
        })
    })
</script>
<?php }} ?>