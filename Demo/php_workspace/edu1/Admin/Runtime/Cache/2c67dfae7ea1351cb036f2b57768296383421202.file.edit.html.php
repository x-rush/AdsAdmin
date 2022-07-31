<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:00:53
         compiled from "./Admin/Tpl\Cat\edit.html" */ ?>
<?php /*%%SmartyHeaderCode:17998475835cd8dde50c2994-98454202%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2c67dfae7ea1351cb036f2b57768296383421202' => 
    array (
      0 => './Admin/Tpl\\Cat\\edit.html',
      1 => 1392654828,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17998475835cd8dde50c2994-98454202',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dde51476b',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dde51476b')) {function content_5cd8dde51476b($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/update/navTabId/listcat/callbackType/closeCurrent" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
        <input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
">
		<div class="pageFormContent" layoutH="60">
			<dl>
				<dt>原名：</dt>
                <dd><input type='text' value='<?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
' disabled></dd>
            </dl>
            <dl>
				<dt>新名：</dt>
				<dd><input type="text" style="width:100%" name="name"/></dd>
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