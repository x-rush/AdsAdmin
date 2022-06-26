<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Session;
class Article extends BaseController
{
	public function index(){

		$ad=Db::name("admin")->select();
		$this->assign("admin",$ad);
		$a=Db::query("select * from article a,admin ad where a.adminid=ad.adminid order by aid desc");
		$this->assign('article',$a);
		return $this->fetch();




		}
		public function add(){
	//		if(request()->isPost()){
			
	//		$content = input('post.content');
	//		dump($content);
	//		die;
	//	}
		
		

		if(request()->isPost()){
			

		$data=[
			"articleintro"=>input('post.content'),
			"hittimes"=>0,
			"adminid"=>Session('adminid'),
			"aname"=>input('post.articlename')
		];

			
		if(Db::name("article")->insert($data))
				$this->success("添加文章成功",'article/index');
				else
					$this->error("添加文章失败");
			
		}
		
		return $this->fetch();
	//		$data=[
	//		"articleintro"=>input('post.wordtype'),
	//		"hittimes"=>0,
	//		"aname"=>input('post.articlename')
	//		];
	//		
	//	if(Db::name("article")->insert($data))
	//			$this->success("添加文章成功");
	//			else
	//				$this->error("添加文章失败");
		
		}
	public function logout(){
    	Session::clear();
    	$this->redirect("index/index");
    }

		public function edit($id){
			//$aid=input("param.aid");
			//$info=Db::name("article")->find($aid);
			
			$a=Db::query("select * from article where aid=$id order by aid");
			$this->assign('ak',$a);
			return $this->fetch();	
		
			
		}
		public function delete($id){
				if($users=db('article')->delete($id)){
				$this->success("删除成功");
			}else{
				$this->error("删除失败");
			}
	}

		public function update(){
			
		
		if(request()->isPost()){
			$data=[
			"aid"=>input('param.aid'),
			"articleintro"=>input('post.content'),
			"aname"=>input('post.articlename'),
			"adminid"=>Session('adminid')
		];
			
		if(Db::name("article")->update($data))
				$this->success("修改文章成功",'article/index');
				else
					$this->error("修改文章失败");	
		}
		}
		

}