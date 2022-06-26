<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 13:07:46
         compiled from "./Home/Tpl\Note\detail.html" */ ?>
<?php /*%%SmartyHeaderCode:9360697685cd8fba2ac7e83-68380392%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '18f0c8e31761dffe8ba639e07514e71f779e9f3c' => 
    array (
      0 => './Home/Tpl\\Note\\detail.html',
      1 => 1393423902,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '9360697685cd8fba2ac7e83-68380392',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vo' => 0,
    'username' => 0,
    'picture' => 0,
    'tid' => 0,
    'videoname' => 0,
    'collect' => 0,
    'iszan' => 0,
    'zannum' => 0,
    'collnum' => 0,
    'comment' => 0,
    'com' => 0,
    'comTotal' => 0,
    'comPage' => 0,
    'picname' => 0,
    'typename' => 0,
    'clicknum' => 0,
    'list' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8fba2bfc85',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8fba2bfc85')) {function content_5cd8fba2bfc85($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html>
<html lang="en">
    <head>
        <title> 手记详情页</title>
        
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
            .newlist li a:hover{
                color:blue;
                font-size:130%;
                text-decoration:none;
            }
            /**弹出层效果**/
            .raceShow{background:url("__PUBLIC__/images/103923O21-2.gif");z-index:10000;border:solid 1px #ccc;position:absolute;display:none;width:300px;height:100px;padding:30px;font-size:16px;color:red;text-align:center;}
        </style>
 
        <script type="text/javascript" charset="utf-8">
            $(function(){
                
                //弹出层
                var speed = 500;//动画速度
                $(".please").click(function(event){//绑定事件处理
                    event.stopPropagation();
                    //var offset = $(event.target).offset();//取消事件冒泡
		            $("#racePop").css({ top:event.pageY + "px", left: event.pageX-"300" + "px" });//设置弹出层位置
                    $("#racePop").slideDown(speed);//动画显示
                    });
                $("#racePop").click(function(event) { $("#racePop").fadeOut(speed) });//单击弹出层则自身隐藏
                $(document).click(function(event) { $("#racePop").fadeOut(speed) });//单击空白区域隐藏

                //手记被赞的方法
                $("#favo").click(function(){
                    var nidnum = $(this).attr("nidnum");
                    //alert(idnum);
                    $.ajax({
                        url:"__URL__/favo",
                        type:"post",
                        async:true,
                        data:"id="+nidnum,
                        dataType:"text",
                        success:function(data){
                            //alert(data);
                            if (data == "yes") {
                                $("#favo").html("已赞").css("color","red");
                                $("#favonum").html(parseInt($("#favonum").html())+1);
                            }else{
                                $("#favo").html("赞").css("color","#777777");
                                $("#favonum").html($("#favonum").html()-1);
                            }
                        },
                        error:function(){
                            alert("ajax请求失败！");
                        }
                    });
                });
                //手记的收藏Ajax请求
                $("#collect").click(function(){
                    var nidnum = $(this).attr("nidnum");//获取被收藏的资源id
                    $.ajax({
                        url:"__URL__/collect",
                        type:"post",
                        async:true,
                        data:"id="+nidnum,
                        dataType:"text",
                        success:function(data){
                            if (data == "yes") {
                                $("#collect").html("已收藏").css("color","red");
                                $("#collnum").html(parseInt($("#collnum").html())+1);
                            }else{
                                $("#collect").html("收藏").css("color","#777777");
                                $("#collnum").html($("#collnum").html()-1);
                            }
                        },
                        error:function(){
                            alert("ajax请求失败！");
                        }
                    });
                });
                
                //添加评论的Ajax方法
                $("button").click(function(){
                    var uid = $("input[name='uid']").val();
                    var nid = $("input[name='nid']").val();
                    var content = $("textarea[name='content']").val();
                    //alert(content);
                    if (!content.trim()) {
                        $("textarea[name='content']").next("span").empty();
                        $("textarea[name='content']").after("<span><font color='red'>内容为空哟、</font></span>");
                        return;
                    }else{
                        $("textarea[name='content']").next("span").empty();
                        $.ajax({
                            url:"__APP__/Notecom/addComment",
                            type:"post",
                            async:true,
                            data:{"uid":uid,"nid":nid,"content":content},
                            dataType:"json",
                            success:function(data){
                                //alert(data.content);
                                var str = "<li>";
                                str += "<div class='c999 m_n_item_info f12'>";
                                str += "<a href='__APP__/Users/otheredu/uid/"+data.uid+"'><img alt='"+data.username+"' title='"+data.username+"' src='__PUBLIC__/Uploads/users/"+data.username+"/s_"+data.picture+"' class='avatar_md'></a>";
                                str += "<a href='__APP__/Users/otheredu/uid/"+data.uid+"'>"+data.username+"</a> <i style=\"float:right;margin-right:20px;\">"+data.addtime+"</i></div>";
                                str += "<div class=\"ml10 mr10 pb10\">"+data.content+"</div>";
                                str += "</li>";
                                $("textarea[name='content']").val("");//清空文本框中的内容
                                $(".null").css("display","none");//让之前的空评论框隐藏
                                $("#comment").prepend(str);//把评论内容追加到ul的第一个节点
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
                                       
    </head>
    <body>
    <div id="browser"></div>
 
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

        
<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="">手记</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li><a href="__URL__/index">手记列表</a></li>
                <li class="active"><a>手记详情</a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <ul class="navbar-left">
                <li><?php if ($_SESSION['user']){?>
                <a href="__URL__/index/uid/<?php echo $_SESSION['user']['id'];?>
"><i class="icon-list"></i> 我的手记</a>
                <?php }else{ ?>
                <a href="javascript:;" class="please"><i class="icon-list"></i> 我的手记</a>
                <?php }?></li>
                <li><?php if ($_SESSION['user']){?>
                <a href="__URL__/index/collid/<?php echo $_SESSION['user']['id'];?>
"><i class="icon-list"></i> 我收藏的</a>
                <?php }else{ ?>
                <a href="javascript:;" class="please"><i class="icon-list"></i> 我收藏的</a>
                <?php }?></li>
            </ul>
        </div>
        <div id="racePop" class="raceShow"><b>请先登录！点击此处取消...</b></div>
    </div>
</div>



        
<div id="main">
    <div class="container">
        <div class="home_module row">
            <div class="container">
                
                <div class="col-md-8">

                    
                    
                    <!-- 手记内容 -->
                    <div class="tt" style="padding-left:28px">
                        <h3><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</h3>
                    </div>
                    
                    <div class="review_content">
                        <div class="c999 m_n_item_info">
                            <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
"><img alt="<?php echo $_smarty_tpl->tpl_vars['username']->value;?>
" title="<?php echo $_smarty_tpl->tpl_vars['username']->value;?>
" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['username']->value;?>
/s_<?php echo $_smarty_tpl->tpl_vars['picture']->value;?>
" class="avatar_md"></a>
                            创建者 <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
</a> 评论 <a href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vid'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['tid']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['videoname']->value;?>
</a>

                            <?php if ($_SESSION['user']){?>
                            <a style="float:right;margin-right:8px;margin-top:10px" class="btn-like" id="collect" nidnum="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" href="javascript:void(0)" title="收藏"><?php if ($_smarty_tpl->tpl_vars['collect']->value){?><font color="red">已收藏</font><?php }else{ ?>收藏<?php }?></a><i class="icon-heart" style="margin-top:10px;float:right;margin-right:8px"></i>
                            <a style="float:right;margin-top:4px;margin-right:20px;color:#777777" href="javascript:void(0)" id="favo" nidnum="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" title="赞"><?php if ($_smarty_tpl->tpl_vars['iszan']->value){?><font color="red">已赞</font><?php }else{ ?>赞<?php }?></a><i class="icon-thumbs-up" style="margin-top:10px;float:right;margin-right:8px"></i>
                            <?php }else{ ?>
                            <a style="float:right;margin-right:8px;margin-top:15px" class="btn-like please" href="javascript:void(0)" title="收藏">收藏</a><i class="icon-heart" style="margin-top:15px;float:right;margin-right:8px"></i>
                            <a style="float:right;margin-top:10px;margin-right:20px;color:#777777" href="javascript:void(0)" title="赞" class="please">赞</a><i class="icon-thumbs-up" style="margin-top:15px;float:right;margin-right:8px"></i>
                            <?php }?>
                        </div>
                        <div class="review_content_p" style="padding-left:28px">
                            <p><?php echo $_smarty_tpl->tpl_vars['vo']->value['content'];?>
</p>
                        </div>
                        <div class="f12 c999 pt30 review_act tr">于 <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
 创建</div>
                        <div class="f12 c999 pt30 review_act tr">
                            
                            <i class="icon-heart"></i> <em id="favonum"><?php echo $_smarty_tpl->tpl_vars['zannum']->value;?>
</em>人赞　 |　 <i class="icon-heart"></i> <em id="collnum"><?php echo $_smarty_tpl->tpl_vars['collnum']->value;?>
</em>人收藏
                        </div>

                        <!-- 回复 -->
                        <div id="r_comment" class="review_reply">
                            <i>评论列表</i>
                            <!--查询评论表中相应手记的评论信息 展示评论 得做判断-->
                            <ul class="list_p120" id="comment">
                                <?php if ($_smarty_tpl->tpl_vars['comment']->value){?>
                                    <?php  $_smarty_tpl->tpl_vars['com'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['com']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['comment']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['com']->key => $_smarty_tpl->tpl_vars['com']->value){
$_smarty_tpl->tpl_vars['com']->_loop = true;
?>
                                        
                                        <li>
                                            <div class="c999 m_n_item_info f12">
                                                <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['com']->value['uid'];?>
"><img alt="<?php echo $_smarty_tpl->tpl_vars['com']->value['username'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['com']->value['username'];?>
" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['com']->value['username'];?>
/s_<?php echo $_smarty_tpl->tpl_vars['com']->value['picture'];?>
" class="avatar_md"></a>
                                                <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['com']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['com']->value['username'];?>
</a> <i style="float:right;margin-right:20px;"><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['com']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</i>
                                            </div>
                                            <div class="ml10 mr10 pb10">
                                                <?php echo $_smarty_tpl->tpl_vars['com']->value['content'];?>

                                            </div> 
                                            
                                        </li>
                                        
                                    <?php } ?> 
                                <?php }else{ ?>
                                
                                <li class="null">
                                    还没人回应
                                </li>   
                            <?php }?>
                            </ul>
                            <?php if ($_smarty_tpl->tpl_vars['comTotal']->value>5){?>
                                <i style="float:right"><?php echo $_smarty_tpl->tpl_vars['comPage']->value;?>
</i>
                            <?php }?>
                            <form id="reply_form" class="form-horizontal mt40 mb30" action="" onsubmit="return doCheck()" method="POST">
                                <div class="form-item mt10">
                                    <input type="hidden" name="uid" value="<?php echo $_SESSION['user']['id'];?>
">
                                    <input type="hidden" name="nid" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
">
                                    <textarea class="form-control" rows="5" name="content"></textarea>
                                </div>
                            </form>
                                <div class="tr">
                                    <?php if ($_SESSION['user']){?>
                                    <button type="submit" class="btn btn-primary">提交</button>
                                    <?php }else{ ?>
                                    <font size='2'>登陆后即可回应</font> <button type="submit" disabled class="btn btn-primary please">提交</button>
                                    <?php }?>
                                </div>
                            
                            
                        </div>
                    </div>
                </div>

                <!-- 右侧 -->
                <div class="col-md-4">
                    <!-- 版权声明 -->
                    <div class="copyright alert">
                        本评论版权属于作者<?php echo $_smarty_tpl->tpl_vars['username']->value;?>
，并受法律保护。除非评论正文中另有声明，未经合法书面许可任何人不得转载或使用整体或任何部分的内容。
                    </div>

                    <!-- 视频信息 -->
                    <div class="m_d_info">
                        <h4 class="mb20"><a href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vid'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['tid']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['videoname']->value;?>
</a></h4>
                        <a href="__APP__/Video/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vid'];?>
/tid/<?php echo $_smarty_tpl->tpl_vars['tid']->value;?>
">
                            <img alt="<?php echo $_smarty_tpl->tpl_vars['videoname']->value;?>
" title="<?php echo $_smarty_tpl->tpl_vars['videoname']->value;?>
" src="__PUBLIC__/Uploads/videopic/<?php echo $_smarty_tpl->tpl_vars['picname']->value;?>
">
                        </a>
                        <div class="m_detail_info m0 pt10 mt10 f12">
                            <span>上传者：<?php echo $_smarty_tpl->tpl_vars['username']->value;?>
 </span>
                            <span>类别：<?php echo $_smarty_tpl->tpl_vars['typename']->value;?>
</span>
                            <span>点击率： <?php echo $_smarty_tpl->tpl_vars['clicknum']->value;?>
</span>

                            
                            <span class="mt10">
                                <a href="__APP__/Video/play/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vid'];?>
" class="btn btn-success btn-sm"><i class="icon-play"></i> 在线观看正片</a>
                            </span>
                            

                        </div>
                    </div>

                    <!-- 更多手记 -->
                    <div class="m_detail_reviews s_reviews mt30 pl20 pr20">
                        <div class="tt line16 mb10">
                            <h4 class="f14 p0">相关视频的手记</h4>
                            <a href="__URL__/index/vid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['vid'];?>
" class="more">全部</a>
                        </div>
                        <ul class="list_mb10">
                            <?php if ($_smarty_tpl->tpl_vars['list']->value){?>
                            <?php  $_smarty_tpl->tpl_vars['vo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['vo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['vo']->key => $_smarty_tpl->tpl_vars['vo']->value){
$_smarty_tpl->tpl_vars['vo']->_loop = true;
?>
                            <li>
                                <div class="c999 m_n_item_info m0 f12 bg_fff">
                                    <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
"><img alt="<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/s_<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
" class="avatar_md"></a>
                                    创作者 <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a> 
                                    <span class="allstar50"></span>
                                    <p class="m0"><a href="__APP__/Note/detail/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" class="f14"><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</a></p>
                                </div>
                            </li>
                            <?php } ?>
                            <?php }else{ ?>
                            <li>暂无~</li>
                            <?php }?>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

    <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

       
    
</body></html>

<?php }} ?>