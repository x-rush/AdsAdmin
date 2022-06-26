<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;

class User extends BaseController
{
	public function index(){
		//调用模型层实现业务逻辑
		$users=db('users')->select();
		$this->assign('list',$users);
		//dump($users);exit;
		//调用试图层把模型层的数据显示出来
		return $this->fetch();
	}
	public function delete($id){
		//删除用户之前先删除用户头像
		//find方法和unlink方法
		$u=Db::name("users")->where('uid',$id)->value('pic');
		unlink($_SERVER["DOCUMENT_ROOT"]."movie/public/static/admin/images/".$u);
		if($users=db('users')->delete($id)){
			$this->success("删除成功");
		}else{
			$this->error("删除失败");
		}
	}
	public function add(){
		$username=input('param.username');
		$num=Db::name("users")->where("uname='$username'")->count();
		
		if($num>0){
			$this->error("该类型用户名已存在");
			//把值存入数据库
		}
		$info="";
		$pic = request()->file('pic');
		if($pic)
		{
			$info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'admin'.DS.'images');
			if ($info == false) {
				$this->$pic->getError();
			}	
		}
		if(request()->isPost()){
			$data=[
				"uname"=>input("param.username"),
				"password"=>md5(input("param.password")),
				"gender"=>input("param.gender"),
				"birthday"=>input("param.birthday"),
				"pic" =>empty($info)?'default.jpg':$info->getFilename(),
				"email"=>input("param.email"),
			];
			if(Db::name("users")->insert($data))
				$this->success("添加用户成功");
				else
					$this->error("添加用户失败");
		}
	}
	public function edit(){
			$uid=input("param.uid");
			$info=Db::name("users")->find($uid);
			echo json_encode($info);
		}
		public function update(){
			$username=input('param.username');
			$num=Db::name("users")->where("uname='$username'")->count();
		
			if($num>0){
				$this->error("该类型用户名已存在");
				//把值存入数据库
			}
			$info="";
			$pic = request()->file('pic');
			if($pic)
			{
				$info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'admin'.DS.'images');
				if ($info == false) {
					$this->$pic->getError();
				}	
			}
			
			if(request()->isPost()){
				if(empty($info)){
				$date=[
					"uid"=>input("param.uid"),
					"uname"=>input("param.username"),
					"password"=>md5(input("param.password")),
					"gender"=>input("param.gender"),
					"birthday"=>input("param.birthday"),
					"email"=>input("param.email")
				];
				if(Db::name("users")->update($date))
					$this->success("修改用户信息成功");
					else
						$this->error("修改用户信息失败");
			}
				$date=[
					"uid"=>input("param.uid"),
					"uname"=>input("param.username"),
					"password"=>md5(input("param.password")),
					"gender"=>input("param.gender"),
					"birthday"=>input("param.birthday"),
					"pic" =>$info->getFilename(),
					"email"=>input("param.email")
				];
				if(Db::name("users")->update($date))
					$this->success("修改用户信息成功");
					else
						$this->error("修改用户信息失败");
				}
			}
		}