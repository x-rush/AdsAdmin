<?php /* Smarty version Smarty-3.1.6, created on 2019-05-12 23:10:17
         compiled from "./Admin/Tpl\Cat\index.html" */ ?>
<?php /*%%SmartyHeaderCode:7041851725cd83759b2fd62-08416813%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd7064a106058fb5b4a68cbe3af83faa3c0c13d62' => 
    array (
      0 => './Admin/Tpl\\Cat\\index.html',
      1 => 1392727788,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7041851725cd83759b2fd62-08416813',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'menu' => 0,
    'vo' => 0,
    'list' => 0,
    'numPerPage' => 0,
    'totalCount' => 0,
    'currentPage' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd83759b89b0',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd83759b89b0')) {function content_5cd83759b89b0($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ("Public/pagerForm.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>


<div class="pageHeader">
    <form rel="pagerForm" onsubmit="return navTabSearch(this);" method="post">
    
	<div class="searchBar">
		<table class="searchContent">
            <tr>
                <td style='font:bold 14px "宋体";'>资源分类</td>
                <td style='font:bold 14px "宋体";'>>　<a href="__APP__/Cat/index" target="navTab" rel="listcat" title="一级分类">一级分类</a></td>
                <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['menu']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                    <td style='font:bold 14px "宋体";'>>　<a href="__APP__/Cat/index/cid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" target="navTab" rel="listcat" title="<?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
</a></td>
                <?php } ?>
            </tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="__URL__/add/navTabId/listcat/id/{sid_user}" target="dialog"><span>添加</span></a></li>
            <li><a class="edit" href="__URL__/edit/id/{sid_user}/navTabId/listcat" target="dialog"><span>修改</span></a></li>
            <li class="line">line</li>
            <li><a class="icon" href="javascript:navTabPageBreak()"><span>刷新</span></a></li>
            <!--<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>-->
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th align="center" width="40" orderField="id" <?php if (!isset($_smarty_tpl->tpl_vars['smarty']) || !is_array($_smarty_tpl->tpl_vars['smarty']->value)) $_smarty_tpl->createLocalArrayVariable('smarty');
if ($_smarty_tpl->tpl_vars['smarty']->value['request']['_order'] = 'id'){?>class=<?php echo $_REQUEST['_sort'];?>
<?php }?>>ID号</th>
                <th align="center" width="60">分类名称</th>
                <th align="center" width="60">上级分类</th>
                <th align="center" width="40">路径</th>
                <th align="center" width="40">状态</th>
                <th align="center" width="50">操作</th>
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
                <td><a href="__APP__/Cat/index/cid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" target="navTab" rel="listcat" title="<?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
</a></td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['pid'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['path'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['status'];?>
</td>
                <td><a class="add" href="__URL__/add/navTabId/listcat/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" target="dialog">添加子分类</a></td>
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