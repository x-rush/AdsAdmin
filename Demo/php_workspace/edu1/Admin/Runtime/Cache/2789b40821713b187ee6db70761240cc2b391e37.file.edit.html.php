<?php /* Smarty version Smarty-3.1.6, created on 2019-05-24 17:24:32
         compiled from "./Admin/Tpl\Library\edit.html" */ ?>
<?php /*%%SmartyHeaderCode:13359799375ce7b850454286-30278718%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2789b40821713b187ee6db70761240cc2b391e37' => 
    array (
      0 => './Admin/Tpl\\Library\\edit.html',
      1 => 1391525954,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13359799375ce7b850454286-30278718',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce7b85047b38',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce7b85047b38')) {function content_5ce7b85047b38($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__URL__/update/navTabId/listlib/callbackType/closeCurrent" class="pageForm required-validate" 
        onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
        <input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
">
		<div class="pageFormContent" layoutH="60">
			<dl>
				<dt>文档名：</dt>
                <dd><input type="text" class="required"  style="width:100%" name="title" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
"/></dd>
            </dl>
            <dl>
				<dt>文档状态：</dt>
                <dd>
                    <select name="status" class="combox">
                        <option value="1" <?php if ($_smarty_tpl->tpl_vars['vo']->value['status']==1){?>selected<?php }?>>新添加</option>
                        <option value="2" <?php if ($_smarty_tpl->tpl_vars['vo']->value['status']==2){?>selected<?php }?>>在线</option>
                        <option value="3" <?php if ($_smarty_tpl->tpl_vars['vo']->value['status']==3){?>selected<?php }?>>下线</option>
                    </select>
                </dd>
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