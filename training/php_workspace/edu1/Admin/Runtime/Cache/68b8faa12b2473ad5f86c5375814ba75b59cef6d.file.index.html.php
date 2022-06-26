<?php /* Smarty version Smarty-3.1.6, created on 2019-05-12 23:10:00
         compiled from "./Admin/Tpl\Library\index.html" */ ?>
<?php /*%%SmartyHeaderCode:20902893785cd83748e5c7e1-70251589%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '68b8faa12b2473ad5f86c5375814ba75b59cef6d' => 
    array (
      0 => './Admin/Tpl\\Library\\index.html',
      1 => 1392730526,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20902893785cd83748e5c7e1-70251589',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'myOptions' => 0,
    'mySelect' => 0,
    'list' => 0,
    'vo' => 0,
    'numPerPage' => 0,
    'totalCount' => 0,
    'currentPage' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd83748ec5f7',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd83748ec5f7')) {function content_5cd83748ec5f7($_smarty_tpl) {?><?php if (!is_callable('smarty_function_html_options')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\function.html_options.php';
if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><?php echo $_smarty_tpl->getSubTemplate ("Public/pagerForm.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>


<div class="pageHeader">
    <form rel="pagerForm" onsubmit="return navTabSearch(this);" method="post">
    
	<div class="searchBar">
		<table class="searchContent">
            <tr>
                <td>搜索：</td>
                <td>
                    文库类别：<?php echo smarty_function_html_options(array('name'=>'pid','options'=>$_smarty_tpl->tpl_vars['myOptions']->value,'selected'=>$_smarty_tpl->tpl_vars['mySelect']->value),$_smarty_tpl);?>

                </td>
                <td>
                    文档名：<input type="text" name="title" size="8" value="<?php echo $_POST['title'];?>
"/>
                </td>
                <td>
                    上传者：<input type="text" name="username" size="8" value="<?php echo $_POST['username'];?>
"/>
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
			<li><a class="add" href="__URL__/add/navTabId/listlib" target="dialog"><span>添加</span></a></li>
			<li><a class="delete" href="__URL__/delete/id/{sid_user}/navTabId/listlib" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
            <li><a class="edit" href="__URL__/edit/id/{sid_user}/navTabId/listlib" target="dialog"><span>修改</span></a></li>
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
                <th align="center" width="40">类型</th>
                <th align="center" width="40">上传用户</th>
                <th align="center" width="40">文档名</th>
                <th align="center" width="40">文件大小</th>
                <th align="center" width="40">文件类型</th>
                <th align="center" width="40">被顶次数</th>
                <th align="center" width="40">浏览次数</th>
                <th align="center" width="40">下载次数</th>
                <th align="center" width="40">添加时间</th>
                <th align="center" width="40">文档状态</th>
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
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['typename'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</td>
                <td><a target="_blank" href="__ROOT__/Library/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</a></td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['size'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['type'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['favonum'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['clicknum'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['vo']->value['dwloadnum'];?>
</td>
                <td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</td>
                <td>
                    <?php if ($_smarty_tpl->tpl_vars['vo']->value['status']==1){?>新添加<?php }elseif($_smarty_tpl->tpl_vars['vo']->value['status']==2){?>在线<?php }else{ ?>下线<?php }?>
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