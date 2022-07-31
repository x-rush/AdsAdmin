<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 10:54:07
         compiled from "./Home/Tpl\Video\detail.html" */ ?>
<?php /*%%SmartyHeaderCode:20645768715cd8dc4f098c61-57231116%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '20d29faa3b6a1b7d0bec869ae93da2c35f43fa92' => 
    array (
      0 => './Home/Tpl\\Video\\detail.html',
      1 => 1414747506,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20645768715cd8dc4f098c61-57231116',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
    'collnum' => 0,
    'typename' => 0,
    'lib' => 0,
    'v' => 0,
    'note' => 0,
    'n' => 0,
    'notenum' => 0,
    'comment' => 0,
    'com' => 0,
    'comTotal' => 0,
    'comPage' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dc4f21b84',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dc4f21b84')) {function content_5cd8dc4f21b84($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>教学资源浏览</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    
        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        
        
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script>
        <style type="text/css">
            /**弹出层效果**/
            .raceShow{background:url("__PUBLIC__/images/103923O21-2.gif");z-index:10000;border:solid 1px #ccc;position:absolute;display:none;width:300px;height:100px;padding:30px;font-size:16px;color:red;text-align:center;}
        </style>
        <script type="text/javascript" charset="utf-8">
            $(function(){
                //弹出层
                var speed = 500;//动画速度
                $("a.please").click(function(event){//绑定事件处理
                    event.stopPropagation();
                    //var offset = $(event.target).offset();//取消事件冒泡
		            $("#racePop").css({ top: "300px", left: "-200px"});//设置弹出层位置
                    $("#racePop").slideDown(speed);//动画显示
                    });
                $("#racePop").click(function(event) { $("#racePop").hide(speed) });//单击弹出层则自身隐藏
                $(document).click(function(event) { $("#racePop").hide(speed) });//单击空白区域隐藏    
            });
        </script>
    </head>
    <body>
    <div id="browser"></div>
        <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

        
<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="">视频库</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <ul class="navbar-left">
                <li id="navbarli" class="active"><a href="__APP__/Video/index" class="videolist">视频精选</a></li>
                <?php if ($_SESSION['user']){?>
                <li class="btn-upload-w" style="margin-left:100px"><a href="javascript:void(0)" id="videoadd" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>上传我的视频</a></li>
                <?php }else{ ?>
                <li class="btn-upload-w" style="margin-left:100px"><a href="javascript:;" class="btn btn-default btn-upload please"><i class="icon-upload-alt"></i>上传我的视频</a></li>
                <?php }?>
            </ul>
                
            </ul>
        </div>
        <div class="col-md-4">
            <div id="racePop" class="raceShow"><b>请先登录！点击此处取消...</b></div>
            <ul class="navbar-left">
                <?php if ($_SESSION['user']){?>
                <li><a href="__URL__/index/uid/<?php echo $_SESSION['user']['id'];?>
"><i class="icon-list"></i> 我上传的</a></li>
                <?php }else{ ?>
                <li><a href="javascript:;" class="please"><i class="icon-list"></i> 我上传的</a></li>
                <?php }?>
                <li>
                <?php if ($_SESSION['user']){?>
                <a href="__URL__/index/collid/<?php echo $_SESSION['user']['id'];?>
"><i class="icon-list"></i> 我收藏的</a>
                <?php }else{ ?>
                <a href="javascript:;" class="please"><i class="icon-list"></i> 我收藏的</a>
                <?php }?>
                </li>
            </ul>
        </div>
    </div>
</div>



        
<div id="main">
    <div class="container">
        <div class="home_module m_movie row">
            <div class="container">
                <!-- 左侧 -->
                <div class="col-md-8">

                    
                    <div class="tt">
                        <h3><?php echo $_smarty_tpl->tpl_vars['vo']->value['videoname'];?>
</h3>
                    </div>

                    <!-- 影片信息 -->
                    <div class="m_detail_top mt5 row mb10">
                        <div class="col-md-8" style="width:300px;">
                            <div class="m_detail_cover col-md-4 tc" style="width:200px">
                                <img style="width:200px" alt="<?php echo $_smarty_tpl->tpl_vars['vo']->value['videoname'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['vo']->value['videoname'];?>
" src="__PUBLIC__/Uploads/videopic/<?php echo $_smarty_tpl->tpl_vars['vo']->value['picname'];?>
">
                                <div class="mt20" style="width:200px">
                                    <i class="btn btn-sm btn-default"><i class="icon-heart"></i> <em><?php echo $_smarty_tpl->tpl_vars['vo']->value['favonum'];?>
</em>人赞</i> 
                                    <i class="btn btn-sm btn-default"><i class="icon-heart"></i> <em><?php echo $_smarty_tpl->tpl_vars['collnum']->value;?>
</em>人收藏</i>
                                </div>
                            </div>
                            
                            <div class="m_detail_info col-md-8" style="width:300px">
                                <span>类别：<?php echo $_smarty_tpl->tpl_vars['typename']->value;?>
</span>
                                <span>播放量：<?php echo $_smarty_tpl->tpl_vars['vo']->value['clicknum'];?>
</span>
                                <span>上传时间： <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</span>

                                
                                    <span class="mt10">
                                        <a href="__APP__/Video/play/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" class="btn btn-success btn-sm"><i class="icon-play"></i> 在线观看正片</a>               
                                        <?php if ($_SESSION['user']){?>
                                        <a data-toggle="modal-review" href="javascript:void(0)" class="btn btn-sm btn-info">写短评</a>
                                        <?php }else{ ?>
                                        <a href="javascript:void(0)" class="btn btn-sm btn-info please">写短评</a>
                                        <?php }?>
                                    </span>
                                

                                
                            </div>
                        </div>

<!--添加视频短评的弹框-->
<div id="short-review-modal" tabindex="2" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">发表短评 </h4>
            </div>
            <div class="modal-body">
                <form id="short-review-form" action="" method="post" class="form-horizontal" autocomplete="off">
                    
                    <input type="hidden" name="uid" value="<?php echo $_SESSION['user']['id'];?>
">
                    <input type="hidden" name="vid" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
">
                    <div class="form-group">
                        <label class="col-lg-2 control-label">短评内容</label>
                        <div class="col-lg-9">
                            <textarea name="content" class="form-control charsFrom" rows="3" id="short_content"></textarea>
                            <p class="pull-left f12 c999"><span class="charsText">还可以输入</span><span class="charsLeft go_green">140</span>字</p>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="button" class="btn btn-default btn-review-push disabled" disabled="disabled" data-film-id="1106">提交</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" charset="utf-8">
    $(function(){
        //添加评论的Ajax方法
        $("#button").click(function(){
            var uid = $("input[name='uid']").val();
            var vid = $("input[name='vid']").val();
            var content = $("textarea[name='content']").val();
            //alert(content);
            if (!content.trim()) {
                $("textarea[name='content']").next("span").empty();
                $("textarea[name='content']").after("<span><font color='red' style='float:right'>内容为空哟、</font></span>");
                $("textarea[name='content']").val("");//清空文本框中的内容
                $("span[class='charsLeft go_green']").html(140);
                $("button").css("disabled","disabled");
                return;
            }else{
                $("textarea[name='content']").next("span").empty();
                $.ajax({
                    url:"__APP__/Videocom/addvideocom",
                    type:"post",
                    async:true,
                    data:{"uid":uid,"vid":vid,"content":content},
                    dataType:"json",
                    success:function(data){
                        //alert(data.content);
                        var str = "<li>";
                        str += "<div class=\"reviews_b\">";
                        str += "<div class=\"c999 m_n_item_info f12 bg_fff\">";
                        str += "<a href='__APP__/Users/otheredu/uid/"+data.uid+">'><img alt='"+data.username+"' title='"+data.username+"' src='__PUBLIC__/Uploads/users/"+data.username+"/s_"+data.picture+"' class='avatar_md'></a>";
                        str += "<a href='__APP__/Users/otheredu/uid/'"+data.uid+" target=\"_blank\">"+data.username+"</a> "+data.addtime+"</div>";
                        str += "<p><i class=\"icon-quote-left cccc\"></i>"+data.content+"<i class=\"icon-quote-right cccc\"></i></p></div>";
                        str += "</li>";
                        $("#comment").prepend(str);//把评论内容追加到ul的第一个节点
                        $("textarea[name='content']").val("");//清空文本框中的内容
                        $("span[class='charsLeft go_green']").html(140);
                        $("button").css("disabled","disabled");
                        $("#short-review-modal").hide();
                        window.location.reload();
                        
                    },
                    error:function(){
                        alert("ajax请求失败！");
                    }
                });
            } 
        });   
    });
</script>
<!--添加视频短评的弹框-->                

                        <div class="col-md-4 m_detail_ping_wrap clearfix" style="width:300px">
                            <h3>相关的文档资源：</h3>
                            <ul>
                                <?php if ($_smarty_tpl->tpl_vars['lib']->value){?>
                                <?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['lib']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
?>
                                <li><a href="__APP__/Library/detail/id/<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['title'];?>
</a></li>
                                <?php } ?>
                                <?php }else{ ?>
                                <li>暂无相关文档,<a href="__APP__/Library/add">欢迎上传</a>...</li>
                                <?php }?>
                            </ul>
                           
                        </div>
                    </div>

                    <!-- 剧情简介 -->
                    <div class="m_detail_related_info mb30">
                        <h3>视频简介</h3>
                        <p><?php echo $_smarty_tpl->tpl_vars['vo']->value['descr'];?>
