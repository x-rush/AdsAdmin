<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 13:10:26
         compiled from "./Home/Tpl\Library\detail.html" */ ?>
<?php /*%%SmartyHeaderCode:17445744195cd8fc42346848-39095458%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '12ad97b8676788da21bb179b05b3c3dbfeb2a841' => 
    array (
      0 => './Home/Tpl\\Library\\detail.html',
      1 => 1414747884,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17445744195cd8fc42346848-39095458',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'com' => 0,
    'vo' => 0,
    'collect' => 0,
    'iszan' => 0,
    'type' => 0,
    'collnum' => 0,
    'list' => 0,
    'li' => 0,
    'comTotal' => 0,
    'comPage' => 0,
    'tuilist' => 0,
    'tui' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8fc4271b0a',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8fc4271b0a')) {function content_5cd8fc4271b0a($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'E:\\PHP\\wamp64\\www\\edu1\\ThinkPHP\\Extend\\Vendor\\Smarty\\plugins\\modifier.date_format.php';
?><!DOCTYPE html>
<html>
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
        
        <!--引入FlexPaper相关的js-->
        <script type="text/javascript" src="__PUBLIC__/FlexPaper/js/flexpaper_flash.js"></script>
        <script type="text/javascript" src="__PUBLIC__/FlexPaper/js/flexpaper_flash_debug.js"></script>
       
        <style>
            /**弹出层效果**/
            .raceShow{background:url("__PUBLIC__/images/103923O21-2.gif");z-index:10000;border:solid 1px #ccc;position:absolute;display:none;width:300px;height:100px;padding:30px;font-size:16px;color:red;text-align:center;}
        </style>
        <script type="text/javascript" charset="utf-8">
            $(function(){
                    
                //资源被赞的方法
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
                                $("#favonum").html(parseInt($("#favonum").html())+1);
                            }else{
                                $("#favo").html("赞").css("color","#777777");
                                $("#favonum").html($("#favonum").html()-1);
                            }
                        },
                        error:function(){<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['com']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>

                            alert("ajax请求失败！");
                        }
                    });
                });
                //资源的收藏Ajax请求
                $("#collect").click(function(){
                    var lidnum = $(this).attr("lidnum");//获取被收藏的资源id
                    $.ajax({
                        url:"__URL__/collect",
                        type:"post",
                        async:true,
                        data:"id="+lidnum,
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
                    var lid = $("input[name='lid']").val();
                    var content = $("textarea[name='content']").val();
                    //alert(content);
                    if (!content.trim()) {
                        $("textarea[name='content']").next("span").empty();
                        $("textarea[name='content']").after("<span><font color='red'>内容为空哟、</font></span>");
                        return;
                    }else{
                        $("textarea[name='content']").next("span").empty();
                        $.ajax({
                            url:"__APP__/Libcom/addComment",
                            type:"post",
                            async:true,
                            data:{"uid":uid,"lid":lid,"content":content},
                            dataType:"json",
                            success:function(data){
                                //alert(data.content);
                                var str = "<li>";
                                str += "<div class='c999 m_n_item_info f12'>";
                                str += "<a href='__APP__/Users/otheredu/uid/"+data.uid+"'><img alt='"+data.username+"' title='"+data.username+"' src='__PUBLIC__/Uploads/users/"+data.username+"/s_"+data.picture+"' class='avatar_md'></a>";
                                str += "<a href='__APP__/Users/otheredu/uid/"+data.uid+"'>"+data.username+"</a> <i style=\"float:right;margin-right:20px;margin-top:6px\">"+data.addtime+"</i></div>";
                                str += "<div class=\"ml10 mr10 pb10\">"+data.content+"</div>";
                                str += "</li>";
                                $("textarea[name='content']").val("");//清空文本框中的内容
                                $(".null").css("display","none");//让之前的空评论框隐藏
                                $("#comment").prepend(str);//把评论内容追加到ul的第一个节点
                                //window.location.reload();
                                
                            },
                            error:function(){
                                alert("ajax请求失败！");
                            }
                        });
                    } 
                });
                //弹出层
                var speed = 500;//动画速度
                $("a.please").click(function(event){//绑定事件处理
                    event.stopPropagation();
                    //var offset = $(event.target).offset();//取消事件冒泡
		            $("#racePop").css({ top:event.pageY-80 + "px", left: "500px" });//设置弹出层位置
                    $("#racePop").slideDown(speed);//动画显示
                    });
                $("#racePop").click(function(event) { $("#racePop").fadeOut(speed) });//单击弹出层则自身隐藏
                $(document).click(function(event) { $("#racePop").fadeOut(speed) });//单击空白区域隐藏    
            });
        </script>
        
    </head>
    <body>
    <div id="browser"></div>
 
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/head.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
    
    
<div id="sub-header" class="group_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="">资源库</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li class="active"><a href="__URL__/index">资源浏览</a></li>
                <li>
                <?php if ($_SESSION['user']){?>
                <a href="__URL__/add">添加资源</a>
                <?php }else{ ?>
                <a href="javascript:;" class="please">添加资源</a>
                <?php }?>
                </li>
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



        
<div id="main">
    <div class="container">
        <div class="home_module m_movie row">
            <div class="container">
                <!-- 左侧 -->
                <div class="col-md-8">

                    
                    <div class="review_content">
                        <div class="c999 m_n_item_info">
                            <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
