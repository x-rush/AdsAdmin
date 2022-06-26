<?php /* Smarty version Smarty-3.1.6, created on 2019-05-24 17:24:47
         compiled from "./Admin/Tpl\Video\add.html" */ ?>
<?php /*%%SmartyHeaderCode:19551944665ce7b85f41d8f2-38735136%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9f9b44946f5106b19faf8d565815d0c721772d80' => 
    array (
      0 => './Admin/Tpl\\Video\\add.html',
      1 => 1391955376,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19551944665ce7b85f41d8f2-38735136',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce7b85f4449f',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce7b85f4449f')) {function content_5ce7b85f4449f($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/insert/navTabId/listvideo/callbackType/closeCurrent" enctype="multipart/form-data" class="pageForm required-validate" 
		onsubmit="return iframeCallback(this);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
		<div class="pageFormContent" layoutH="60">
			<dl>
				<dt>视频名：</dt>
				<dd><input type="text" class="required"  style="width:100%" name="videoname"/></dd>
            </dl>
            <dl>
				<dt>文档类别：</dt>
				<dd><input type="text" style="width:100%" name="tid"/></dd>
            </dl>
            <dl>
				<dt>视频图片：</dt>
				<dd><input type="file" style="width:100%" name="picname"/></dd>
            </dl>
            <dl>
				<dt>选择视频：</dt>
				<dd><input type="file" style="width:100%" name="video"/></dd>
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