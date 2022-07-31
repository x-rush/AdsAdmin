<?php /* Smarty version Smarty-3.1.6, created on 2019-05-24 17:24:35
         compiled from "./Admin/Tpl\Library\add.html" */ ?>
<?php /*%%SmartyHeaderCode:5055935365ce7b8532d1762-58951172%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b626a9e2858e2c42f8efa7ecf05bc10cd3c1049a' => 
    array (
      0 => './Admin/Tpl\\Library\\add.html',
      1 => 1391875450,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5055935365ce7b8532d1762-58951172',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce7b8532f886',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce7b8532f886')) {function content_5ce7b8532f886($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/insert/navTabId/listlib/callbackType/closeCurrent" enctype="multipart/form-data" class="pageForm required-validate" 
		onsubmit="return iframeCallback(this);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
		<div class="pageFormContent" layoutH="60">
			<dl>
				<dt>文档名：</dt>
				<dd><input type="text" class="required"  style="width:100%" name="title"/></dd>
            </dl>
            <dl>
				<dt>文档类别：</dt>
				<dd><input type="text" style="width:100%" name="tid"/></dd>
            </dl>
            <dl>
				<dt>选择文档：</dt>
				<dd><input type="file" style="width:100%" name="lib"/></dd>
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