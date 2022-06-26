<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:01:20
         compiled from "./Admin/Tpl\Notice\add.html" */ ?>
<?php /*%%SmartyHeaderCode:15811389155cd8de003790e2-79898963%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1a5a0388ca09a26a7bcb228485544b8da8ac3dde' => 
    array (
      0 => './Admin/Tpl\\Notice\\add.html',
      1 => 1392165834,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15811389155cd8de003790e2-79898963',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8de003984e',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8de003984e')) {function content_5cd8de003984e($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/insert/navTabId/listnotice/callbackType/closeCurrent"  class="pageForm required-validate" 
		onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
		<div class="pageFormContent" layoutH="60">
			<dl>
				<dt>标题：</dt>
				<dd><input type="text" class="required"  style="width:100%" name="title"/></dd>
			</dl>
			<dl>
				<dt>内容：</dt>
				<dd>
					<textarea class="editor" cols="60" rows="6" tools="simple" name="content"></textarea>
				</dd>
			</dl>
			<dl></dl><dl></dl>
			<dl></dl><dl></dl>
			<dl></dl><dl></dl>
			<dl>
				<dt>添加者：</dt>
                <dd><input type="text" class="required" style="width:100%" name="author"/></dd>		
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