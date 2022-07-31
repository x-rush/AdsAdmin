<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 13:08:21
         compiled from "./Home/Tpl\Users\otheredu.html" */ ?>
<?php /*%%SmartyHeaderCode:5598568535cd8fbc5d40c31-88985454%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6a73f56a9b100125fd7da9ebc8694feac984f8cc' => 
    array (
      0 => './Home/Tpl\\Users\\otheredu.html',
      1 => 1393439744,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5598568535cd8fbc5d40c31-88985454',
  'function' => 
  array (
  ),
  'variables' => 
  array (
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
  'unifunc' => 'content_5cd8fbc6230cb',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8fbc6230cb')) {function content_5cd8fbc6230cb($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><?php echo $_smarty_tpl->getSubTemplate ('../Public/head2.html', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

                       
        
<div id="sub-header" class="bq_h">
    <div class="container">
        <div class="navbar-header ">
            <h1><a href="__APP__/Index/index">E-Sch</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li class="active"><a href="__APP__/Users/otheredu/uid/<?php echo $_GET['uid'];?>
">Ta的E-Sch</a></li>
                <li><a href="__APP__/Users/otheralbum/uid/<?php echo $_GET['uid'];?>
">Ta的相册</a></li>

            </ul>
        </div>
    </div>
</div>

 

        
<div id="main">
    <div class="container">
        <div class="home_module row">
            <div class="container">
                
                <div class="col-md-8">


                    <div class="m_r_list mt30">
                        <div class="tt tt_normal">
                            <h4> <?php echo $_SESSION['otheruser']['username'];?>
的视频手记</h4>
                            
                        </div>
                        <?php if ($_smarty_tpl->tpl_vars['note']->value){?>
                        <ul>
                        <?php  $_smarty_tpl->tpl_vars['n'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['n']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['note']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['n']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['n']->key => $_smarty_tpl->tpl_vars['n']->value){
$_smarty_tpl->tpl_vars['n']->_loop = true;
 $_smarty_tpl->tpl_vars['n']->iteration++;
?>
                        <li style="font-size:14px;height:40px"><?php echo $_smarty_tpl->tpl_vars['n']->iteration;?>
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
                            还没有创建手记，去这里看看大家写的手记
                        </div>
                        <?php }?>
                    </div>
                    
                    
                    
                    <div class="mt30">
                        <div class="board clearfix">
                            <div class="tt tt_normal">
                                <h4><?php echo $_SESSION['otheruser']['username'];?>
的留言板</h4>
								
								
                                <!--要不要显示
                                <a class="more" href="__APP__/Users/mymessage">全部 »</a>
                                -->
								
								
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
"><img class="avatar_sm" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['um']->value['visitor'];?>
/<?php echo $_smarty_tpl->tpl_vars['um']->value['upic'];?>
"></a><br/>
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
										var myid=<?php echo $_GET['uid'];?>
;
										var vid=<?php echo $_SESSION['user']['id'];?>
;
										var vname="<?php echo $_SESSION['user']['username'];?>
";
										$.ajax({
											data:{'message':mes,'myid':myid,'vid':vid,'visitor':vname},
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
                        <div class="u_card_name"><?php echo $_SESSION['otheruser']['username'];?>
</div>
                        <div class="u_card_info">
                            <img src="__PUBLIC__/Uploads/users/<?php echo $_SESSION['otheruser']['username'];?>
/<?php echo $_SESSION['otheruser']['picture'];?>
" class="avatar_bg">
                            
                             <div class="btn-group mt10 btn-block">
                                <button id='ll' class="btn btn-lg btn-block btn-follow dropdown-toggle" type="button" data-toggle="dropdown">
                                    <?php if ($_SESSION['otheruser']['like']=='y'){?> 已关注 <?php }else{ ?> 未关注 <?php }?>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class='like' vv="<?php echo $_SESSION['otheruser']['like'];?>
" href="javascript:void(0)"><?php if ($_SESSION['otheruser']['like']=='y'){?>取消关注<?php }else{ ?>+关注<?php }?></a></li>
                                </ul>
                            </div>

                        </div>
<script type="text/javascript" charset="utf-8">
    $(function(){
        //关注
        $(".like").click(function(){
            var vv=$(this).attr('vv');
            if(vv=='y'){
                $.ajax({
                    url:"__APP__/Message/friend",     //请求地址
                    type:"post",                    //发送方式
                    data:{vv:vv,fid:'<?php echo $_SESSION['otheruser']['id'];?>
'},        //发送的数据
                    dataType:"json",                //响应数据的方式
                    async:true,
                    success:function(data){
                        $(".like").text('+关注');
                        $("#ll").text(' 未关注 ');
                        $(".like").attr("vv",'n');
                    },
                    error:function(){
                        alert("亲，请登录！");
                    }
                })
            }else{
                $.ajax({
                    url:"__APP__/Message/friend",     //请求地址
                    type:"post",                    //发送方式
                    data:{vv:vv,fid:'<?php echo $_SESSION['otheruser']['id'];?>
'},        //发送的数据
                    dataType:"json",                //响应数据的方式
                    async:true,
                    success:function(data){
                        $(".like").text('取消关注');
                        $("#ll").text(' 已关注 ');
                        $(".like").attr("vv",'y');
                    },
                    error:function(){
                        alert("亲，请登录！");
                    }
                })
            }
            
        });
    });
</script>
                        <div class="u_card_intro">
                            
                            <p class="c666"><?php echo $_SESSION['otheruser']['introduce'];?>
</p>
                            <p><span><?php echo smarty_modifier_date_format($_SESSION['otheruser']['addtime'],"%Y-%m-%d");?>
加入</span></p>
                        </div>
                        <div class="u_card_data">
                            <ul class="list_ib">
                                <li>
                                    <a href="__APP__/Video/index/uid/<?php echo $_SESSION['otheruser']['id'];?>
">视频<span><?php echo $_smarty_tpl->tpl_vars['videonum']->value;?>
</span></a>
                                </li>
                                <li>
                                    <a href="__APP__/Note/index/uid/<?php echo $_SESSION['otheruser']['id'];?>
">手记<span><?php echo $_smarty_tpl->tpl_vars['notenum']->value;?>
</span></a>
                                </li>
                                <li>
                                    <a href="__APP__/Library/index/uid/<?php echo $_SESSION['otheruser']['id'];?>
">军火<span><?php echo $_smarty_tpl->tpl_vars['libnum']->value;?>
</span></a>
                                </li>
                                <li>
                                    <a href="__APP__/Message/mine/uid/<?php echo $_SESSION['otheruser']['id'];?>
">帖子<span><?php echo $_smarty_tpl->tpl_vars['messnum']->value;?>
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
                                还没有今日心情，去发步吧
                            </div>
						 <?php }?>
                    </div>

                    
                    <div class="mt30">
                        <div class="tt tt_normal">
                            <h4>Ta关注的人(<?php echo $_smarty_tpl->tpl_vars['myfrinum']->value;?>
)</h4> 
                        </div>
                        <div class="null f12 mb10" style="height:87px;">
                            <div style="margin-left:-13px;">
                            <?php if ($_smarty_tpl->tpl_vars['myfrinum']->value==0){?>
                                还没有关注任何人
                            <?php }else{ ?>
                                <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['myfri']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                                    <div  style="float:left;border:solid 0px blue;margin-left:5px;margin-top:-20px;">
                                        <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['fid'];?>
"><img width="50" height="50" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
"><br/><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a>
                                    </div>
                                <?php } ?>
                            <?php }?>
                            </div>
                        </div>
                        <?php echo $_smarty_tpl->tpl_vars['myfsnum']->value;?>
人正在关注它
                    </div>

                    <div class="m_r_list mt30"> 
                        <div class="tt tt_normal">
                            <h4> 谁看过Ta</h4>
                        </div>
                        <div class="null f12 mb10" style="height:87px;">
                            <div style="margin-left:-13px;">
                                <?php if ($_smarty_tpl->tpl_vars['number1']->value==0){?>还没有哦，看来它太低调了哦
								<?php }else{ ?>
									<?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['visitor1']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
										<div  style="float:left;border:solid 0px blue;margin-left:5px;margin-top:-20px;">
											<a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vid'];?>
"><img width="50" height="50" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['vo']->value['visitor'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vpicname'];?>
"></a><br/>
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
                            <h4> Ta看过谁</h4>
                            
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
"><img width="50" height="50" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uname'];?>
/<?php echo $_smarty_tpl->tpl_vars['vo']->value['upicname'];?>
"></a><br/>
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