<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:06:02
         compiled from "./Admin/Tpl\Users\edit.html" */ ?>
<?php /*%%SmartyHeaderCode:20947461585cd8df1a6e0353-01496327%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '813286553215f7acb05ba233f7b65fc0b58978cf' => 
    array (
      0 => './Admin/Tpl\\Users\\edit.html',
      1 => 1393557386,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20947461585cd8df1a6e0353-01496327',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8df1a895bb',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8df1a895bb')) {function content_5cd8df1a895bb($_smarty_tpl) {?>
<div class="pageContent">
	<form method="post" action="__APP__/Users/update/navTabId/listusers/callbackType/closeCurrent" enctype="multipart/form-data" class="pageForm required-validate"
        onsubmit="return validateCallback(this,dialogAjaxDone);"><<?php ?>?php  //窗体组件采用这个 iframeCallback(this, navTabAjaxDone); ?<?php ?>>
        <input type="hidden" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" name='id'>


        <div class="pageFormContent" layoutH="60">
			<dl>
				<dt>用户名:</dt>
                <dd><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</dd>
            </dl>
           
            <dl>
				<dt>姓名:</dt>
				<dd><input type="text"  style="width:100%" name="name" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
"/></dd>
            </dl>
            <dl>
				<dt>邮箱:</dt>
				<dd><input type="text" class="required eamil" style="width:100%" name="email" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['email'];?>
"/></dd>
            </dl>
            <dl>
                <dt>性别:</dt>
                <?php if ($_smarty_tpl->tpl_vars['vo']->value['sex']=='1'){?><dd>男<input type="radio" name="sex" value='1' checked/>
                    女<input type="radio" name="sex" value='2'/></dd>
                <?php }elseif($_smarty_tpl->tpl_vars['vo']->value['sex']==2){?><dd>男<input type="radio" name="sex" value='1'/>
                    女<input type="radio" name="sex" value='2' checked/></dd>
                <?php }else{ ?><dd>男<input type="radio" name="sex" value='1'/>
                    女<input type="radio" name="sex" value='2'/></dd>
                <?php }?>
                
            </dl>
            <dl>
				<dt>年龄:</dt>
				<dd><input type="text" class="digits" min="1" max='100' style="width:100%" name="age" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['age'];?>
"/></dd>
            </dl>
            
            <dl>
				<dt>分组:</dt>
				<dd><input type="text"  style="width:100%" name="class" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['class'];?>
"/></dd>
            </dl>
			<dl>
				<dt>介绍:</dt>
				<dd><input type="text"  style="width:100%" name="introduce" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['introduce'];?>
"/></dd>
            </dl>
            <dl>
				<dt>积分:</dt>
				<dd><input type="text" class="digits" style="width:100%" name="point" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['point'];?>
"/></dd>
            </dl>
            <dl>
				<dt>等级:</dt>
				<dd><input type="text" class="digits" min="1" max='100' style="width:100%" name="level" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['level'];?>
"/></dd>
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