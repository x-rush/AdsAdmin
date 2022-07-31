<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:08:25
         compiled from "./Home/Tpl\Users\stranger.html" */ ?>
<?php /*%%SmartyHeaderCode:15825504705cd8dfa9da3713-14805465%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c7c8fbfec329dc055199e4bd4238afce24bcf1c4' => 
    array (
      0 => './Home/Tpl\\Users\\stranger.html',
      1 => 1393439744,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15825504705cd8dfa9da3713-14805465',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'list' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dfa9ebcb5',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dfa9ebcb5')) {function content_5cd8dfa9ebcb5($_smarty_tpl) {?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心___浏览陌生人</title>

<style type="text/css">
*{padding:0; margin:0;}
ul,li{list-style:none;}
body{font:12px/20px "Microsoft Yahei","SimSun",Arial,sans-serif; background:#CCC;}

/* heartPic */
.heartPic{width:749px;height:630px;margin:60px auto 0 auto;}
.heartPic ul{float:left;width:749px;}
.heartPic ul li{float:left;width:100px;height:100px;padding:2px;cursor:pointer;}
.heartPic ul li.on{z-index:99;}
.heartPic ul li.on .in{position:relative;left:-50px;top:-50px;padding:5px 5px 20px 5px;background:#666;}
.heartPic ul li .pTxt{display:none;width:100px;height:15px;text-align:center;color:#fff;overflow:hidden;}
.heartPic .showDiv{display:block;}
</style>
 
</head>

<body>

<div>
	<a href="" style="color:green;font-size:20px;margin-top:20px;margin-left:20px;">换一批</a>
	<a href="javascript:window.history.back()" style="color:green;font-size:20px;margin-top:20px;margin-left:20px;">返回</a>
</div>
<div class="heartPic">
	<ul>
		<li></li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[0][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[0][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[0][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[0][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[0][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[0][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[1][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[1][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[1][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[1][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[1][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[1][0]['username'];?>
</p></a>
            </div>
        </li>
		<li></li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[2][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[2][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[2][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[2][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[2][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[2][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[3][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[3][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[3][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[3][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[3][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[3][0]['username'];?>
</p></a>
            </div>
        </li>
		<li></li>
	</ul>
	<ul>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[4][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[4][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[4][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[4][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[4][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[4][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
			<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[5][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[5][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[5][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[5][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[5][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[5][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[6][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[6][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[6][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[6][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[6][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[6][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[7][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[7][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[7][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[7][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[7][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[7][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[8][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[8][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[8][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[8][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[8][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[8][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[9][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[9][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[9][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[9][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[9][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[9][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[10][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[10][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[10][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[10][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[10][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[10][0]['username'];?>
</p></a>
            </div>
        </li>
	</ul>
	<ul>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[11][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[11][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[11][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[11][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[11][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[11][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[12][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[12][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[12][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[12][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[12][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[12][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[13][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[13][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[13][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[13][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[13][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[13][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[14][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[14][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[14][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[14][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[14][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[14][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[15][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[15][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[15][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[15][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[15][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[15][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[16][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[16][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[16][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[16][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[16][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[16][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[17][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[17][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[17][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[17][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[17][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[17][0]['username'];?>
</p></a>
            </div>
        </li>
	</ul>
	<ul>
		<li></li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[18][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[18][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[18][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[18][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[18][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[18][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[19][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[19][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[19][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[19][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[19][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[19][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[20][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[20][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[20][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[20][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[20][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[20][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[21][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[21][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[21][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[21][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[21][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[21][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[22][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[22][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[22][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[22][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[22][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[22][0]['username'];?>
</p></a>
            </div>
        </li>
		<li></li>
	</ul>
	<ul>
		<li></li>
		<li></li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[23][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[23][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[23][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[23][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[23][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[23][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[24][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[24][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[24][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[24][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[24][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[24][0]['username'];?>
</p></a>
            </div>
        </li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[25][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[25][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[25][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[25][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[25][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[25][0]['username'];?>
</p></a>
            </div>
        </li>
		<li></li>
		<li></li>
	</ul>
	<ul>
		<li></li>
		<li></li>
		<li></li>
		<li>
        	<div class="in">
            	<a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[26][0]["id"];?>
'><img width="100" height="100" <?php if ($_smarty_tpl->tpl_vars['list']->value[26][0]['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/1.jpg"<?php }else{ ?>src="__PUBLIC__/uploads/users/<?php echo $_smarty_tpl->tpl_vars['list']->value[26][0]['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['list']->value[26][0]['picture'];?>
"<?php }?> /></a>
                <a href='__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['list']->value[26][0]["id"];?>
'><p class="pTxt"><?php echo $_smarty_tpl->tpl_vars['list']->value[26][0]['username'];?>
</p></a>
            </div>
        </li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>

<script type="text/javascript" src="__PUBLIC__/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".heartPic li").hover(function(){
		$(this).addClass("on");
		$(this).find("img").animate({"width":"200px","height":"200px"});
		$(this).find("div").animate({"width":"200px","height":"200px"});
		$(this).find(".pTxt").animate({"width":"200px","height":"20px"});
		$(this).find("p").addClass("showDiv");
	},function(){
		$(this).animate({height:"100px"},100).removeClass("on");
		$(this).find("img").stop(true,true).animate({"width":"100px","height":"100px"});
		$(this).find("div").stop(true,true).animate({"width":"100px","height":"100px"});
		$(this).find(".pTxt").stop(true,true).animate({"width":"0px","height":"0px"});
	});
})
</script>
<div style="text-align:center;clear:both">
</div>
</body>
</html>
<?php }} ?>