"><img alt="<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
/s_<?php echo $_smarty_tpl->tpl_vars['vo']->value['picture'];?>
" class="avatar_md"></a>
                            <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['username'];?>
</a> 于<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['vo']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
 上传于资源类 <a href="__APP__/Library/index/pid/<?php echo $_smarty_tpl->tpl_vars['vo']->value['tid'];?>
"><?php echo $_smarty_tpl->tpl_vars['vo']->value['typename'];?>
</a> 
                            <?php if ($_SESSION['user']){?>
                            <a style="float:right;margin-right:8px;margin-top:15px" class="btn-like" id="collect" lidnum="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" href="javascript:void(0)" title="收藏"><?php if ($_smarty_tpl->tpl_vars['collect']->value){?><font color="red">已收藏</font><?php }else{ ?>收藏<?php }?></a><i class="icon-heart" style="margin-top:15px;float:right;margin-right:8px"></i>
                            <a style="float:right;margin-top:9px;margin-right:20px;color:#777777" href="javascript:void(0)" id="favo" idnum="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
" title="赞"><?php if ($_smarty_tpl->tpl_vars['iszan']->value){?><font color="red">已赞</font><?php }else{ ?>赞<?php }?></a><i class="icon-thumbs-up" style="margin-top:15px;float:right;margin-right:8px"></i>
                            <?php }else{ ?>
                            <a style="float:right;margin-right:8px;margin-top:6px" class="btn-like please" href="javascript:void(0)" title="收藏">收藏</a><i class="icon-heart" style="margin-top:7px;float:right;margin-right:8px"></i>
                            <a style="float:right;margin-right:20px;color:#777777" href="javascript:void(0)" title="赞" class="please">赞</a><i class="icon-thumbs-up" style="margin-top:7px;float:right;margin-right:8px"></i>
                            <?php }?>
                        </div>
                        <div class="review_content_p">
                            资源名：<b><?php echo $_smarty_tpl->tpl_vars['vo']->value['title'];?>
</b>&nbsp;&nbsp;&nbsp;&nbsp;资源类型：<b><?php echo $_smarty_tpl->tpl_vars['type']->value;?>
</b>&nbsp;&nbsp;&nbsp;&nbsp;资源大小：<b><?php echo sprintf("%.2f",($_smarty_tpl->tpl_vars['vo']->value['size']/1024));?>
kb</b>&nbsp;&nbsp;&nbsp;&nbsp;
                            <?php if ($_SESSION['user']){?>
                            <a href="__URL__/dwload/id/<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
">点击下载</a>
                            <?php }else{ ?>
                            <a href="javascript:;" class="please">点击下载</a>
                            <?php }?>
                        </div>
                        <div class="review_content_p" style="margin-top:10px;">
                            <a id="viewerPlaceHolder" swfname="<?php echo $_smarty_tpl->tpl_vars['vo']->value['swfname'];?>
