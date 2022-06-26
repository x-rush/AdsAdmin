<?php /* Smarty version Smarty-3.1.6, created on 2019-05-12 23:09:29
         compiled from "./Admin/Tpl\Roles\add.html" */ ?>
<?php /*%%SmartyHeaderCode:12276726235cd837292d4161-50183689%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '139ddbf2af11f736282c99a4f48842dd2aaf2cc8' => 
    array (
      0 => './Admin/Tpl\\Roles\\add.html',
      1 => 1392745000,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12276726235cd837292d4161-50183689',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8372931a67',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8372931a67')) {function content_5cd8372931a67($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/insert/navTabId/listrole/callbackType/closeCurrent"  class="pageForm required-validate" 
		onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
		<div class="pageFormContent" layoutH="60">
			<dl>
				<dt>角色名：</dt>
				<dd><input type="text" class="required"  style="width:100%" name="roletype"/></dd>
			</dl>
			<dl>
				<dt>说明：</dt>
				<dd><input type="text"  style="width:100%" name="remark"/></dd>
			</dl>
			<dl>
				<dt>状态：</dt>
				<dd><input type="radio" name="status" value="1"/>启用
					<input type="radio" name="status" value="0"/>禁用
				</dd>
			</dl>
		</div>
		
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>

<?php }} ?>