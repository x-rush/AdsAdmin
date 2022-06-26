<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:01:09
         compiled from "./Admin/Tpl\Message\index.html" */ ?>
<?php /*%%SmartyHeaderCode:5706606165cd8ddf503a941-77969702%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd41b26d9f8479f15a77017d0a5c1f090a400739b' => 
    array (
      0 => './Admin/Tpl\\Message\\index.html',
      1 => 1392806206,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5706606165cd8ddf503a941-77969702',
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
  'unifunc' => 'content_5cd8ddf51099f',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8ddf51099f')) {function content_5cd8ddf51099f($_smarty_tpl) {?><?php if (!is_callable('smarty_function_html_options')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\function.html_options.php';
if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
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
                    <input type="text" name="username" size='10' value="<?php echo $_POST['username'];?>
" />
                </td>
                <td>
                    标题：
                    <input type="text" name="title" size='15' value="<?php echo $_POST['title'];?>
" />
                </td>
                <td>
                    标签：<?php echo smarty_function_html_options(array('name'=>'pid','options'=>$_smarty_tpl->tpl_vars['myOptions']->value,'selected'=>$_smarty_tpl->tpl_vars['mySelect']->value),$_smarty_tpl);?>

                </td>
                <td>
                    <input style='float:left' type="checkbox" name="isbest" value='1' <?php if ($_POST['isbest']=='1'){?>checked<?php }?>>
                    <div style='float:left;margin:4px -13px 0px 5px'>精品</div>
                </td>
                <td>
                    <input style='float:left' type="checkbox" name="ishot" value='1' <?php if ($_POST['ishot']=='1'){?>checked<?php }?>>
                    <div style='float:left;margin:4px -10px 0px 5px'>热门</div>
                </td>
                <td>
                    <select name='status' class="combox">
                        <option value='' <?php if ($_POST['status']==''){?>selected<?php }?> >-全部-</option>
                        <option value='1' <?php if ($_POST['status']=='1'){?>selected<?php }?> >显示</option>
                        <option value='0' <?php if ($_POST['status']=='0'){?>selected<?php }?> >隐藏</option>
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
			<li><a class="add" href="__URL__/add" target="dialog" width="600" height="420" title="发表帖子"><span>添加</span></a></li>
			<li><a class="delete" href="__URL__/delete/id/{item_id}/navTabId/listmessage" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
            <li><a class="edit" href="__URL__/edit/id/{item_id}"  width="450" height="300" target="dialog"><span>修改</span></a></li>
            <li><a class="edit" href="__APP__/Comm/index/mid/{item_id}" target="navTab" rel="listcomm" title="帖子评论信息"><span>查看帖子评论</span></a></li>
			<li class="line">line</li>
			<li><a class="icon"  href="javascript:navTabPageBreak()"><span>刷新</span></a></li>
			<!--<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>-->
		</ul>
	</div>
	<table class="table" width="100%" layoutH="112">
		<thead>
			<tr>
				<th width="40" orderField="id" <?php if (!isset($_smarty_tpl->tpl_vars['smarty']) || !is_array($_smarty_tpl->tpl_vars['smarty']->value)) $_smarty_tpl->createLocalArrayVariable('smarty');
if ($_smarty_tpl->tpl_vars['smarty']->value['request']['_order'] = 'id'){?>class=<?php echo $_REQUEST['_sort'];?>
<?php }?>>ID</th>
				<th width="150">用户名</th>
				<th width="150">标题</th>
				<th width="150">添加时间</th>
				<th width="150">标签</th>
				<th width="150">是否精品</th>
				<th width="150">是否热门</th>
                <th width="150" orderField="scan" <?php if ($_REQUEST['_order']=='scan'){?>class="<?php echo $_REQUEST['_sort'];?>
"<?php }?>>浏览次数</th>
                <th width="150">评论次数</th>
				<th width="150">状态</th>
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
                    <td><a href='__ROOT__/index.php/Message/show/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
' target='top'><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</a></td>
                    <td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</td>
					<td><?php echo $_smarty_tpl->tpl_vars['vo']->value['key'];?>
</td>
                    <td><?php if ($_smarty_tpl->tpl_vars['vo']->value['isbest']=='1'){?>是<?php }else{ ?>否<?php }?></td>
					<td><?php if ($_smarty_tpl->tpl_vars['vo']->value['ishot']=='1'){?>是<?php }else{ ?>否<?php }?></td>
                    <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['scan'];?>
</td>
                    <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['plnum'];?>
</td>
                    <td><?php if ($_smarty_tpl->tpl_vars['vo']->value['status']=='1'){?>显示<?php }else{ ?>隐藏<?php }?></td>
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