" style="width:560px;height:580px;display:block;"></a> 
                            <script type="text/javascript">
                                //===================================================
                                //在线预览文档的js代码
                                var swfname = $("#viewerPlaceHolder").attr("swfname");
                                var fp = new FlexPaperViewer(    
                                     '__PUBLIC__/FlexPaper/swf/FlexPaperViewer', 
                                     'viewerPlaceHolder',     //对应于a 标签的id
                                     { config : {
                                     SwfFile : escape('__PUBLIC__/Uploads/library_swf/'+swfname), //这句是关键: SwfFile: 指示导入的.swf的路径
                                     Scale : 0.6, 
                                     ZoomTransition : 'easeOut',
                                     ZoomTime : 0.5,
                                     ZoomInterval : 0.4,
                                     FitPageOnLoad : true,
                                     FitWidthOnLoad : true,
                                     PrintEnabled : true,
                                     FullScreenAsMaxWindow : false,
                                     ProgressiveLoading : false,
                                     MinZoomSize : 0.5,
                                     MaxZoomSize : 2,
                                     SearchMatchAll : true,
                                     InitViewMode : 'Portrait',
                                     
                                     ViewModeToolsVisible : true,
                                     ZoomToolsVisible : true,
                                     NavToolsVisible : true,
                                     CursorToolsVisible : true,
                                     SearchToolsVisible : true,
                                     localeChain: 'en_US'
                                }});
                                //===================================================
                            </script>
                            
                        </div>
                        <div class="f12 c999 pt30 review_act tr">
                             <i class="icon-heart"></i> <em id="favonum"><?php echo $_smarty_tpl->tpl_vars['vo']->value['favonum'];?>
</em>人赞 | <i class="icon-heart"></i> <em id="collnum"><?php echo $_smarty_tpl->tpl_vars['collnum']->value;?>
</em>人收藏 | <i class="icon-heart"></i> <em id="dwloadnum"><?php echo $_smarty_tpl->tpl_vars['vo']->value['dwloadnum'];?>
</em>人下载
                        </div>

                        <!-- 回复 -->
                        <div id="r_comment" class="review_reply">
                            <!--查询评论表中响应资源的评论信息 展示评论 得做判断-->
                            <i>评论列表</i>
                            
                            <ul class="list_p120" id="comment">
                                <?php if ($_smarty_tpl->tpl_vars['list']->value){?>
                                    <?php  $_smarty_tpl->tpl_vars['li'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['li']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['li']->key => $_smarty_tpl->tpl_vars['li']->value){
$_smarty_tpl->tpl_vars['li']->_loop = true;
?>
                                        
                                        <li>
                                            <div class="c999 m_n_item_info f12">
                                                <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['li']->value['uid'];?>
"><img alt="<?php echo $_smarty_tpl->tpl_vars['li']->value['username'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['li']->value['username'];?>
" src="__PUBLIC__/Uploads/users/<?php echo $_smarty_tpl->tpl_vars['li']->value['username'];?>
/s_<?php echo $_smarty_tpl->tpl_vars['li']->value['picture'];?>
" class="avatar_md"></a>
                                                <a href="__APP__/Users/otheredu/uid/<?php echo $_smarty_tpl->tpl_vars['li']->value['uid'];?>
"><?php echo $_smarty_tpl->tpl_vars['li']->value['username'];?>
</a> <i style="float:right;margin-right:20px;margin-top:6px"><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['li']->value['addtime'],"%Y-%m-%d %H:%M:%S");?>
</i>                                            </div>
                                            <div class="ml10 mr10 pb10">
                                                <?php echo $_smarty_tpl->tpl_vars['li']->value['content'];?>

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
                            

                            <form id="reply_form" class="form-horizontal mt40 mb30" action="" method="POST">
                                
                                <div class="form-item mt10">
                                    <!--隐藏域中的用户id需要随后修改-->
                                    <input type="hidden" name="uid" value="<?php echo $_SESSION['user']['id'];?>
">
                                    <input type="hidden" name="lid" value="<?php echo $_smarty_tpl->tpl_vars['vo']->value['id'];?>
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

                <div class="col-md-4">

                    
                    <div class="biquu_d_placeholder mt50 mb40">
                        <a href=""><img alt="教学网" title="教学网" src="__PUBLIC__/images/0000dh.jpg"></a>
                    </div>
                    
                    <div class="m_pay_list">
                        <div class="tt">
                            <h3>您可能还喜欢</h3>
                        </div>
                        <ol>
                            <?php  $_smarty_tpl->tpl_vars['tui'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['tui']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['tuilist']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['tui']->key => $_smarty_tpl->tpl_vars['tui']->value){
$_smarty_tpl->tpl_vars['tui']->_loop = true;
?>
                            <li><span>荐</span><a href="__URL__/detail/id/<?php echo $_smarty_tpl->tpl_vars['tui']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['tui']->value['title'];?>
</a></li>
                            <?php } ?>
                        </ol>
                    </div>
                </div>

                </div>
            </div>
        </div>
    </div>
</div>


       <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

    
</body></html>
<?php }} ?>