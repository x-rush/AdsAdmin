<?php /* Smarty version Smarty-3.1.6, created on 2019-05-12 23:09:18
         compiled from "./Admin/Tpl\Index\index.html" */ ?>
<?php /*%%SmartyHeaderCode:14694370685cd8371e44c8e0-81272917%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '46433abaf19f4a45af2d886fe791fa1fa6390c68' => 
    array (
      0 => './Admin/Tpl\\Index\\index.html',
      1 => 1414748726,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14694370685cd8371e44c8e0-81272917',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'addtime' => 0,
    'adduser' => 0,
    'loginnum' => 0,
    'notvideo' => 0,
    'notlib' => 0,
    'logintime' => 0,
    'clicknum' => 0,
    'timecha' => 0,
    'clicktime' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8371e4b9f0',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8371e4b9f0')) {function content_5cd8371e4b9f0($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>教学网站后台管理系统</title>

<link href="__PUBLIC__/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="__PUBLIC__/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="__PUBLIC__/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="__PUBLIC__/dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>

<link href="__PUBLIC__/after/css/css.css" rel="stylesheet" type="text/css"/>
<link href="__PUBLIC__/after/css/main.css" rel="stylesheet" type="text/css"/>
<!--[if IE]>
<link href="__PUBLIC__/dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<script src="__PUBLIC__/dwz/js/speedup.js" type="text/javascript"></script>
<script src="__PUBLIC__/dwz/js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="__PUBLIC__/dwz/js/jquery.cookie.js" type="text/javascript"></script>
<script src="__PUBLIC__/dwz/js/jquery.validate.js" type="text/javascript"></script>
<script src="__PUBLIC__/dwz/js/jquery.bgiframe.js" type="text/javascript"></script>

<script src="__PUBLIC__/dwz/xheditor/xheditor-1.1.12-zh-cn.min.js" type="text/javascript"></script>
<script src="__PUBLIC__/dwz/uploadify/scripts/swfobject.js" type="text/javascript"></script>
<script src="__PUBLIC__/dwz/uploadify/scripts/jquery.uploadify.v2.1.0.js" type="text/javascript"></script>


<script src="__PUBLIC__/dwz/js/dwz.min.js" type="text/javascript"></script>
<script src="__PUBLIC__/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("__PUBLIC__/dwz/dwz.frag.xml", {
		//loginUrl:"login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
		//loginUrl:"login.html",	// 跳到登录页面
		statusCode:{ ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{ pageNum:"pageNum", numPerPage:"numPerPage", orderField:"_order", orderDirection:"_sort"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({ themeBase:"__PUBLIC__/dwz/themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});



</script>
<style type="text/css">
    #webtable tr{height:35px}
    
</style>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="#">标志</a>
				<ul class="nav">
					<li><a href="#" target="_blank">欢迎您：<?php echo $_SESSION['adminuser']['username'];?>
</a></li>
					<li><a href="__APP__/Public/password" target="dialog">修改密码</a></li>
					<li><a href="__APP__/Public/logout">退出</a></li>
				</ul>
				
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
				
					
					
					
					
				
					<div class="accordionHeader">
						<h2><span>Folder</span>用户信息管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="__APP__/Users/index" target="navTab" rel="listlib" title="用户信息" >浏览用户信息</a></li>
							<li><a href="__APP__/Users/add" target="dialog" width="500" height="500">添加用户信息</a></li>
						</ul>
                    </div>




                    <div class="accordionHeader">
						<h2><span>Folder</span>权限管理</h2>
					</div>
					<div class="accordionContent">
                        <ul class="tree treeFolder">
							<li><a>用户权限管理</a>
								<ul>
									<li><a href="__APP__/Limit/index" target="navTab" rel="listlib" title="权限信息" >浏览用户权限</a></li>
								</ul>
							</li>
							
							<li><a>角色管理</a>
								<ul>
                                    <li><a href="__APP__/Roles/index" target="navTab" rel="listrole" title="角色信息" >浏览角色信息</a></li>
									<li><a href="__APP__/Roles/add" target="dialog" width="600" height="300">添加角色信息</a></li>
								</ul>
                            </li>

                            <li><a>节点管理</a>
								<ul>
									<li><a href="__APP__/Node/index" target="navTab" rel="listnode" title="节点信息" >浏览节点信息</a></li>
									<li><a href="__APP__/Node/add" target="dialog" width="600" height="300">添加节点信息</a></li>
								</ul>
							</li>
						</ul>
                    </div>




                    <div class="accordionHeader">
						<h2><span>Folder</span>教学资源管理</h2>
					</div>
					<div class="accordionContent">
                        <ul class="tree treeFolder">
							<li><a>文库资源管理</a>
								<ul>
									<li><a href="__APP__/Library/index" target="navTab" rel="listlib" title="资源信息" >浏览文库资源</a></li>
								</ul>
							</li>
							
							<li><a>视频资源管理</a>
								<ul>
                                    <li><a href="__APP__/Video/index" target="navTab" rel="listvideo" title="视频信息" >浏览视频资源</a></li>
                                    <li><a href="__APP__/Note/index" target="navTab" rel="listnote" title="视频笔记" >浏览视频手记</a></li>
								</ul>
                            </li>

                            <li><a>资源评论管理</a>
								<ul>
                                    <li><a href="__APP__/Videocom/index" target="navTab" rel="listvideocom" title="视频评论" >浏览视频评论</a></li>
                                    <li><a href="__APP__/Libcom/index" target="navTab" rel="listlibcom" title="文库评论" >浏览文库评论</a></li>
                                    <li><a href="__APP__/Notecom/index" target="navTab" rel="listnotecom" title="手记评论" >浏览手记评论</a></li>
                                    
								</ul>
							</li>
						</ul>
                    </div>





                    <div class="accordionHeader">
						<h2><span>Folder</span>资源分类管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
                            <li><a href="__APP__/Cat/index" target="navTab" rel="listcat" title="分类信息" >浏览分类列表</a></li>
                            <li><a href="__APP__/Cat/add" target="dialog" width="600" height="300">添加分类</a></li>
						</ul>
                    </div>

                    <div class="accordionHeader">
						<h2><span>Folder</span>试卷类型管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
                            <li><a href="__APP__/Test/index" target="navTab" rel="listtest" title="试题信息" >浏览试卷列表</a></li>
                            <li><a href="__APP__/Test/add" target="dialog" width="600" height="300">添加试卷资源</a></li>
						</ul>
                    </div>
                    <div class="accordionHeader">
						<h2><span>Folder</span>贴吧信息管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="__APP__/Message/index" target="navTab" rel="listmessage" title="帖子信息" >浏览帖子信息</a></li>
                            <li><a href="__APP__/Comm/index" target="navTab" rel="listcomm" title="帖子评论信息">浏览帖子评论</a></li>
						</ul>
					</div>
					
                    <div class="accordionHeader">
						<h2><span>Folder</span>提问信息管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="__APP__/Question/index" target="navTab" rel="listquestion" title="提问信息" >浏览问题信息</a></li>
						</ul>
                    </div>
					
					
					
                    <div class="accordionHeader">
						<h2><span>Folder</span>网站公告管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
                            <li><a href="__APP__/Notice/index" target="navTab" rel="listnotice" title="公告信息" >浏览公告列表</a></li>
                            <li><a href="__APP__/Notice/add" target="dialog" width="700" height="500">添加公告信息</a></li>
						</ul>
                    </div>

                    <div class="accordionHeader">
						<h2><span>Folder</span>友情链接管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
                            <li><a href="__APP__/Flink/index" target="navTab" rel="listflink" title="友情链接" >友情链接管理</a></li>
                            <li><a href="__APP__/Flink/add" target="dialog" width="600" height="300">添加友情链接</a></li>
						</ul>
                    </div>

				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						
                        <div class="pageFormContent" layoutH="80" style="margin-right:230px;width:100%">
						<table cellSpacing=0 cellPadding=0 style="width:100%" align=center border=0>
    <td bgColor=#b1ceef height=1></td></tr>
  <tr height=20>
    <td background="__PUBLIC__/after/images/shadow_bg.jpg"></td></tr></table>
<table cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
  <tr height=100>
    <td align=middle width=100><IMG height=100 src="__PUBLIC__/after/images/admin_p.gif" 
      width=90></td>
    <td width=60>&nbsp;</td>
    <td>
      <table height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <tr>
            <td>  	
                <p>当前时间： <?php echo smarty_modifier_date_format(time(),'%Y-%m-%d %H:%M:%S');?>
</p>	
            </td>
        </tr>
        <tr>
          <td>欢迎进入教育网管理中心！</td></tr></table></td></tr>
        <tr>
    <td colSpan=3 height=10></td></tr></table>
<table cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <tr height=20>
    <td></td></tr>
  <tr height=22>
    <td style="margin-left:20px;padding-left:30px;font-weight:bold;color:#ffffff;" align=middle background="__PUBLIC__/after/images/login-top-bg.gif">信息统计一览</td></tr>
  <tr bgColor=#ecf4fc height=12>
    <td></td></tr>
  <tr height=20>
    <td></td></tr></table>
                   
<table id="webtable" cellSpacing=0 cellPadding=2 width="95%" align=center border=0>
<tr>
    <td align='right' width=100>登陆帐号：</td>
    <td style="COLOR: #880000"><?php echo $_SESSION['adminuser']['username'];?>
</td>
    <td align='center' colspan=2>数据统计</td>
</tr>
  
  <tr>
    <td align='right'>注册时间：</td>
    <td style="COLOR: #880000"><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['addtime']->value,"%Y-%m-%d %H:%M:%S");?>
</td>
    <td align='right' width='30%'>新增会员数：</td>
    
    <td align='left' width='30%'>&nbsp;&nbsp;&nbsp;<a href="__APP__/Users/index" target="navTab" rel="listlib" title="用户信息"><?php echo $_smarty_tpl->tpl_vars['adduser']->value;?>
</a></td>
</tr>
  <tr>
    <td align='right'>登陆次数：</td>
    <td style="COLOR: #880000"><?php echo $_smarty_tpl->tpl_vars['loginnum']->value;?>
</td>
    <td align='right' width='30%'>未审核视频数：</td>
    
    <td align='left' width='30%'>&nbsp;&nbsp;&nbsp;<a href="__APP__/Video/index/status/1" target="navTab" rel="listvideo" title="视频信息" ><?php echo $_smarty_tpl->tpl_vars['notvideo']->value;?>
</a></td>
</tr>
  <tr>
      <td align='right'>上线时间：</td>
    <td style="COLOR: #880000"><?php echo smarty_modifier_date_format($_SESSION['adminuser']['logintime'],'%Y-%m-%d %H:%M:%S');?>
</td>
    <td align='right' width='30%'>未审核文档数：</td>
    
    <td align='left' width='30%'>&nbsp;&nbsp;&nbsp;<a href="__APP__/Library/index/status/1" target="navTab" rel="listlib" title="资源信息"><?php echo $_smarty_tpl->tpl_vars['notlib']->value;?>
</a></td>
</tr>
  <tr>
    <td align='right'>上次登录时间：</td>
    <td style="COLOR: #880000"><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['logintime']->value,"%Y-%m-%d %H:%M:%S");?>
</td>
    <td align='right' width='30%'>网站总访问量：</td>
    
    <td align='left' width='30%' style="COLOR: #880000">　<?php echo $_smarty_tpl->tpl_vars['clicknum']->value;?>
</td>
</tr>
  <tr>
    <td align='right'>身份过期：</td>
    <td style="COLOR: #880000"><?php echo $_smarty_tpl->tpl_vars['timecha']->value;?>
</td>
    <td align='right' width='30%'>最近一次访问时间：</td>
    
    <td align='left' width='30%' style="color:blue">　<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['clicktime']->value,'%Y-%m-%d %H:%M:%S');?>
</td>
</tr>
  
    </table>
                        </div>
					</div>
					
					
				</div>
			</div>
		</div>

	</div>

	<div id="footer">Copyright &copy; 2014 <a href="" target="dialog"></a><!-- Tel：--></div>
</body>
</html>
<?php }} ?>