<?php /* Smarty version Smarty-3.1.6, created on 2019-05-24 17:23:06
         compiled from "./Home/Tpl\Users\avatar.html" */ ?>
<?php /*%%SmartyHeaderCode:12615164285ce7b7fae80e88-96529179%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a36cd45b996f2ed268022c65d6bb1c55cab42460' => 
    array (
      0 => './Home/Tpl\\Users\\avatar.html',
      1 => 1393439744,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12615164285ce7b7fae80e88-96529179',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_5ce7b7faef618',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ce7b7faef618')) {function content_5ce7b7faef618($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="stylesheet" href="__PUBLIC__/jcrop_zh/css/common.css" type="text/css" />
		<link rel="stylesheet" href="__PUBLIC__/jcrop_zh/css/jquery.Jcrop.css" type="text/css" />
		<script type="text/javascript" src="__PUBLIC__/jcrop_zh/js/jquery-1.3.2-min.js"></script>
		<script type="text/javascript" src="__PUBLIC__/jcrop_zh/js/jquery.Jcrop.js"></script>

 




        <link rel="icon" type="image/x-icon" href="__PUBLIC__/images/favicon.png">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/typo.css">
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/simple.css">
        <style type="text/css">
        /*ipad fix*/
        @media (min-width:992px){
            .home_module .m_cover_list li:nth-last-child(-n+3) {
                display: none;
            }
            .col-md-4{
                /*display: none;*/
            }
        }
        @media (min-width:1200px){
            .home_module .m_cover_list li:nth-last-child(-n+3) {
                *display: inline;
                display: inline-block;
                zoom:1;
            }
        }

        .content_list{
            overflow: hidden;
        }
        .content_list li img{
            height: 140px;
            width: 100px;
        }
        .content_list li{
            float: left;
            width: 100px;
            text-align: center;
            margin-right: 19px;
            margin-bottom: 20px;
        }
        .c_rating i{
            font-style: normal;
            font-size: 12px;
            vertical-align: top;
            line-height: 18px;
            /*padding-left: 10px;*/
            color: #d7b120;
        }
        .content_load{
            display: none;
            text-align: center;
        }
        .ml10{
            margin-left:100px;
        }
        </style>
        
        
      
       
        
    </head>
    <body>
    <div id="browser"></div>
 
        <div id="header">
            <div class="navbar navbar-default" role="navigation">
                <div class="container">
                    
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">????????????</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="__APP__/Index/index">E-Sch</a>
                    </div>

                    <div class="collapse navbar-collapse navbar-ex1-collapse">

                        <ul class="nav navbar-nav g_nav">

                            <li><a href="__APP__/Video/index" class="animated">?????????</a></li>
                            <li><a href="__APP__/Note/index" class="animated">??????</a></li>
                            <li><a href="__APP__/Library/index" class="animated">?????????</a></li>
                            <li><a href="__APP__/Message/index" class="animated">??????</a></li>
                            <li><a href="__APP__/Test/index" class="animated">??????</a></li>
                        </ul>

                        <form class="navbar-form navbar-right" role="search" action="" method="GET" autocompelte="off">
                            <div class="form-group">
                                <input type="text" name="q" class="form-control" placeholder="??????">
                            </div>
                            <button type="submit" class="btn btn-default"><i class="icon-search"></i></button>
                        </form>

                         <ul class="nav navbar-nav navbar-right">
                            

                            <li><a href="">??????(0)</a></li>
                            <li class="navbar-nav-user">
                                <a class="user-avatar" href="__APP__/Users/myedu">
                                    <img alt="<?php echo $_SESSION['user']['username'];?>
" title="<?php echo $_SESSION['user']['username'];?>
" <?php if ($_SESSION['user']['picture']=='1.jpg'){?>src="__PUBLIC__/Uploads/users/0/0.jpg"<?php }else{ ?>src="__PUBLIC__/Uploads/users/<?php echo $_SESSION['user']['username'];?>
/s_<?php echo $_SESSION['user']['picture'];?>
"<?php }?> class="avatar_sm">???<?php echo $_SESSION['user']['username'];?>
</a>
                                    <span><?php echo $_SESSION['user']['username'];?>
</span>
                                </a>
                                <div class="dropdown">
                                    <a href="__APP__/Users/account"><i class="icon-user"></i> ??????</a>
                                    <a href="__APP__/Users/settings"><i class="icon-wrench"></i> ??????</a>
                                    <a href="__APP__/Users/loginout"><i class="icon-signout"></i> ??????</a>
                                </div>
                            </li>

                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>

       
<div id="sub-header" class="settings_h">
    <div class="container">
        <div class="navbar-header col-sm-offset-1">
            <h1><a href="__APP__/Users/settings">??????</a></h1>
        </div>
        <div class="col-md-6">
            <ul class="navbar-left">
                <li><a href="__APP__/Users/settings">??????????????????</a></li>
                <li><a href="__APP__/Users/settings/password">????????????</a></li>
                
                
            </ul>
        </div>
    </div>
