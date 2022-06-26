<?php
namespace app\index\controller;
use \think\Controller;
use \think\Db;

class News extends Controller
{
    public function index(){
    	$v=Db::query("select * from video v,videotype t where v.tid=t.tid order by vid desc");
		$this->assign('video',$v);
		$rew=Db::query("select * from video WHERE tid=3");
		$this->assign('videoname',$rew);
		$re=Db::query("select * from videotype WHERE tid=3");
		$this->assign('typename',$re);

        return $this->fetch('news');
    }

}
