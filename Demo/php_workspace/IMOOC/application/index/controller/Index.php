<?php
namespace app\index\controller;
use \think\Controller;
use \think\Db;

class Index extends Controller
{
    public function index(){
    	$t=Db::name("videotype")->select();
		$this->assign('types',$t);
		$v=Db::query("select * from video v,videotype t where v.tid=t.tid order by vid desc");
		$this->assign('video',$v);
		$a=DB::query("select * from article a,users u where a.adminid=u.uid order by aid desc");
		$this->assign('article',$a);

        return $this->fetch('index');
    }
}
