<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:02:38
         compiled from "./Admin/Tpl\Node\edit.html" */ ?>
<?php /*%%SmartyHeaderCode:17154693275cd8de4eb14249-99434028%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8bd8d72079cfa7207838fca660c2bc005984f935' => 
    array (
      0 => './Admin/Tpl\\Node\\edit.html',
      1 => 1392745000,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17154693275cd8de4eb14249-99434028',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8de4eb98f6',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8de4eb98f6')) {function content_5cd8de4eb98f6($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/update/navTabId/listnode/callbackType/closeCurrent"  class="pageForm required-validate" 
		onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
		<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"/>
		<div class="pageFormContent" layoutH="60">
			<dl>
				<dt>节点名称：</dt>
				<dd><input type="text" class="required"  style="width:100%" name="username" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
"/></dd>
			</dl>
			<dl>
				<dt>模块名：</dt>
				<dd><input type="text"  style="width:100%" name="mname" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['mname'];?>
"/></dd>
			</dl>
			<dl>
				<dt>动作名：</dt>
				<dd><input type="text"  style="width:100%" name="aname" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['aname'];?>
"/></dd>
			</dl>
			<dl>
				<dt>状态：</dt>
				<dd><input type="radio" name="status" value="1" <?php if ($_smarty_tpl->tpl_vars['vo']->value['status']==1){?>checked<?php }?> />启用
					<input type="radio" name="status" value="0" <?php if ($_smarty_tpl->tpl_vars['vo']->value['status']==0){?>checked<?php }?> />禁用
				</dd>
			</dl>
		</div>
		
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>

<?php }} ?>