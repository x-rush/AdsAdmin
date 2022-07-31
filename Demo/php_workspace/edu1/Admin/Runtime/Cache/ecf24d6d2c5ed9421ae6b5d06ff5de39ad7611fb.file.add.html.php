<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:01:26
         compiled from "./Admin/Tpl\Flink\add.html" */ ?>
<?php /*%%SmartyHeaderCode:8339138505cd8de06e2c696-59482967%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ecf24d6d2c5ed9421ae6b5d06ff5de39ad7611fb' => 
    array (
      0 => './Admin/Tpl\\Flink\\add.html',
      1 => 1392263536,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8339138505cd8de06e2c696-59482967',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8de06e537a',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8de06e537a')) {function content_5cd8de06e537a($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/insert/navTabId/listflink/callbackType/closeCurrent"  class="pageForm required-validate" 
		onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
        <div class="pageFormContent" layoutH="60">
            <dl>
                <dt>友情链接</dt>
                <dd><input type="text" class="required" style="width:100%" name="webname"/></dd>
            </dl>
			<dl>
				<dt>url地址</dt>
				<dd><input type="text" class="required"  style="width:100%" name="url"/></dd>
            </dl>
            <dl>
				<dt>Email</dt>
				<dd><input type="text" class="required"  style="width:100%" name="email"/></dd>
            </dl>
            <dl>
				<dt>描述</dt>
				<dd><textarea class="required" cols="40" rows="4" name="descr"></textarea></dd>
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