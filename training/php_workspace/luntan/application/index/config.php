<?php
return [

	'template'=> [
    'view_path'    => './template/'.config('web.WEB_TPL').'/',
    'view_suffix' => 'html',
	'view_depr'    => '_',
    ],
		'view_replace_str'  =>  [
				'__ROOT__' => WEB_URL,
				'__INDEX__' => WEB_URL . '/index.php',
				'__HOME__' => WEB_URL . '/template/'.config('web.WEB_TPL').'/res',
				'__UPLOAD__' => '/uploads',
				'__PUBLIC__' =>WEB_URL. '/public/',
				'__IMG__' =>WEB_URL. '/public/images/',
			
		],
		//默认错误跳转对应的模板文件
		'dispatch_error_tmpl' => 'index/tips',
		//默认成功跳转对应的模板文件
		'dispatch_success_tmpl' => 'index/tips',
		

];
