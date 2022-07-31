<?php
namespace app\index\controller;
use \think\Controller;
use \think\Db;

class Moviess extends Controller
{

	public function index(){
		$v=Db::query("select * from video v,videotype t where v.tid=t.tid order by vid desc");
		$this->assign('video',$v);
		$rew=Db::query("select * from video WHERE tid=1");
		$this->assign('videoname',$rew);
		$re=Db::query("select * from videotype WHERE tid=1");
		$this->assign('typename',$re);

		return $this->fetch('moviess');
	}

}
