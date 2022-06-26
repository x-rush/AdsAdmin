<?php /* Smarty version Smarty-3.1.6, created on 2019-05-12 19:40:58
         compiled from "./Home/Tpl\Video\play.html" */ ?>
<?php /*%%SmartyHeaderCode:6368951865cd8064a419ee0-86400124%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7a0f92b3b2b4bf52cf22b5aec149172bb99f5c62' => 
    array (
      0 => './Home/Tpl\\Video\\play.html',
      1 => 1393467744,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6368951865cd8064a419ee0-86400124',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
    'iszan' => 0,
    'collect' => 0,
    'like' => 0,
    'li' => 0,
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
  'unifunc' => 'content_5cd8064a4be01',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8064a4be01')) {function content_5cd8064a4be01($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>教学视频在线播放</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script>
        
        <script type="text/javascript" src="__PUBLIC__/ckplayer/offlights.js"></script>
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
		            $("#racePop").css({ top:event.pageY +  "px", left: event.pageX-"400" + "px" });//设置弹出层位置
                    $("#racePop").slideDown(speed);//动画显示
                    });
                $("#racePop").click(function(event) { $("#racePop").fadeOut(speed) });//单击弹出层则自身隐藏
                $(document).click(function(event) { $("#racePop").fadeOut(speed) });//单击空白区域隐藏 
                //视频被赞的方法
                $("#favo").click(function(){
                    var idnum = $(this).attr("idnum");
                    //alert(idnum);
                    $.ajax({
                        url:"__URL__/favo",
                        type:"post",
                        async:true,
                        data:"id="+idnum,
                        dataType:"text",
                        success:function(data){
                            //alert(data);
                            if (data == "yes") {
                                $("#favo").html("已赞").css("color","red");
                            }else{
                                $("#favo").html("赞").css("color","#777777");
                            }
                        },
                        error:function(){
                            alert("ajax请求失败！");
                        }
                    });
                });
                //视频的收藏Ajax请求
                $("#collect").click(function(){
                    var vidnum = $(this).attr("vidnum");//获取被收藏的视频id
                    $.ajax({
                        url:"__URL__/collect",
                        type:"post",
                        async:true,
                        data:"id="+vidnum,
                        dataType:"text",
                        success:function(data){
                            if (data == "yes") {
                                $("#collect").html("已收藏").css("color","red");
                            }else{
                                $("#collect").html("收藏").css("color","#777777");
                            }
                        },
                        error:function(){
                            alert("ajax请求失败！");
                        }
                    });
                });
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
                <li id="navbarli" class="active"><a href="__URL__/index" class="videolist">视频精选</a></li>
                <?php if ($_SESSION['user']){?>
                <li class="btn-upload-w" style="margin-left:100px"><a href="javascript:void(0)" id="videoadd" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>上传我的视频</a></li>
                <?php }else{ ?>
                <li class="btn-upload-w" style="margin-left:100px"><a href="javascript:;" class="btn btn-default btn-upload please"><i class="icon-upload-alt"></i>上传我的视频</a></li>
                <div id="racePop" class="raceShow"><b>请先登录！点击此处取消...</b></div>
                <?php }?>
                
            </ul>
        </div>
        <div class="col-md-4">
            <ul class="navbar-left">
                <li>
                <?php if ($_SESSION['user']){?>
                <a href="__URL__/index/uid/<?php echo $_SESSION['user']['id'];?>
"><i class="icon-list"></i> 我上传的</a>
                <?php }else{ ?>
                <a href="javascript:;" class="please"><i class="icon-list"></i> 我上传的</a>
                <?php }?>
                </li>
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
        <div id="racePop" class="raceShow"><b>请先登录！点击此处取消...</b></div>
    </div>
</div>


<div id="main" class="bg_f2 pt20">
    <div class="container p0">
        <div class="home_module m_movie m_detail p0">
            <div class="container p0">
                
                <div class="clearfix player_h row">
                    <div class="col-md-8">
                        <h2 class="fw_n f24 pull-left pl20 pr20" style="margin-left:100px">正在播放： <?php echo $_smarty_tpl->tpl_vars['vo']->value['videoname'];?>
</h2>
                    </div>
                    <div class="col-md-4">
                        <div class="mr20 filmdetail">
                            
                            <a href="__URL__/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" class="f12" style="margin-right:200px">查看影片详情</a>        
                        </div>
                    </div>
                </div>

                

                <div class="col-md-12">
                    <div id="video" videoname="<?php echo $_smarty_tpl->tpl_vars['vo']->value['name'];?>
" videopic="<?php echo $_smarty_tpl->tpl_vars['vo']->value['picname'];?>
" style="position:relative;z-index:100;margin-left:10%;width:750px;height:500px"><div id="a1"></div></div>
                    <script type="text/javascript" src="__PUBLIC__/ckplayer/ckplayer.js" charset="utf-8"></script>
                    <script type="text/javascript">
                    $(function(){
                        var name = $("#video").attr("videoname");        
                        var videopic = $("#video").attr("videopic");        
                        //alert(name);alert(videopic);
                        var flashvars={
                            f:'__PUBLIC__/Uploads/video/'+name,
                            c:0,
                            b:1,
                            x:'',//调用xml风格路径，为空的话将使用ckplayer.js的配置
                            //i:"__PUBLIC__/Uploads/video_first/ladv.jpg",//初始图片地址
                            d:"__PUBLIC__/ckplayer/ladver.jpg",//视频暂停时的图片
                            u:'',//暂停时如果是图片的话，加个链接地址
                            t:"10",
                            l:'__PUBLIC__/ckplayer/1.mp4',//前置广告，swf/图片/视频，多个用竖线隔开，图片和视频要加链接地址
                            r:'__PUBLIC__/ckplayer/1.mp4'//前置广告的链接地址，多个用竖线隔开，没有的留空
                            
                            };
                        var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always'};
                        CKobject.embedSWF('__PUBLIC__/ckplayer/ckplayer.swf','a1','ckplayer_a1','750','500',flashvars,params);
                        /*
                        CKobject.embedSWF(播放器路径,容器id,播放器id/name,播放器宽,播放器高,flashvars的值,其它定义也可省略);
                        下面三行是调用html5播放器用到的
                        */
                        var video=['http://movie.ks.js.cn/flv/other/1_0.mp4->video/mp4','http://www.ckplayer.com/webm/0.webm->video/webm','http://www.ckplayer.com/webm/0.ogv->video/ogg'];
                        var support=['iPad','iPhone','ios','android+false','msie10+false'];
                        CKobject.embedHTML5('video','ckplayer_a1',750,500,video,flashvars,support);
                        });
                        //跳过广告
                        function ckadjump(){
		                    swfobject.getObjectById('ckplayer_a1').ckplayer_advunload();
	                    }
                        //开关灯
                        var box = new LightBox();
                        function closelights(){//关灯
                            box.Show();
                            CKobject._K_('video').style.width='940px';
                            CKobject._K_('video').style.height='550px';
                            swfobject.getObjectById('ckplayer_a1').width=940;
                            swfobject.getObjectById('ckplayer_a1').height=550;
                        }
                        function openlights(){//开灯
                            box.Close();
                            CKobject._K_('video').style.width='750px';
                            CKobject._K_('video').style.height='500px';
                            swfobject.getObjectById('ckplayer_a1').width=750;
                            swfobject.getObjectById('ckplayer_a1').height=500;
                        }

                    </script>

                        
                    </div>

                    <div id="playerToolbar" class="clearfix mt20" style="padding:0 100px">
                        <div class="col-md-8 pull-left" style='width:200px;'>
                            <ul class="list_ib">
                                <li class="">
                                <?php if ($_SESSION['user']){?>
                                <i class="icon-thumbs-up" style="margin-top:15px"></i><a href="javascript:void(0)" id="favo" idnum="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" title="赞"><?php if ($_smarty_tpl->tpl_vars['iszan']->value){?><font color="red">已赞</font><?php }else{ ?>赞<?php }?></a>
                                <?php }else{ ?>
                                <i class="icon-thumbs-up" style="margin-top:15px"></i><a href="javascript:void(0)" class="please" title="赞">赞</a>
                                <?php }?>
                                </li>
                                <li class="v_like">
                                <?php if ($_SESSION['user']){?>
                                <i class="icon-heart" style="margin-top:15px"></i><a class="btn-like" id="collect" vidnum="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" href="javascript:void(0)" title="收藏"><?php if ($_smarty_tpl->tpl_vars['collect']->value){?><font color="red">已收藏</font><?php }else{ ?>收藏<?php }?></a>
                                <?php }else{ ?>
                                <i class="icon-heart" style="margin-top:15px"></i><a class="please" href="javascript:;" title="收藏">收藏</a>
                                <?php }?>
                                </li>
                            </ul>
                        </div>
                        <div style='float:left;height:50px;width:200px;'>
                            <a target='blank' href='__APP__/Question/add'>有问题了？去提问吧、</a>
                        </div>
                        <div class="col-md-4 pull-right">
                            <div class="ratingWrap">
                                <span class="play_num inlineblock">　　　　　　　<?php echo $_smarty_tpl->tpl_vars['vo']->value['clicknum'];?>
 次播放</span>
                            </div>
                        </div>
                    </div>
                </div>

                
                <div class="col-md-8">

                    
                    <div class="m_show_guess slide_biquu m_cover_list mb30 feature_pay_list oh">
                        <div class="tt">
                            <h3>猜你还喜欢</h3>
                        </div>
                        <ul class="list_ib kandyLoop">  
                            
                        

                        <li id="out" onmouseover="doStop()" onmouseout="doMove()" class="tabbody" style="position: relative; overflow: hidden; height: 230px; width: 700px;">
                            <div id="in" class="tabroll" style="position: absolute; width: 1000000px;hieght:240px; left: 0px;">
                                <ul id="im1" style="display:block;width:1400px; float: left;">
                                
                                <?php  $_smarty_tpl->tpl_vars['li'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['li']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['like']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['li']->key => $_smarty_tpl->tpl_vars['li']->value){
$_smarty_tpl->tpl_vars['li']->_loop = true;
?>
                                
                                <li style="width:200px;">
                                    <div class="item_cover" style="width:200px;">
                                        <img alt="<?php echo $_smarty_tpl->tpl_vars['li']->value['videoname'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['li']->value['videoname'];?>
" style="width:200px" src="__PUBLIC__/Uploads/videopic/<?php echo $_smarty_tpl->tpl_vars['li']->value['picname'];?>
">
                                        <a class="m_cover_item_info" href="__URL__/play/id/<?php echo $_smarty_tpl->tpl_vars['li']->value['id'];?>
" title="点击播放" style="width:200px">
                                            <span class="play-item"><i class="icon-play"></i></span>
                                            <em>点击率 <?php echo $_smarty_tpl->tpl_vars['li']->value['clicknum'];?>
</em>
                                        </a>
                                    </div>
                                    <span class="title" style="width:200px"><a href="__URL__/detail/id/<?php echo $_smarty_tpl->tpl_vars['li']->value['id'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['li']->value['tid'];?>
"><?php echo $_smarty_tpl->tpl_vars['li']->value['videoname'];?>
</a></span>
                                    <a href="__URL__/detail/id/<?php echo $_smarty_tpl->tpl_vars['li']->value['id'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['li']->value['tid'];?>
" class="btn btn-primary btn-sm">查看详情</a>
                                </li>
                                <?php } ?>
                                </ul>

                                <ul id="im2" style="width:1400px;float:left;display:block"></ul>
                            
                            </div>
                        </li>
                        
                        
                    </ul>
                    </div>
                    <script type="text/javascript" charset="utf-8">
                        //猜你喜欢模块的视频滚动
                        var mytime = null;
                        //定义图片滚动的函数
                        function doMove(){
                            //获取图片显示框的盒子对象    
                            var out = document.getElementById("out");
                            out.scrollLeft += 4;
                            //当一次滚动完成以后下张图片到左侧边时马上设置滚动左边距为零 重新滚动
                            if (out.scrollLeft >= 1400) {
                                out.scrollLeft = 0;  
                            };
                            mytime = setTimeout(doMove,40);
                        }
                        //页面加载完后加载
                        window.onload = function(){
                            doMove();
                            //把im1中的所有图像赋值到im2中 
                            document.getElementById("im2").innerHTML = document.getElementById("im1").innerHTML;
                        }
                        //定义鼠标放上以后图片停止的函数
                        function doStop(){
                            clearTimeout(mytime);
                        }
                    </script>
                    
                    <div class="m_detail_reviews more mb30">
                        <div class="tt">
                            <h3>《<?php echo $_smarty_tpl->tpl_vars['vo']->value['videoname'];?>
