<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 10:56:39
         compiled from "./Home/Tpl\Users\myedu.html" */ ?>
<?php /*%%SmartyHeaderCode:11322464735cd8dce72f0be3-91505872%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'eef337a6b4e511001900212604be9aa2a53d7554' => 
    array (
      0 => './Home/Tpl\\Users\\myedu.html',
      1 => 1393463458,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11322464735cd8dce72f0be3-91505872',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'collnum' => 0,
    'collect' => 0,
    'co' => 0,
    'notecollnum' => 0,
    'notecoll' => 0,
    'no' => 0,
    'libcollnum' => 0,
    'libcoll' => 0,
    'li' => 0,
    'note' => 0,
    'n' => 0,
    'notenum' => 0,
    'vo' => 0,
    'umessage' => 0,
    'um' => 0,
    'videonum' => 0,
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
  'unifunc' => 'content_5cd8dce7390e9',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dce7390e9')) {function content_5cd8dce7390e9($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><?php echo $_smarty_tpl->getSubTemplate ('../Public/head2.html', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

                       
        
<div id="sub-header" class="bq_h">
    <div class="container">
        <div class="navbar-header ">
            <h1><a href="__APP__/Index/index">E-Sch</a></h1>
        </div>
        <div class="col-md-6" style="width:80%;">
            <ul class="navbar-left">
                <li><a href="__APP__/Users/myheart">心情</a></li>
                <li class="active"><a href="__APP__/Users/myedu">我的E-Sch</a></li>
                <li><a href="__APP__/Users/settings">修改资料</a></li>
                <li><a href="__APP__/Users/photoalbum">我的相册</a></li>
                <li><a href="__APP__/Users/stranger">查看陌生人</a></li>
                <li><a href="__APP__/Test/myscore">我的考试</a></li>
            </ul>
        </div> 
    </div>
</div>
<style type="text/css">
    .m_r_list h4{cursor:pointer;height:30px}
</style>
<script type="text/javascript" charset="utf-8">
    //设置用户收藏的资源动态效果
    $(function(){
        $("div.m_r_list h4").click(
            function(){
                switch($(this).attr("class")) {
                    case 'video':
                        $("ul.videolist").slideToggle("slow");
                        break;
                    case 'note':
                        $("ul.notelist").slideToggle("slow");
                        break;
                    case 'library':
                        $("ul.liblist").slideToggle("slow");
                        break;
                    case 'mynote':
                        $("ul.mynotelist").slideToggle("slow");
                        break;
                }
            }
        );
    });    
</script>
    
<div id="main">
    <div class="container">
        <div class="home_module row">
            <div class="container">
                
                <div class="col-md-8">
                    
                    <!--秀波的-->
                    <div class="m_r_list mt30">
                        <div class="tt tt_normal">
                            <h4 class="video">我收藏的视频</h4>
                            <?php if ($_smarty_tpl->tpl_vars['collnum']->value>4){?>
                            <a href="__APP__/Video/index/collid/<?php echo $_SESSION['user']['id'];?>
" style="float:right" target="_blank" class="more pt5">全部(<?php echo $_smarty_tpl->tpl_vars['collnum']->value;?>
) »</a>
                            <?php }?>
                        </div>

                        <ul class="videolist" style="display:none">
                        <?php if ($_smarty_tpl->tpl_vars['collect']->value){?>
                        <?php  $_smarty_tpl->tpl_vars['co'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['co']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['collect']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['co']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['co']->key => $_smarty_tpl->tpl_vars['co']->value){
$_smarty_tpl->tpl_vars['co']->_loop = true;
 $_smarty_tpl->tpl_vars['co']->iteration++;
?>
                        <li style="height:35px;font-size:14px"><?php echo $_smarty_tpl->tpl_vars['co']->iteration;?>
、<?php echo $_smarty_tpl->tpl_vars['co']->value['videoname'];?>
<a style="float:right" href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['co']->value['id'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['co']->value['tid'];?>
">查看详情</a></li>
                        <?php } ?>
                        <?php }else{ ?>
                        <div class="null">
                            亲，还没有学习视频，去 <a href="__APP__/Video/index">这里</a> 看看有没有适合你的视频资源吧
                        </div>
                        <?php }?>
                        </ul>   
                    </div>
					
					<div class="m_r_list mt30">
                        <div class="tt tt_normal">
                            <h4 class="note">我收藏的手记</h4>
                            <?php if ($_smarty_tpl->tpl_vars['notecollnum']->value>4){?>
                            <a href="__APP__/Note/index/collid/<?php echo $_SESSION['user']['id'];?>
" style="float:right" target="_blank" class="more pt5">全部(<?php echo $_smarty_tpl->tpl_vars['notecollnum']->value;?>
) »</a>
                            <?php }?>
                        </div>

                        <ul class="notelist" style="display:none">
                        <?php if ($_smarty_tpl->tpl_vars['notecoll']->value){?>
                        <?php  $_smarty_tpl->tpl_vars['no'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['no']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['notecoll']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['no']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['no']->key => $_smarty_tpl->tpl_vars['no']->value){
$_smarty_tpl->tpl_vars['no']->_loop = true;
 $_smarty_tpl->tpl_vars['no']->iteration++;
?>
                        <li style="height:35px;font-size:14px"><?php echo $_smarty_tpl->tpl_vars['no']->iteration;?>
、<?php echo $_smarty_tpl->tpl_vars['no']->value['title'];?>
<a style="float:right" href="__APP__/Note/detail/id/<?php echo $_smarty_tpl->tpl_vars['no']->value['id'];?>
">查看详情</a></li>
                        <?php } ?>
                        <?php }else{ ?>
                        <div class="null">
                            亲，还没有收藏手记，去 <a href="__APP__/Note/index">这里</a> 看看有没有适合你喜欢的手记吧
                        </div>
                        <?php }?>
                        </ul>   
                    </div>

                    <div class="m_r_list mt30">
                        <div class="tt tt_normal">
                            <h4 class="library">我收藏的文档</h4>
                            <?php if ($_smarty_tpl->tpl_vars['libcollnum']->value>4){?>
                            <a href="__APP__/Library/index/collid/<?php echo $_SESSION['user']['id'];?>
" style="float:right" target="_blank" class="more pt5">全部(<?php echo $_smarty_tpl->tpl_vars['libcollnum']->value;?>
) »</a>
                            <?php }?>
                        </div>

                        <ul class="liblist" style="display:none">
                        <?php if ($_smarty_tpl->tpl_vars['libcoll']->value){?>
                        <?php  $_smarty_tpl->tpl_vars['li'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['li']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['libcoll']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['li']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['li']->key => $_smarty_tpl->tpl_vars['li']->value){
$_smarty_tpl->tpl_vars['li']->_loop = true;
 $_smarty_tpl->tpl_vars['li']->iteration++;
?>
                        <li style="height:35px;font-size:14px"><?php echo $_smarty_tpl->tpl_vars['li']->iteration;?>
、<?php echo $_smarty_tpl->tpl_vars['li']->value['title'];?>
<a style="float:right" href="__APP__/Library/detail/id/<?php echo $_smarty_tpl->tpl_vars['li']->value['id'];?>
">查看详情</a></li>
                        <?php } ?>
                        <?php }else{ ?>
                        <div class="null">
                            亲，还没有收藏，去 <a href="__APP__/Library/index">这里</a> 看看有没有适合你的文档资源吧
                        </div>
                        <?php }?>
                        </ul>   
                    </div>

                    <div class="m_r_list mt30">
                        <div class="tt tt_normal">
                            <h4 class="mynote"> 我创建的视频手记</h4>
                        </div>
                        <?php if ($_smarty_tpl->tpl_vars['note']->value){?>
                        <ul class="mynotelist" style="display:none">
                        <?php  $_smarty_tpl->tpl_vars['n'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['n']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['note']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['n']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['n']->key => $_smarty_tpl->tpl_vars['n']->value){
$_smarty_tpl->tpl_vars['n']->_loop = true;
 $_smarty_tpl->tpl_vars['n']->iteration++;
?>
                        <li style="font-size:14px;height:35px"><?php echo $_smarty_tpl->tpl_vars['n']->iteration;?>
、<a href="__APP__/Note/detail/id/<?php echo $_smarty_tpl->tpl_vars['n']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['n']->value['title'];?>
</a> <i style="float:right">createtime：<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['n']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</i></li>
                        <?php } ?>
                        <?php if ($_smarty_tpl->tpl_vars['notenum']->value>5){?>
                        <li><a href="__APP__/Note/index/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" style="float:right" target="_blank" class="more pt5">全部(<?php echo $_smarty_tpl->tpl_vars['notenum']->value;?>
) »</a></li>
                        <?php }?>
                        </ul>
                        <?php }else{ ?>
                        <div class="null">
                            还没有创建手记，去 <a href="__APP__/Note/index">这里</a> 看看大家写的手记
                        </div>
                        <?php }?>

                        
                    </div>

                    <!--留言板-->
                    <div class="mt30">
                        <div class="board clearfix">
                            <div class="tt tt_normal">
                                <h4><?php echo $_SESSION['user']['username'];?>
的留言板</h4>
                                
                                <a class="more" href="__APP__/Users/mymessage">全部 »</a>
                                
                            </div>
                            
                                <div class="form-item">
                                    <textarea id="message" class="form-control" rows="3" name="content" datatype="*1-500" nullmsg="还没写留言呢" errormsg="不能超过500个字"></textarea>
                                    <span class="Validform_checktip"></span>
                                </div>
                                
                            <div class="form-item tr">
                                    <button id="sub" class="btn btn-default">留言</button>
                            </div>
							
							<ul class="list_pb20 mt30 f12" id="liuyan">
							
							<?php  $_smarty_tpl->tpl_vars['um'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['um']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['umessage']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['um']->key => $_smarty_tpl->tpl_vars['um']->value){
$_smarty_tpl->tpl_vars['um']->_loop = true;
?>
								<li>
                                    <div class="clearfix">
                                        <div class="pull-left">
											<a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['um']->value['vid'];?>
"><img class="avatar_sm" src="__PUBLIC__/Uploads/users/<?php if ($_smarty_tpl->tpl_vars['um']->value['upic']=='1.jpg'){?>0/1.jpg<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['um']->value['visitor'];?>
/<?php echo $_smarty_tpl->tpl_vars['um']->value['upic'];?>
<?php }?>"></a><br/>
                                        </div>
                                        <div class="t_ml_40">
                                            <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['um']->value['vid'];?>
"><?php echo $_smarty_tpl->tpl_vars['um']->value['visitor'];?>
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
                                还没有今日心情，去 <a href="__APP__/Users/myheart">发布</a> 吧
                            </div>
						 <?php }?>
                    </div>

                    
                    <div class="mt30">
                        <div class="tt tt_normal">
                            <h4>我关注的人<a class="f14" href="__APP__/Message/myfri">(<?php echo $_smarty_tpl->tpl_vars['myfrinum']->value;?>
)</a></h4> 
                        </div>
                        <div class="null f12 mb10" style="height:87px;overflow:hidden;">
                            <div style="margin-left:-13px;">
                            <?php if ($_smarty_tpl->tpl_vars['myfrinum']->value==0){?>
                                还没有关注任何人<a href="__APP__/Users/stranger">浏览发现</a> 看看
                            <?php }else{ ?>
                                <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['myfri']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                                    <div  class="guanzhu" style="float:left;border:solid 0px blue;margin-left:0px;margin-top:-20px;">
                                        <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['fid'];?>
"><img width="50" height="50" src="__PUBLIC__/uploads/users/<?php if ($_smarty_tpl->tpl_vars['vo']->value['picture']=='1.jpg'){?>0/0.jpg<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
<?php }?>"><br/><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a>
                                    </div>
                                <?php } ?>
								
								
                            <?php }?>
							
							<script>
								$(".guanzhu").last().hide();
							</script>
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