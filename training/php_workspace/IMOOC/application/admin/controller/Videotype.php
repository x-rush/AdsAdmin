<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use \think\Request;

class Videotype extends BaseController
{
	public function index(){
		$t=Db::name('videotype')->select();
		$this->assign('videotype',$t);
		return $this->fetch();
	}
	public function add(){
		//获取
		//$tp=$_POST["typename"];
		$typename=input('param.typename');
		var_dump($typename);
		$num=Db::name("videotype")->where("typename='$typename'")->count();
		echo Db::name("videotype")->getLastSql();
		if($num>0){
			$this->error("该类型已存在");
			//把值存入数据库
		}
			$data=["typename"=>$typename];
			if(Db::name("videotype")->insert($data)){
				$this->success("添加视频类型成功");
			}
			else $this->error("添加视频类型失败");
		
	}
		public function edit(){
			$tid=input("param.tid");
			$type=Db::name("videotype")->find($tid);
			echo json_encode($type);
		}
	public function update(){
		$typename=input('param.typename');
		if(!$typename){
			$this->error("请输入视频类型");
		}
		else{
		var_dump($typename);
		$num=Db::name("videotype")->where("typename='$typename'")->count();
		if($num>0){
			$this->error("该类型已存在");
			//把值存入数据库
		}


		$data=[
			"tid"=>input("param.tid"),
			"typename"=>input("param.typename")
		];
		if(Db::name("videotype")->update($data)){
			$this->success("修改视频类型成功");
		}else{
			$this->error("修改视频类型失败");
		}
	}
	}
	public function delete($id){
		if($videotype=db('videotype')->delete($id)){
			$this->success("删除成功");
		}else{
			$this->error("删除失败");
		}
	}
			 public function logout(){
    	Session::clear();
    	$this->redirect("index/index");
    }
}