</p>
                    </div>

                    
                    <!-- 视频手记 -->
                    <div class="m_detail_reviews">
                        <div class="tt">
                            <h3>我最近的手记</h3>
                            <?php if ($_SESSION['user']){?>
                            <a href="__APP__/Note/add/vid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" class="btn btn-sm pull-right btn-primary btn-note-new"><i class="icon-pencil"></i> 写手记</a>
                            <?php }else{ ?>
                            <a href="javascript:;" class="btn btn-sm pull-right btn-primary btn-note-new please"><i class="icon-pencil"></i> 写手记</a>
                            <?php }?>
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
                        <li><?php echo $_smarty_tpl->tpl_vars['n']->iteration;?>
、<a href="__APP__/Note/detail/id/<?php echo $_smarty_tpl->tpl_vars['n']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['n']->value['title'];?>
</a> <i style="float:right">createtime：<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['n']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</i></li>
                        <?php } ?>
                        <?php if ($_smarty_tpl->tpl_vars['notenum']->value>5){?>
                        <li><a href="__APP__/Note/index/uid/<?php echo $_SESSION['user']['id'];?>
/vid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" style="float:right" target="_blank" class="more pt5">全部(<?php echo $_smarty_tpl->tpl_vars['notenum']->value;?>
) »</a></li>
                        <?php }?>
                        </ul>
                        <?php }else{ ?>
                        <div class="null">
                            暂时还没有手记
                        </div>
                        <?php }?>
                    </div>
                    
                </div>

                <!-- 右侧 -->
                <div class="col-md-4">
                    <!-- 广告位 -->
                    <div class="biquu_d_placeholder mt60 mb40">
                        <a href=""><span class="biquu_d_placeholder"><img alt="E-Sch教学网" title="E-Sch教学网" src="__PUBLIC__/images/ads-lg.jpg"></span></a>
                    </div>

                    <!-- 短评 -->
                    <div class="m_detail_reviews s_reviews mb30">
                        <div class="tt pb10">
                            <h3 class="pt5">视频的短评</h3>
                            
                            <!--<a href="" target="_blank" class="more pt5">全部(32) »</a>-->
                            <?php if ($_SESSION['user']){?>
                            <a data-film-id="1238" data-toggle="modal-review" href="javascript:void(0)" class="btn btn-sm pull-right btn-info"><i class="icon-pencil"></i> 写短评</a>
                            <?php }else{ ?>
                            <a data-film-id="1238" href="javascript:void(0)" class="btn btn-sm pull-right btn-info please"><i class="icon-pencil"></i> 写短评</a>
                            <?php }?>
                        </div>
                        
                        <ul class="list_pb10" id="comment">
                            <?php if ($_smarty_tpl->tpl_vars['comment']->value){?>
                            <?php  $_smarty_tpl->tpl_vars['com'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['com']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['comment']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['com']->key => $_smarty_tpl->tpl_vars['com']->value){
$_smarty_tpl->tpl_vars['com']->_loop = true;
?>
                            <li>
                                <div class="reviews_b">
                                    <div class="c999 m_n_item_info f12 bg_fff">
                                        <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['com']->value['uid'];?>
"><img alt="<?php echo $_smarty_tpl->tpl_vars['com']->value['username'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['com']->value['username'];?>
" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['com']->value['username'];?>
/s_<?php echo $_smarty_tpl->tpl_vars['com']->value['picture'];?>
" class="avatar_md"></a>
                                        <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['com']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['com']->value['username'];?>
</a> <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['com']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                                    </div>
                                    <p>
                                        <i class="icon-quote-left cccc"></i>
                                        <?php echo $_smarty_tpl->tpl_vars['com']->value['content'];?>

                                        <i class="icon-quote-right cccc"></i>
                                    </p>
                                </div>
                            </li>
                            <?php } ?>
                            <?php }else{ ?>
                            <li>快来坐第一个沙发~</li>
                            <?php }?>
                        </ul>
                        <?php if ($_smarty_tpl->tpl_vars['comTotal']->value>5){?>
                            <i style="float:right"><?php echo $_smarty_tpl->tpl_vars['comPage']->value;?>
</i>
                        <?php }?>                        
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


        <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

    
</body></html>
<?php }} ?>