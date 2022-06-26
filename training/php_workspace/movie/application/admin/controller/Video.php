<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;


class Video extends BaseController
{
	public function index(){
		//静态方法
		//$v=Db::query("select * from video v,videotype t where v.tid=t.tid order by vid desc");
		//$this->assign('video',$v);
		//return $this->fetch();
		$t=Db::name("videotype")->select();
		$this->assign('types',$t);
		$v=Db::query("select * from video v,videotype t where v.tid=t.tid order by vid desc");
		$this->assign('video',$v);
		return $this->fetch();

	}
	public function add(){
		$info="";
		$pic = request()->file('pic');
		if($pic)
		{
			$info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'admin'.DS.'posters');
			if ($info == false) {
				$this->$pic->getError();
			}	
		}
		if(request()->isPost()){
			$data=[
				"videoname"=>input("param.videoname"),
				"tid"=>input("param.videotype"),
				"pic" =>empty($info)?'default.jpg':$info->getFilename(),
				"intro"=>input("param.intro"),
				"uploaddate"=>date("Y-m-d"),
				"uploadadmin"=>2,
				"downtimes"=>0,
				"hittimes"=>0,
				"address"=>input("param.address"),

			];


			$validate = \think\Loader::validate('Video');

			if(!$validate->check($data)){
   				 $this->error($validate->getError());
			}

			if(Db::name("video")->insert($data))
				$this->success("添加视频成功");
				else
					$this->error("添加视频失败");
			}
		}

		public function edit(){
			$vid=input("param.vid");
			$info=Db::name("video")->find($vid);
			echo json_encode($info);
		}
		public function update(){
			$info="";
			$pic = request()->file('pic');
			if($pic)
			{
				$info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'admin'.DS.'posters');
				if ($info == false) {
					$this->$pic->getError();
				}	
			}

			if(request()->isPost()){
				if(empty($info)){
					$data=[
						"vid"=>input("param.vid"),
						"videoname"=>input("param.videoname"),
						"tid"=>input("param.videotype"),
						"intro"=>input("param.intro"),
						"address"=>input("param.address")
					];
					if(Db::name("video")->update($date))
						$this->success("修改视频成功");
					else
						$this->error("修改视频失败");
				}
				$date=[
					"vid"=>input("param.vid"),
					"videoname"=>input("param.videoname"),
					"pic" =>$info->getFilename(),
					"tid"=>input("param.videotype"),
					"intro"=>input("param.intro"),
					"address"=>input("param.address")
				];
				if(Db::name("video")->update($date))
					$this->success("修改视频成功");
					else
						$this->error("修改视频失败");
				}
			}
			 public function logout(){
    	Session::clear();
    	$this->redirect("index/index");
    }
		}