<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 11:08:35
         compiled from "./Home/Tpl\Users\myheart.html" */ ?>
<?php /*%%SmartyHeaderCode:9850289815cd8dfb3023456-21753706%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '40da8be7df3bc322f6b9ac64dd1e56d756b5a8c6' => 
    array (
      0 => './Home/Tpl\\Users\\myheart.html',
      1 => 1393463458,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '9850289815cd8dfb3023456-21753706',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'mymes' => 0,
    'um' => 0,
    'videonum' => 0,
    'notenum' => 0,
    'libnum' => 0,
    'messnum' => 0,
    'mymes1' => 0,
    'vo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dfb308106',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dfb308106')) {function content_5cd8dfb308106($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><?php echo $_smarty_tpl->getSubTemplate ('../Public/head2.html', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

                       
<div id="sub-header" class="bq_h">
    <div class="container">
        <div class="navbar-header ">
            <h1><a href="__APP__/Index/index">E-Sch</a></h1>
        </div>
        <div class="col-md-6" style="width:80%;">
            <ul class="navbar-left">
                <li class="active"><a href="__APP__/Users/myheart">心情</a></li>
                <li><a href="__APP__/Users/myedu">我的E-Sch</a></li>
                <li><a href="__APP__/Users/settings">修改资料</a></li>
                <li><a href="__APP__/Users/photoalbum">我的相册</a></li>
                <li><a href="__APP__/Users/stranger">查看陌生人</a></li>
                <li><a href="__APP__/Test/myscore">我的考试</a></li>
            </ul>
        </div>
    </div>
</div>


        
<div id="main">
    <div class="container">
        <div class="home_module row">
            <div class="container">
                
                <div class="col-md-8">


                    
                    
                    <div class="mt30">
                        <div class="board clearfix">
                            <div class="tt tt_normal">
                                <h4><?php echo $_SESSION['user']['username'];?>
的心情</h4>
                                
                                
                            </div>
                            
                                <div class="form-item">
                                    <textarea id="message" class="form-control" rows="3" name="content" datatype="*1-500" nullmsg="还没写留言呢" errormsg="不能超过500个字"></textarea>
                                    <span class="Validform_checktip"></span>
                                </div>
                                
                            <div class="form-item tr">
                                    <button id="sub" class="btn btn-default">发布心情</button>
                            </div>
							
							<ul class="list_pb20 mt30 f12" id="liuyan">
							
							<?php  $_smarty_tpl->tpl_vars['um'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['um']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['mymes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['um']->key => $_smarty_tpl->tpl_vars['um']->value){
$_smarty_tpl->tpl_vars['um']->_loop = true;
?>
								<li>
                                    <div class="clearfix">
                                        <div class="pull-left">
											<a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['um']->value['vid'];?>
"><img class= "avatar_sm" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['um']->value['visitor'];?>
/<?php echo $_smarty_tpl->tpl_vars['um']->value['upic'];?>
"></a><br/>
                                        </div>
                                        <div class="t_ml_40">
                                            <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['um']->value['vid'];?>
"><?php echo $_smarty_tpl->tpl_vars['um']->value['myname'];?>
</a> : 
                                            <?php echo $_smarty_tpl->tpl_vars['um']->value['content'];?>

                                            <span class="c999 f12"><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['um']->value['addtime'],"%Y-%m-%d");?>
</span>
                                        </div>
                                    </div>
                                </li>
							<?php } ?>
                            </ul>
							
														
							
							
							
							
							
							
							<script>
								$(function(){
									$("#sub").click(function(){
										var mes=$("#message").val();
										var myid=<?php echo $_SESSION['user']['id'];?>
;
										var vid=<?php echo $_SESSION['user']['id'];?>
;
										var myname="<?php echo $_SESSION['user']['username'];?>
";
										var vname="<?php echo $_SESSION['user']['username'];?>
";
										$.ajax({
											data:{'message':mes,'myid':myid,'vid':vid,'myname':myname,'visitor':vname},
											url:'__APP__/Usermessage/addusermessage',
											dataType:'text',
											type:'post',
											success:function(res){
												if(res=='ok'){
													$("<li><div class='clearfix'><div class='pull-left'><a href='__APP__/Users/myedu'><img class='avatar_sm' src='__PUBLIC__/Uploads/users/<?php echo $_SESSION['user']['username'];?>
/<?php echo $_SESSION['user']['picture'];?>
'></a><br/></div><div class='t_ml_40'><a href='__APP__/Users/myedu'><?php echo $_SESSION['user']['username'];?>
</a> :" +mes+"<span class='c999 f12'> 刚刚</span></div></div></li>").appendTo('#liuyan');
													$("#message").val('');
												}
											},
										});
									});
								});
							
							
							</script>

                            
                            
                        </div>
                    </div>

                </div>

                
                <div class="col-md-4">
                    
                    
                    <div class="u_card">
                        <div class="u_card_name"><?php echo $_SESSION['user']['username'];?>
</div>
                        <div class="u_card_info">
                            <img src="__PUBLIC__/Uploads/users/<?php echo $_SESSION['user']['username'];?>
/<?php echo $_SESSION['user']['picture'];?>
" class="avatar_bg">

                            

                        </div>
                        <div class="u_card_intro">
                            
                            <p class="c666">一位php程序小菜鸟~</p>
                            <p><span>2014-02-06加入</span></p>
                        </div>
                        <div class="u_card_data">
                            <ul class="list_ib">
                                <li>
                                    <a href="__APP__/Video/index/uid/<?php echo $_SESSION['user']['id'];?>
">视频<span><?php echo $_smarty_tpl->tpl_vars['videonum']->value;?>
</span></a>
                                </li>
                                <li>
                                    <a href="__APP__/Note/index/uid/<?php echo $_SESSION['user']['id'];?>
">手记<span><?php echo $_smarty_tpl->tpl_vars['notenum']->value;?>
</span></a>
                                </li>
                                <li>
                                    <a href="__APP__/Library/index/uid/<?php echo $_SESSION['user']['id'];?>
">军火<span><?php echo $_smarty_tpl->tpl_vars['libnum']->value;?>
</span></a>
                                </li>
                                <li>
                                    <a href="__APP__/Message/mine">帖子<span><?php echo $_smarty_tpl->tpl_vars['messnum']->value;?>
</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    
                    <div class="mt30">
                        <div class="tt tt_normal">
                            <h4 class="pb10">今日心情</h4>
                            
                        </div>

                        <?php if ($_smarty_tpl->tpl_vars['mymes1']->value){?>
                        <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['mymes1']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
							<div class="null" style="color:green;">
                                <?php echo $_smarty_tpl->tpl_vars['vo']->value['content'];?>

                            </div>
                        <?php } ?>
                        <?php }else{ ?>
                            <div class="null">
                                还没有今日心情，去 <a href="__APP__/Users/myheart">发布</a> 吧
                            </div>
						 <?php }?>
                    </div>

                    
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ('../Public/foot2.html', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<?php }} ?>