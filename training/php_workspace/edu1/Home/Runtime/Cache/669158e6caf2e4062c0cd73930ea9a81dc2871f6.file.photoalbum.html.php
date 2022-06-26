<?php /* Smarty version Smarty-3.1.6, created on 2019-05-24 17:23:15
         compiled from "./Home/Tpl\Users\photoalbum.html" */ ?>
<?php /*%%SmartyHeaderCode:16093729945ce7b803d67b52-59487839%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '669158e6caf2e4062c0cd73930ea9a81dc2871f6' => 
    array (
      0 => './Home/Tpl\\Users\\photoalbum.html',
      1 => 1393439744,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16093729945ce7b803d67b52-59487839',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'countphoto' => 0,
    'list' => 0,
    'vo' => 0,
    'videonum' => 0,
    'notenum' => 0,
    'libnum' => 0,
    'messnum' => 0,
    'mymes1' => 0,
    'myfrinum' => 0,
    'myfri' => 0,
    'myfsnum' => 0,
    'number1' => 0,
    'visitor1' => 0,
    'number' => 0,
    'visitor' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce7b803ddce5',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce7b803ddce5')) {function content_5ce7b803ddce5($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><?php echo $_smarty_tpl->getSubTemplate ('../Public/head2.html', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

                       
        
<div id="sub-header" class="bq_h">
    <div class="container">
        <div class="navbar-header ">
            <h1><a href="__APP__/Index/index">E-Sch</a></h1>
        </div>
        <div class="col-md-6" style="width:80%;">
            <ul class="navbar-left">
                <li><a href="__APP__/Users/myheart">心情</a></li>
                <li><a href="__APP__/Users/myedu">我的E-Sch</a></li>
                <li><a href="__APP__/Users/settings">修改资料</a></li>
                <li class="active"><a href="__APP__/Users/photoalbum">我的相册</a></li>
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
                
                <div class="col-md-8" style="margin-top:15px;">
					<span id="myalbum" class="btn btn-default" style="font-size:18px;color:green;border:0px;">&nbsp;&nbsp;我的相册</span>
					<span id="createalbum" class="btn btn-default" style="font-size:18px;color:blue;border:0px;">&nbsp;&nbsp;创建相册</span>
					<script>
						$(function (){
							$("#createalbum").click(function (){
								$("#album").css("display","none");
								$("#create").css("display","block");
							});
							$("#myalbum").click(function (){
								$("#album").css("display","block");
								$("#create").css("display","none");
							});
						});
					</script>
					<div class="text_left_Deng" style="height:100px;">
						<?php if ($_smarty_tpl->tpl_vars['countphoto']->value==0){?>
							<p><br><a href="" class="mid_menu">您还没有相册，创建相册</a></p>

						<?php }else{ ?>
							<p><br>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="mid_menu">现在有<?php echo $_smarty_tpl->tpl_vars['countphoto']->value;?>
个相册</a></p>
		
						<?php }?>
					</div>
					
					
					<div id="create" style="display:none;">
						 <table>
							 <form action="__APP__/Users/addalbum/id/<?php echo $_SESSION['user']['id'];?>
" method="post" enctype="multipart/form-data">
								 <input type="hidden" name="id" value="<?php echo $_SESSION['user']['id'];?>
">
								 <tr><td>相&nbsp;册&nbsp;名：</td><td><input type="text" class="form-control input-lg" name="albumname" size="20"></td></tr>
								 <tr><td colspan="2" align="center"><input type="radio" name="state" checked value="1">可见&nbsp;&nbsp;&nbsp;<input type="radio" name="state" value="2">不可见</td></tr>
								 <tr><td valign="top" align="right">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</td><td><textarea class="form-control charsFrom" cols="20" rows="3" name="desc"></textarea></td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr>
								 <tr><td colspan="2" align="center"><input type="submit" class="btn btn-default" style="color:green;" value="提交">&nbsp;&nbsp;&nbsp;<input type="reset" class="btn btn-default" style="color:red;" value="重置"></td></tr>
							 </form>
						</table>
					</div>

					

					<div id="album" style="display:block;" class="mid_text_Deng">
           
			             <center>
							<?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
								<div class="photoalbum" style="display:block;border:3px solid #fff;width:100px;height:130px;float:left">
									<a href="__APP__/Users/photos/pid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
/uid/<?php echo $_SESSION['user']['id'];?>
/desc/<?php echo $_smarty_tpl->tpl_vars['vo']->value['desc'];?>
">
									
										<?php if ($_smarty_tpl->tpl_vars['vo']->value['cover']=='photo.jpg'){?><img src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['vo']->value['cover'];?>
" border="none" style="width:100px;height:100px;">
										<?php }else{ ?><img src="__PUBLIC__/Uploads/users/<?php echo $_SESSION['user']['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['cover'];?>
" border="none" style="width:100px;height:100px;">
										<?php }?>
									</a>	
									
									 <span style="font-size:10px;color:#444;font-weight:bold">相册名：<?php echo $_smarty_tpl->tpl_vars['vo']->value['albumname'];?>
</span><br>
									 <span class="delalbum" style="height:10px;" id=<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
 username=<?php echo $_SESSION['user']['username'];?>
><a class="shanchu" href="javascript:void(0)" style="font-size:13px;color:#444;">删除</a></span>
								</div>&nbsp;&nbsp;&nbsp;&nbsp;
							 <?php } ?>
						 </center>
						 
					</div>
					<script>
						$(function (){
							$(".delalbum").click(function (){
								var id=$(this).attr("id");
								var username=$(this).attr("username");
								var obj=$(this);
								//alert("sss");
								$.ajax({
									data:{'id':id,'username':username},
									dataType:'text',
									url:'__APP__/Users/delalbum',
									type:'post',
									success:function(res){
										if(res=='ok'){
											obj.parent(".photoalbum").css("display","none");
											alert("删除相册成功！");
										}
									},
								});
							});
						});
					</script>
                </div>

                
                <div class="col-md-4">
                    
                    
                    <div class="u_card">
                        <div class="u_card_name"><?php echo $_SESSION['user']['username'];?>
</div>
                        <div class="u_card_info">
                            <img src="<?php if ($_SESSION['user']['picture']=='1.jpg'){?>__PUBLIC__/uploads/users/0/1.jpg<?php }else{ ?>__PUBLIC__/uploads/users/<?php echo $_SESSION['user']['username'];?>
/<?php echo $_SESSION['user']['picture'];?>
<?php }?>" class="avatar_bg">

                            

                        </div>
                        <div class="u_card_intro">
                            
                            <p class="c666"><?php echo $_SESSION['user']['introduce'];?>
</p>
                            <p><span><?php echo smarty_modifier_date_format($_SESSION['user']['addtime'],"%Y-%m-%d");?>
加入</span></p>
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
                                还没有今日心情，去 <a href="__APP__/Users/myheart">发步</a> 吧
                            </div>
						 <?php }?>
                    </div>

                    
                    <div class="mt30">
                        <div class="tt tt_normal">
                            <h4>我关注的人<a class="f14" href="__APP__/Message/myfri">(<?php echo $_smarty_tpl->tpl_vars['myfrinum']->value;?>
)</a></h4> 
                        </div>
                        <div class="null f12 mb10" style="height:87px;">
                            <div style="margin-left:-13px;">
                            <?php if ($_smarty_tpl->tpl_vars['myfrinum']->value==0){?>
                                还没有关注任何人<a href="">浏览发现</a> 看看
                            <?php }else{ ?>
                                <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['myfri']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                                    <div  style="float:left;border:solid 0px blue;margin-left:5px;margin-top:-20px;">
                                        <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['fid'];?>
"><img width="50" height="50" src="__PUBLIC__/uploads/users/<?php if ($_smarty_tpl->tpl_vars['vo']->value['picture']=='1.jpg'){?>0/0.jpg<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
<?php }?>"><br/><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a>
                                    </div>
                                <?php } ?>
                            <?php }?>
                            </div>
                        </div>
                        <?php echo $_smarty_tpl->tpl_vars['myfsnum']->value;?>
人正在关注我
                    </div>

                    <div class="m_r_list mt30"> 
                        <div class="tt tt_normal">
                            <h4> 谁看过我</h4>
                        </div>
                        <div class="null f12 mb10" style="height:87px;">
                            <div style="margin-left:-13px;">
                                <?php if ($_smarty_tpl->tpl_vars['number1']->value==0){?>还没有哦，看来你太低调了哦
								<?php }else{ ?>
									<?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['visitor1']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
										<div  style="float:left;border:solid 0px blue;margin-left:5px;margin-top:-20px;">
											<a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vid'];?>
"><img width="50" height="50" src="__PUBLIC__/Uploads/users/<?php if ($_smarty_tpl->tpl_vars['vo']->value['vpicname']=='1.jpg'){?>0/0.jpg<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['vo']->value['visitor'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vpicname'];?>
<?php }?>"></a><br/>
											<a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vid'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['visitor'];?>
</a>
										</div>
									<?php } ?>
								<?php }?>
							</div>
                        </div>
                    </div>
					
					
					
                    <div class="m_r_list mt30"> 
                        <div class="tt tt_normal">
                            <h4> 我看过谁</h4>
                            
                        </div>
                        
                        <div class="null f12 mb10" style="height:87px;">
                            <div style="margin-left:-13px;">
                                <?php if ($_smarty_tpl->tpl_vars['number']->value==0){?>还没有哦，赶快去看看你的小伙伴吧
								<?php }else{ ?>
									<?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['visitor']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
										<div  style="float:left;border:solid 0px blue;margin-left:5px;margin-top:-20px;">
											<a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
"><img width="50" height="50" src="__PUBLIC__/Uploads/users/<?php if ($_smarty_tpl->tpl_vars['vo']->value['vpicname']=='1.jpg'){?>0/0.jpg<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['vo']->value['uname'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['upicname'];?>
<?php }?>"></a><br/>
											<a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['uname'];?>
</a>
										</div>
									<?php } ?>
								<?php }?>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ('../Public/foot2.html', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<?php }} ?>