</div>



        
<div id="main">
    <div class="container">
        <div class="home_module">
            <div class="container">
                
                <div class="col-md-7">
                    
                    <div class="tt">
                        <a href="__APP__/Users/settings">??????</a>
                        <h3>????????????</h3>
                    </div>
                    <hr>

			<iframe name="myframe" style="display:none" border="0" ></iframe>
                    

                    <form enctype="multipart/form-data" target="myframe" method="POST" action="__APP__/Users/uploadpic" class="pt30" id="avatar_form">
                        <input type="hidden" name='picfile' value="<?php echo $_SESSION['user']['username'];?>
">
                        <div class="user_avatar_upload clearfix pb30">



                                <div class="pull-left" id="did">
                                    <img alt="<?php echo $_SESSION['user']['username'];?>
" title="<?php echo $_SESSION['user']['username'];?>
" src="<?php if ($_SESSION['user']['picture']=='1.jpg'){?>__PUBLIC__/uploads/users/0/1.jpg<?php }else{ ?>__PUBLIC__/uploads/users/<?php echo $_SESSION['user']['username'];?>
/<?php echo $_SESSION['user']['picture'];?>
<?php }?>" id="target" class="avatar_bg">
                                </div>
                                <div class="t_ml_190">
                                    ???????????????????????????????????????
                                    <p class="c999 f12 pt10 pb10">
                                        ???????????????JPG???JPEG???GIF???PNG???BMP????????? 
                                        </p>









                                    <input type="file" accept="image/jpg, image/jpeg, image/gif, image/png, image/bmp" name="uploadImg" id="uploadImg">
                                    <div class="pt20">
                                        <button class="btn btn-default" id="-&quot;avatar_submit&quot;" type="submit">????????????</button>
                                    </div>






                                </div>
                            </div>
                        </form>

                    

                </div>
                
                <div class="col-md-4 col-sm-offset-1">
                    <p class="c999 f12 mt50">
                        ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
                        <br><br>
                        ????????????????????????????????????????????????????????????????????????????????????????????????????????????
                        <br><br>
                        ??????????????????????????????????????????????????????????????????????????????
                    </p>
                </div>
            </div>
        </div>
    </div>
	<button style="float:left;margin-top:-590px;margin-left:270px;" class="btn btn-default mt10" onclick="doJcrop()">????????????</button>

	<form action="__APP__/Users/update" method="post">
		<input type="hidden" value="" name="picture" id="picid">
		<input type="hidden" value="<?php echo $_SESSION['user']['id'];?>
" name="id">
		<input style="float:left;margin-top:-290px;margin-left:50px;" type="submit" value="??????????????????" class="btn btn-default mt10">
	</form>
</div>
	
						
        <a id="goTop" href="javascript:void(0)" title="????????????"><i class="icon-angle-up"></i></a>
        <div id="footer">
            <div class="container">
                <div class="col-md-7">
                    <a href="">????????????</a>
                    <a href="">????????????</a>
                    <a href="">????????????</a>
                    <a href="">????????????</a>
                    <a href="">????????????</a>
                </div>

                <div class="col-md-5">
                    ?? 2013 Biquu.com. all rights reserved. ???????????????11010802012355???
                </div>
            </div>
        </div>

        <div class="modal fade" id="sys-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">??</button>
                    </div>
                    <div class="modal-body"></div>
                </div>
            </div>
        </div>
    
	
	
<script type="text/javascript">
    $(function($) {

        $('#avatar_form').submit(function(){
            if(!$('#uploadImg').val()){
                alert('????????????????????????')
                return false;
            }
        })

        
})
</script>
</body></html>

 <script type="text/javascript">
           
			var pic=null;
			var x=0,y=0,w=0,h=0;
			function showpic(picname){
				//alert('???????????????????????????'+picname);
				pic=picname;
				
				$("#picid").val(pic);
				
				$("#did").empty();
                $('<img width="140" src="__PUBLIC__/Uploads/users/<?php echo $_SESSION['user']['username'];?>
/'+picname+'?id='+Math.random()+'"/>')
				.appendTo('#did')
				.Jcrop({
						onChange:showCoords,
						onSelect:showCoords,
						aspectRatio: 1, //?????????

					});
				
			}
			
			
			//???????????????????????????????????????onChange,onSelect????????????????????????Jcrop??????
			function showCoords(obj){
				x=obj.x; //????????????x
				y=obj.y; //????????????y
				w=obj.w; //??????
				h=obj.w; //??????
			}
			
			//????????????
			function doJcrop(){
				//alert(pic+"="+x+":"+y+","+w+":"+h);
				//??????ajax??????
				$.ajax({
					url:'__APP__/Users/doJcrop',
					type:'post',
					data:{'pic':pic,'x':x,'y':y,'w':w,'h':h},
					dataType:'text',
					success:function(res){
						//alert(res);
						if(res=='ok'){
							showpic(pic);
						}
					},
				});
			}
		</script>
<?php }} ?>