》   的手记</h3>
                            <?php if ($_SESSION['user']){?>
                            <a href="__APP__/Note/add/vid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" class="btn btn-sm pull-right btn-primary btn-note-new" target="_blank"><i class="icon-pencil"></i> 写手记</a>
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
                        <li><a style="float:right" href="__APP__/Note/index/vid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
">全部(<?php echo $_smarty_tpl->tpl_vars['notenum']->value;?>
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

                
                <div class="col-md-4">

                    
                    <div class="m_detail_reviews s_reviews mb30">
                        <div class="tt pb10">
                            <h3 class="pt5">   短评</h3>
                            <?php if ($_SESSION['user']){?>
                            <a data-film-id="1106" data-toggle="modal-review" href="javascript:void(0)" class="btn btn-sm pull-right btn-info"><i class="icon-pencil"></i> 写短评</a>
                            <?php }else{ ?>
                            <a href="javascript:void(0)" class="btn btn-sm pull-right btn-info please"><i class="icon-pencil"></i> 写短评</a> 
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
" target="_blank"><?php echo $_smarty_tpl->tpl_vars['com']->value['username'];?>
</a> <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['com']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                                    </div>
                                    <p>
                                       
                                        <?php echo $_smarty_tpl->tpl_vars['com']->value['content'];?>

                                        
                                    </p>
                                </div>
                            </li>
                            <?php } ?>
                            <?php }else{ ?>
                            <li>快来抢第一个沙发~</li>
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

<!--添加视频短评的弹框-->
<div id="short-review-modal" tabindex="2" style="display: none;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        str += "<a href='__APP__/Users/otheredu/uid/"+data.uid+"'><img alt='"+data.username+"' title='"+data.username+"' src='__PUBLIC__/Uploads/users/"+data.username+"/s_"+data.picture+"' class='avatar_md'></a>";
                        str += "<a href='__APP__/Users/otheredu/uid/"+data.uid+"' target=\"_blank\">"+data.username+"</a> "+data.addtime+"</div>";
                        str += "<p>"+data.content+"</p></div>";
                        str += "</li>";
                        $("textarea[name='content']").val("");//清空文本框中的内容
                        $("span[class='charsLeft go_green']").html(140);
                        $("button").css("disabled","disabled");
                        $("#short-review-modal").hide();
                        $("#comment").prepend(str);//把评论内容追加到ul的第一个节点
                        //window.location.reload();
                        
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

        <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

    
</body></html>

<?php }} ?>