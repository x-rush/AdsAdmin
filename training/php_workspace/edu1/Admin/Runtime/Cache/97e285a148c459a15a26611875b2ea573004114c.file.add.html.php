<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 12:31:57
         compiled from "./Admin/Tpl\Users\add.html" */ ?>
<?php /*%%SmartyHeaderCode:2559956585cd8f33d09a9e9-55797974%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '97e285a148c459a15a26611875b2ea573004114c' => 
    array (
      0 => './Admin/Tpl\\Users\\add.html',
      1 => 1393420992,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2559956585cd8f33d09a9e9-55797974',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8f33d18cd2',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8f33d18cd2')) {function content_5cd8f33d18cd2($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/insert/navTabId/listusers/callbackType/closeCurrent" enctype="multipart/form-data" onsubmit="return iframeCallback(this, dialogAjaxDone);">
	<<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
        <div class="pageFormContent" layoutH="60">
			<dl>
				<dt>用户名:</dt>
				<dd><input type="text" class="required alphanumeric"  style="width:100%" name="username"/></dd>
            </dl>
            <dl>
				<dt>密码:</dt>
				<dd><input id="w_validation_pwd" type="password" class="required alphanumeric" minlength="6" maxlength="20"  style="width:100%" name="userpass"/></dd>
            </dl>
            <dl>
				<dt>确认密码:</dt>
				<dd><input type="password" class="required" equalto="#w_validation_pwd"  style="width:100%" name="repassword"/></dd>
            </dl>
            <dl>
				<dt>姓名:</dt>
				<dd><input type="text"  style="width:100%" name="name"/></dd>
            </dl>
            <dl>
				<dt>邮箱:</dt>
				<dd><input type="text"  style="width:100%" class="required eamil" name="email"/></dd>
            </dl>
            <dl>
                <dt>选择头像:</dt>
                <dd><input type='file' size="10" name="picture"></dd>
            </dl>
            <dl>
				<dt>性别:</dt>
                <dd>男<input type="radio" name="sex" value='1' checked/>
                    女<input type="radio" name="sex" value='2'/></dd>
                
            </dl>
            <dl>
				<dt>年龄:</dt>
				<dd><input type="text" class="digits" min="1" max='100' style="width:100%" name="age"/></dd>
            </dl>
            
            <dl>
				<dt>分组:</dt>
				<dd><input type="text"  style="width:100%" name="class"/></dd>
            </dl>
			<dl>
				<dt>介绍:</dt>
				<dd><input type="text"  style="width:100%" name="introduce"/></dd>
            </dl>
            <dl>
				<dt>积分:</dt>
				<dd><input type="text" class="digits" style="width:100%" name="point"/></dd>
            </dl>
            <dl>
				<dt>等级:</dt>
				<dd><input type="text" class="digits" min="1" max='100' style="width:100%" name="level"/></dd>
            </dl>
           
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
<?php }} ?>