<?php /* Smarty version Smarty-3.1.6, created on 2019-05-24 17:25:36
         compiled from "./Admin/Tpl\Question\edit.html" */ ?>
<?php /*%%SmartyHeaderCode:13181217425ce7b890d6ca60-91365474%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '061086def223b2ae6523d8dfd9f34ab0bcee3be0' => 
    array (
      0 => './Admin/Tpl\\Question\\edit.html',
      1 => 1392257766,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13181217425ce7b890d6ca60-91365474',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce7b890d93b6',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce7b890d93b6')) {function content_5ce7b890d93b6($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/update/navTabId/listquestion/callbackType/closeCurrent"  class="pageForm required-validate" 
		onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
		<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"/>
		<input type="hidden" name="rtime" value="1"/>
		<div class="pageFormContent" layoutH="60">
			<dl style='height:130px'>
				<dt>问题：</dt>
                <dd><textarea class='editor' rows='5' cols='50' name="content" tools='simple' upImgUrl='__URL__/doupload' upImgExt='jpg,jpeg,gif,png'><?php echo $_smarty_tpl->tpl_vars['vo']->value['content'];?>
</textarea></dd>
            </dl>
			<dl style='height:130px'>
				<dt>回复：</dt>
				<dd><textarea class='editor' rows='5' cols='50' name="replay" tools='simple' upImgUrl='__URL__/doupload' upImgExt='jpg,jpeg,gif,png'><?php echo $_smarty_tpl->tpl_vars['vo']->value['replay'];?>
</textarea></dd>
            </dl>
            <dl>
				<dt>是否推荐：</dt>
				<dd><input type="radio" name="isbest" value="1" <?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='1'){?>checked<?php }?>/>YES
					<input type="radio" name="isbest" value="0" <?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='0'){?>checked<?php }?>/>NO</dd>
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