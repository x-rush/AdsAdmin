<?php /* Smarty version Smarty-3.1.6, created on 2019-05-24 17:25:27
         compiled from "./Admin/Tpl\Message\add.html" */ ?>
<?php /*%%SmartyHeaderCode:18687710365ce7b887ad8715-88059011%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e27001970d26d8122307b5d7369ed0e1c147f753' => 
    array (
      0 => './Admin/Tpl\\Message\\add.html',
      1 => 1392806206,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18687710365ce7b887ad8715-88059011',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'myOptions' => 0,
    'mySelect' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce7b887aff81',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce7b887aff81')) {function content_5ce7b887aff81($_smarty_tpl) {?><?php if (!is_callable('smarty_function_html_options')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\function.html_options.php';
?>
<div class="pageContent">
	<form method="post" action="__URL__/insert/navTabId/listmessage/callbackType/closeCurrent"  class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
		<div class="pageFormContent" layoutH="60">
			<dl>
				<dt>帖子标题：</dt>
				<dd><input type="text" class="required" style="width:100%" name="title"/></dd>
            </dl>
            <dl>
				<dt>标签（逗号分隔）：</dt>
				<dd><?php echo smarty_function_html_options(array('name'=>'keyword','options'=>$_smarty_tpl->tpl_vars['myOptions']->value,'selected'=>$_smarty_tpl->tpl_vars['mySelect']->value),$_smarty_tpl);?>
</dd>
			</dl>
            <dl>
                <dt> 　</dt>
                <dd>
                    <input type="checkbox" value='1' name="isbest"/>精品　
                    <input type="checkbox" value='1' name="ishot"/>热门
                </dd>
			</dl>
			<dl>
				<dt>内容：</dt>
				<dd>
					<textarea class='editor' class="required" cols="50" rows="10" name="content" tools='simple' upImgUrl='__URL__/doupload' upImgExt='jpg,jpeg,gif,png'></textarea>
				</dd>
			</dl>
		</div>
		
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">发布</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>

<?php }} ?>