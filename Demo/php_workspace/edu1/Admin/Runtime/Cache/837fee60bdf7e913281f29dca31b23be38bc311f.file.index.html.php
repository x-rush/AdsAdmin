<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:01:30
         compiled from "./Admin/Tpl\Users\index.html" */ ?>
<?php /*%%SmartyHeaderCode:15869938445cd8de0a8fc0f5-06779795%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '837fee60bdf7e913281f29dca31b23be38bc311f' => 
    array (
      0 => './Admin/Tpl\\Users\\index.html',
      1 => 1393405586,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15869938445cd8de0a8fc0f5-06779795',
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
  'unifunc' => 'content_5cd8de0a96970',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8de0a96970')) {function content_5cd8de0a96970($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><?php echo $_smarty_tpl->getSubTemplate ("Public/pagerForm.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>


<div class="pageHeader">
    <form rel="pagerForm" onsubmit="return navTabSearch(this);" method="post">
    
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
                    <b>搜索</b> &nbsp; 
                </td>
                <td>
                    用户名：
                    <input type="text" name="username" size='15' value="<?php echo $_POST['username'];?>
" />
                </td>
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
             <li><a class="add" href="__URL__/detail/id/{sid_user}/navTabId/listusers" target="navTab" width="830" height="500" title="查看用户详情"><span>详情</span></a></li>
			<li><a class="delete" href="__URL__/delete/id/{sid_user}/navTabId/listusers" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
            <li><a class="edit" href="__URL__/edit/id/{sid_user}/navTabId/listusers" target="dialog" width="500" height="520"><span>修改</span></a></li>
           <li><a class="add" href="__URL__/add/navTabId/listusers" target="dialog" title="添加用户"><span>添加用户</span></a></li>
            <li class="line">line</li>
            <li><a class="icon" href="javascript:navTabPageBreak()"><span>刷新</span></a></li>
            <!--<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>-->
		</ul>
	</div>
	<table class="list" width="100%" layoutH="138">
		<thead>
			<tr>
                <th align="center" width="40" orderField="id" <?php if (!isset($_smarty_tpl->tpl_vars['smarty']) || !is_array($_smarty_tpl->tpl_vars['smarty']->value)) $_smarty_tpl->createLocalArrayVariable('smarty');
if ($_smarty_tpl->tpl_vars['smarty']->value['request']['_order'] = 'id'){?>class=<?php echo $_REQUEST['_sort'];?>
<?php }?>>ID号</th>
                <th width="70">头像</th>
                <th width="150">用户名</th>
                <th width="150">姓名</th>
				<th width="150">性别</th>
				<th width="150">年龄</th>
				<th width="150">邮箱</th>
				<th width="150">介绍</th>
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
" height="50">
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
</td>                
                <td height='70'><img height='50' width='50' src="__PUBLIC__/Uploads/users/<?php if ($_smarty_tpl->tpl_vars['vo']->value['picture']=='1.jpg'){?>0/1.jpg<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
<?php }?>"></td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</td>
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
                <td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d");?>
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