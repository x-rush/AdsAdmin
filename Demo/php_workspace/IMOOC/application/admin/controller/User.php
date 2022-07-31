<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;

class User extends BaseController
{
	public function index(){
		//调用模型层实现业务逻辑

		//搜索用户
		$keywords=input('uname');
		if($keywords){
		$users=Db::query("select * from users where uname like '%{$keywords}%' order by uid desc");
		$this->assign('list',$users);
		//dump($users);exit;
		//调用试图层把模型层的数据显示出来
		return $this->fetch();
	}
	else{
		$users=db('users')->select();
		$this->assign('list',$users);
		//dump($users);exit;
		//调用试图层把模型层的数据显示出来
		return $this->fetch();
	}
	}
	public function delete($id){
		//删除用户之前先删除用户头像
		//find方法和unlink方法
		$u=Db::name("users")->where('uid',$id)->value('pic');
		unlink($_SERVER["DOCUMENT_ROOT"]."IMOOC/public/static/adminMSI/head/".$u);
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
			$this->error("该用户名已存在");
			//把值存入数据库
		}
		$info="";
		$pic = request()->file('pic');
		if($pic)
		{
			$info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'adminMSI'.DS.'head');
			if ($info == false) {
				$this->$pic->getError();
			}	
		}
		if(request()->isPost()){
			$username=input("param.username");
			$password=input("param.password");
			if(!$username){
				$this->error("请输入用户名");
			}
			if(!$password){
				$this->error("请输入密码");
			}
			else{


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
	}
	public function edit(){
			$uid=input("param.uid");
			$info=Db::name("users")->find($uid);
			echo json_encode($info);
		}
		public function update(){
			$uid=input("param.uid");
			$username=input('param.username');
			$num=Db::name("users")->where("uname='$username'")->where("uid<>$uid")->count();
		
			if($num>0){
				$this->error("该用户名已存在");
				//把值存入数据库
			}
			$info="";
			$pic = request()->file('pic');
			if($pic)
			{
				$info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'adminMSI'.DS.'head');
				if ($info == false) {
					$this->$pic->getError();
				}	
			}
			
			if(request()->isPost()){
				if(empty($info)){
			$username=input("param.username");
			$password=input("param.password");
			if(!$username){
				$this->error("请输入用户名");
			}
			if(!$password){
				$this->error("请输入密码");
			}else{


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
		}else{
			$username=input("param.username");
			$password=input("param.password");
			if(!$username){
				$this->error("请输入用户名");
			}
			if(!$password){
				$this->error("请输入密码");
			}
			else{
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
	}
		public function logout(){
    	Session::clear();
    	$this->redirect("index/index");
    }
		}