<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:01:15
         compiled from "./Admin/Tpl\Question\index.html" */ ?>
<?php /*%%SmartyHeaderCode:4438423015cd8ddfb831b32-59077811%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a1b73bccc17fa5f267e56a2dea8ae1d2f7345e00' => 
    array (
      0 => './Admin/Tpl\\Question\\index.html',
      1 => 1393331718,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4438423015cd8ddfb831b32-59077811',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'numPerPage' => 0,
    'myOptions' => 0,
    'mySelect' => 0,
    'list' => 0,
    'vo' => 0,
    'totalCount' => 0,
    'currentPage' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8ddfb88b8c',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8ddfb88b8c')) {function content_5cd8ddfb88b8c($_smarty_tpl) {?><?php if (!is_callable('smarty_function_html_options')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\function.html_options.php';
?><?php echo $_smarty_tpl->getSubTemplate ("Public/pagerForm.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" method="post">
	<input type="hidden" name="numPerPage" value="<?php echo $_smarty_tpl->tpl_vars['numPerPage']->value;?>
" /><!--每页显示多少条-->
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
                    <b>搜索</b> &nbsp; 
                </td>
                <td>
                    用户名：
                    <input type="text" name="username" size='7' value="<?php echo $_POST['username'];?>
" />
                </td>
                <td>
                    教师名：
                    <input type="text" name="tname" size='7' value="<?php echo $_POST['tname'];?>
" />
                </td>
                <td>
                    问题：
                    <input type="text" name="content" size='13' value="<?php echo $_POST['content'];?>
" />
                </td>
                <td>
                    标签：<?php echo smarty_function_html_options(array('name'=>'pid','options'=>$_smarty_tpl->tpl_vars['myOptions']->value,'selected'=>$_smarty_tpl->tpl_vars['mySelect']->value),$_smarty_tpl);?>

                </td>
                <td>
                    <select name='ss' class="combox">
                        <option value='' <?php if ($_POST['ss']==''){?>selected<?php }?> >--全部--</option>
                        <option value='1' <?php if ($_POST['ss']=='1'){?>selected<?php }?> >已回复</option>
                        <option value='2' <?php if ($_POST['ss']=='2'){?>selected<?php }?> >未回复</option>
                    </select>
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
			<li><a class="delete" href="__URL__/delete/id/{item_id}/navTabId/listquestion" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="__URL__/edit/id/{item_id}"  width="620" height="450" target="dialog"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon"  href="javascript:navTabPageBreak()"><span>刷新</span></a></li>
			<!--<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>-->
		</ul>
	</div>
	<table class="table" width="100%" layoutH="112">
		<thead>
			<tr>
				<th width="40" orderField="id" <?php if ($_REQUEST['_order']=='id'){?>class="<?php echo $_REQUEST['_sort'];?>
"<?php }?>>ID</th>
				<th width="80">用户名</th>
				<th width="80">教师名</th>
                <th width="120">问题</th>
				<th width="100">标签</th>
                <th width="120">回复内容</th>
                <th width="50">推荐</th>
                <th width="50">状态</th>
                <th width="80">操作</th>
			</tr>
		</thead>
		<tbody>
			<?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
				<tr target="item_id" rel="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
">
					<td><?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
</td>
					<td><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</td>
                    <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['tname'];?>
</td>
					<td><?php echo preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['content']);?>
</td>
					<td><?php echo $_smarty_tpl->tpl_vars['vo']->value['key'];?>
</td>
                    <td><?php echo preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['vo']->value['replay']);?>
</td>
                    <td><?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='1'){?>是<?php }else{ ?>否<?php }?></td>
                    <td><?php if ($_smarty_tpl->tpl_vars['vo']->value['status']=='1'){?>显示<?php }else{ ?>隐藏<?php }?></td>
                    <td>
                        <a href='__ROOT__/index.php/Question/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
' target='top'>查看</a> / 
                        <a class="replay" href="__URL__/replay/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"  width="650" height="450" target="dialog">回复</a>
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
			<span>共<?php echo $_smarty_tpl->tpl_vars['totalCount']->value;?>
条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="<?php echo $_smarty_tpl->tpl_vars['totalCount']->value;?>
" numPerPage="<?php echo $_smarty_tpl->tpl_vars['numPerPage']->value;?>
" pageNumShown="10" currentPage="<?php echo $_smarty_tpl->tpl_vars['currentPage']->value;?>
"></div>
	</div>
</div>
<?php }} ?>