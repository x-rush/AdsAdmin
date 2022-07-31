<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:01:51
         compiled from "./Admin/Tpl\Limit\edit.html" */ ?>
<?php /*%%SmartyHeaderCode:14240614735cd8de1fd81304-48034257%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9f46e8e26f459d6638029bf65be73676f283178d' => 
    array (
      0 => './Admin/Tpl\\Limit\\edit.html',
      1 => 1393405586,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14240614735cd8de1fd81304-48034257',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'uid' => 0,
    'uname' => 0,
    'role' => 0,
    'v' => 0,
    'userrole' => 0,
    'v1' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8de1fe7f1b',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8de1fe7f1b')) {function content_5cd8de1fe7f1b($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/update/navTabId/listusers/callbackType/closeCurrent/id/<?php echo $_smarty_tpl->tpl_vars['uid']->value;?>
" enctype="multipart/form-data" class="pageForm required-validate"
        onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>


        <div class="pageFormContent" layoutH="60">
            <h3>当前用户:【<?php echo $_smarty_tpl->tpl_vars['uname']->value;?>
】的角色信息</h3><br/>
			<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['uid']->value;?>
">
			<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['role']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
?>
				<input type="checkbox" value="<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
" name="rid[]" <?php  $_smarty_tpl->tpl_vars['v1'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v1']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['userrole']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v1']->key => $_smarty_tpl->tpl_vars['v1']->value){
$_smarty_tpl->tpl_vars['v1']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['v1']->value['rid']==$_smarty_tpl->tpl_vars['v']->value['id']){?>checked<?php }?><?php } ?> value=""><?php echo $_smarty_tpl->tpl_vars['v']->value['roletype'];?>

			<?php } ?>
			
            
           
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