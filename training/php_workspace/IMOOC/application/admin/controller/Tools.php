<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Tools extends controller{
public function index(){
		
		return $this->fetch();
		}

		public function ueditor()
	{
		if(request()->isPost()){
			
			$content = input('post.content');
			dump($content);
			die;
		}
		
		return $this->fetch();
	}
}