<?php /* Smarty version Smarty-3.1.6, created on 2019-05-24 17:25:47
         compiled from "./Admin/Tpl\Notice\edit.html" */ ?>
<?php /*%%SmartyHeaderCode:11144436755ce7b89b71b851-68328614%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8f50cb8bf116cf4b4d2e313adc875f0aeb78204f' => 
    array (
      0 => './Admin/Tpl\\Notice\\edit.html',
      1 => 1392914970,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11144436755ce7b89b71b851-68328614',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce7b89b74295',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce7b89b74295')) {function content_5ce7b89b74295($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/update/navTabId/listnotice/callbackType/closeCurrent"  class="pageForm required-validate" 
		onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
		<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"/>
		<div class="pageFormContent" layoutH="60">
			<dl>
				<dt>标题：</dt>
				<dd><input type="text" class="required"  style="width:100%" name="title" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
"/></dd>
            </dl>
            <dl>
				<dt>添加者：</dt>
				<dd><input type="text" class="required"  style="width:100%" name="author" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['author'];?>
"/></dd>
			</dl>
        	<dl>
				<dt>内容：</dt>
                <dd><textarea class="editor" name="content" rows="16" cols="60" tools="simple"><?php echo $_smarty_tpl->tpl_vars['vo']->value['content'];?>
</textarea></dd>
            </dl>
            <dl></dl>
			
			
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