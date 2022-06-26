<?php
namespace app\index\controller;
use \think\Controller;
use \think\Db;

class Single extends Controller
{

    	public function index(){
    	$v=Db::query("select * from video v,videotype t where v.tid=t.tid order by vid desc");
		$this->assign('video',$v);
		$c=Db::query("select * from comments c,users u where c.uid=u.uid order by cid desc");
		$this->assign('comments',$c);

		// $intro='intro';
		// $name='name';
		// $this->assign('intro',$intro);
		// $this->assign('name',$name);
		return $this->fetch('single');
	}
	public function single($id){
		$v=Db::query("select * from video v,videotype t where v.tid=t.tid order by vid desc");
		$this->assign('video',$v);

	}


}
