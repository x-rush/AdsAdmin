<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:06:21
         compiled from "./Admin/Tpl\Users\detail.html" */ ?>
<?php /*%%SmartyHeaderCode:6233309255cd8df2dbc6915-36895440%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'eba25a1e1ba5a8d08ca39ee0215b8b6849c8530f' => 
    array (
      0 => './Admin/Tpl\\Users\\detail.html',
      1 => 1393327896,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6233309255cd8df2dbc6915-36895440',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'list' => 0,
    'vo' => 0,
    'numPerPage' => 0,
    'totalCount' => 0,
    'currentPage' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8df2dc5333',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8df2dc5333')) {function content_5cd8df2dc5333($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><?php echo $_smarty_tpl->getSubTemplate ("Public/pagerForm.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>



<div class="pageContent">
	<table class="list" width="100%" layoutH="138">
		<thead>
			<tr>
				<th align="center" width="50" orderField="id" <?php if (!isset($_smarty_tpl->tpl_vars['smarty']) || !is_array($_smarty_tpl->tpl_vars['smarty']->value)) $_smarty_tpl->createLocalArrayVariable('smarty');
if ($_smarty_tpl->tpl_vars['smarty']->value['request']['_order'] = 'id'){?>class=<?php echo $_REQUEST['_sort'];?>
<?php }?>>ID号</th>
                <th width="150">用户名</th>
				<th width="60">头像</th>
                <th width="90">姓名</th>
                <th width="90">性别</th>
                <th width="90">年龄</th>
				<th width="90">邮箱</th>
				<th width="90">介绍</th>
				<th width="90">组名</th>
				<th width="90">积分</th>
				<th width="90">等级</th>
                <th width="150">添加时间</th>
                
			</tr>
		</thead>
        <tbody>
            <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
            <tr target="sid_user" rel="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
">
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</td>
                <td><img height='50' width='50' src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
"></td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
</td>
                <td>
                    <?php if ($_smarty_tpl->tpl_vars['vo']->value['sex']==1){?>男
                    <?php }elseif($_smarty_tpl->tpl_vars['vo']->value['sex']==2){?>女
                    <?php }else{ ?>未知
                    <?php }?>
                </td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['age'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['email'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['introduce'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['class'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['point'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['level'];?>
</td>
                <td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</td>
            </tr>
            <?php } ?>
			
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
                <option value="10" <?php if ($_smarty_tpl->tpl_vars['numPerPage']->value==10){?>selected<?php }?>>10</option>
                <option value="15" <?php if ($_smarty_tpl->tpl_vars['numPerPage']->value==15){?>selected<?php }?>>15</option>
                <option value="20" <?php if ($_smarty_tpl->tpl_vars['numPerPage']->value==20){?>selected<?php }?>>20</option>
                <option value="25" <?php if ($_smarty_tpl->tpl_vars['numPerPage']->value==25){?>selected<?php }?>>25</option>
                <option value="30" <?php if ($_smarty_tpl->tpl_vars['numPerPage']->value==30){?>selected<?php }?>>30</option>
			</select>
            <span>条，共<?php echo $_smarty_tpl->tpl_vars['totalCount']->value;?>
条</span>
		</div>
		
        <div class="pagination" targetType="navTab" totalCount="<?php echo $_smarty_tpl->tpl_vars['totalCount']->value;?>
" numPerPage="<?php echo $_smarty_tpl->tpl_vars['numPerPage']->value;?>
" pageNumShown="10" currentPage="<?php echo $_smarty_tpl->tpl_vars['currentPage']->value;?>
"></div>

	</div>
</div>
<?php }} ?>