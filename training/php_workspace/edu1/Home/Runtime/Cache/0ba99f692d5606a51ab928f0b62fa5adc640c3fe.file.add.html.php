<?php /* Smarty version Smarty-3.1.6, created on 2019-05-13 10:55:27
         compiled from "./Home/Tpl\Note\add.html" */ ?>
<?php /*%%SmartyHeaderCode:408163735cd8dc9fa5b780-56720675%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0ba99f692d5606a51ab928f0b62fa5adc640c3fe' => 
    array (
      0 => './Home/Tpl\\Note\\add.html',
      1 => 1393335694,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '408163735cd8dc9fa5b780-56720675',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'videoname' => 0,
    'vid' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5cd8dc9fb0373',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cd8dc9fb0373')) {function content_5cd8dc9fb0373($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>添加视频教学笔记</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        
        <script type="text/javascript" src="__PUBLIC__/js/jquery-1.10.2.min.js"></script>
        
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
                <li class="btn-upload-w active"><a href="javascript:;" class="btn btn-default btn-upload"><i class="icon-upload-alt"></i>添加手记</a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <ul class="navbar-left">
                <li><a href="__URL__/index/uid/<?php echo $_SESSION['user']['id'];?>
"><i class="icon-list"></i> 我的手记</a></li>
                <li>
                <a href="__URL__/index/collid/<?php echo $_SESSION['user']['id'];?>
"><i class="icon-list"></i> 我收藏的</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript" charset="utf-8">
    $(function(){
        
        //添加手记表单的焦点事件
        $(".form-control").focus(function(){
            $(this).next("span").remove();
            doFocusInfo(this);
        }).blur(function(){				//移除当前input后多余的span节点
			$(this).next("span").remove();
			//执行验证
			doCheck(this);
		});
        
    });

    //失去焦点的验证提醒
    function doCheck(ob){
        switch($(ob).attr("name")){
            case "title":
                if($(ob).val().length==0){
                    $(ob).after('<span style="color:red">怎么不填手记名呢？</span>');
                    return false;
                }else if(!$(ob).val().trim()){
                    $(ob).after('<span style="color:red">格式不正确...</span>');
                    return false;
                }else{
                    $(ob).after('<span style="color:green"> OK</span>');
                    return true;
				}
				break;
            case "content":
                if($(ob).val().length==0){
                    $(ob).after('<span style="color:red">多少写点自己的心得啦！</span>');
                    return false;
				}else if(!$(ob).val().trim()){
                    $(ob).after('<span style="color:red">格式不正确...</span>');
                    return false;
                }else{
                    $(ob).after('<span style="color:green"> OK</span>');
                    return true;
				}
                break;
        }
        return false;
    }   
    //获取焦点提醒的函数
    function doFocusInfo(ob){
        switch($(ob).attr("name")){
            case "title":
                $(ob).after('<span style="color:blue">想一个高大上的标题</span>');
                break;
            case "content":
                $(ob).after('<span style="color:blue">记录下自己的心得、</span>');
                break;
        }
    }
    //表单提交的验证函数
    function doChec(){
        if(!$("input[name='title'],textarea[name='content']").val()){return false};
        if (!$("input[name='title']").val() || !$("input[name='title']").val().trim()) {
            $("input[name='title']").next("span").remove();
            $("input[name='title']").after('<span style="color:red">给手记起个名呗~</span>');
            return false;
        }
        
        if (!$("textarea[name='content']").val() || !$("textarea[name='content']").val().trim()) {
            $("textarea[name='content']").next("span").remove();
            $("textarea[name='content']").after('<span style="color:red">多少写点自己的心得啦！</span>');
            return false;
        }
        return true;
    }   
</script>

<div id="main">
    <div class="container">
        <div class="home_module m_movie">
            <div class="container">
                <!-- 左侧 -->
                <div class="col-md-8">

                    <div class="tt mb10 col-sm-offset-2">
                        <h3>创建《<?php echo $_smarty_tpl->tpl_vars['videoname']->value;?>
》的手记</h3>
                    </div>

                    <form id="post-form" class="form-horizontal" action="__URL__/insert" role="form" onsubmit="return doChec()"method="POST">
                        <input type="hidden" name="vid" value="<?php echo $_smarty_tpl->tpl_vars['vid']->value;?>
">
                        <input type="hidden" name="uid" value="<?php echo $_SESSION['user']['id'];?>
">
                        <div class="form-group">
                            <label class="col-lg-2 control-label">标题</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control" name="title">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-2 control-label">
                                内容
                            </label>
                            <div class="col-lg-9">
                                <textarea id="content-val" class="form-control" rows="18" name="content"></textarea>
                                <span class="Validform_checktip"></span>
                            </div>
                            
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-9 tr">
                                <a href="javascript:window.history.back()" class="btn btn-default pull-left"><i class="icon-angle-left"></i> 取消</a>
                                <button type="submit" class="btn btn-primary"><i class="icon-ok"></i> 好了，提交</button>
                            </div>
                        </div>
                    </form>

                </div>

                <!-- 右侧 -->
                <div class="col-md-4">

                    <div class="biquu_d_placeholder mt50 mb40">
                        <a href=""><img alt="E-Sch教学网" title="E-Sch教学网" src="__PUBLIC__/images/0000dh.jpg"></a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

        
    <?php echo $_smarty_tpl->getSubTemplate ("../Public/foot.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
   
    
</body></html>
<?php }} ?>