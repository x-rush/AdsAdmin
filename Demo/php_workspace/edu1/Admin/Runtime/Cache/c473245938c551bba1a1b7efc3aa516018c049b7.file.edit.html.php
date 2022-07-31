<?php /* Smarty version Smarty-3.1.6, created on 2019-05-24 17:25:22
         compiled from "./Admin/Tpl\Message\edit.html" */ ?>
<?php /*%%SmartyHeaderCode:1976430335ce7b882ca55a2-47668710%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c473245938c551bba1a1b7efc3aa516018c049b7' => 
    array (
      0 => './Admin/Tpl\\Message\\edit.html',
      1 => 1392474684,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1976430335ce7b882ca55a2-47668710',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce7b882ccc6a',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce7b882ccc6a')) {function content_5ce7b882ccc6a($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/update/navTabId/listmessage/callbackType/closeCurrent"  class="pageForm required-validate" 
		onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
		<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"/>
		<div class="pageFormContent" layoutH="60">
			<dl>
				<dt>是否精品：</dt>
				<dd><input type="radio" name="isbest" value="1" <?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='1'){?>checked<?php }?>/>YES
					<input type="radio" name="isbest" value="0" <?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='0'){?>checked<?php }?>/>NO</dd>
			
			<dl>
				<dt>是否热门：</dt>
				<dd><input type="radio" name="ishot" value="1" <?php if ($_smarty_tpl->tpl_vars['vo']->value['ishot']=='1'){?>checked<?php }?>/>YES
					<input type="radio" name="ishot" value="0" <?php if ($_smarty_tpl->tpl_vars['vo']->value['ishot']=='0'){?>checked<?php }?>/>NO</dd>
			</dl>
			<dl>
				<dt>状态：</dt>
				<dd><input type="radio" name="status" value="1" <?php if ($_smarty_tpl->tpl_vars['vo']->value['status']=='1'){?>checked<?php }?>/>显示
					<input type="radio" name="status" value="0" <?php if ($_smarty_tpl->tpl_vars['vo']->value['status']=='0'){?>checked<?php }?>/>不显示</dd>
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