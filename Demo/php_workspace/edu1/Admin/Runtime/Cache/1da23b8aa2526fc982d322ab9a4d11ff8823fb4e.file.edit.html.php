<?php /* Smarty version Smarty-3.1.6, created on 2019-05-24 17:25:14
         compiled from "./Admin/Tpl\Test\edit.html" */ ?>
<?php /*%%SmartyHeaderCode:2507225195ce7b87a3f2be9-88527927%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1da23b8aa2526fc982d322ab9a4d11ff8823fb4e' => 
    array (
      0 => './Admin/Tpl\\Test\\edit.html',
      1 => 1392914970,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2507225195ce7b87a3f2be9-88527927',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
    'myOptions' => 0,
    'mySelect' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce7b87a419ce',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce7b87a419ce')) {function content_5ce7b87a419ce($_smarty_tpl) {?><?php if (!is_callable('smarty_function_html_options')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\function.html_options.php';
?>
<div class="pageContent">
	<form method="post" action="__URL__/update/navTabId/listtest/callbackType/closeCurrent"  class="pageForm required-validate" 
		onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
		<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"/>
        <div class="pageFormContent" layoutH="60">
            <dl>
                <dt>试卷类型:</dt>
                <dd><?php echo smarty_function_html_options(array('name'=>'tid','options'=>$_smarty_tpl->tpl_vars['myOptions']->value,'selected'=>$_smarty_tpl->tpl_vars['mySelect']->value),$_smarty_tpl);?>
</dd>
            </dl>
			<dl>
				<dt>试卷名：</dt>
				<dd><input type="text" class="required"  style="width:100%" name="title" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
"/></dd>
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