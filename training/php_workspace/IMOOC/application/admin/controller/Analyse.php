<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Session;


class Analyse extends BaseController
{ 
 public function index(){
 		$types=Db::query("select t.tid,typename,count(vid) num from videotype t left join video v on t.tid=v.tid group by t.tid,typename");
    	$this->assign("types",$types);

    	//统计数据
    	$vnum=Db::name("video")->count();
		$this->assign('vnum',$vnum);

		$unum=Db::name("users")->count();
		$this->assign('unum',$unum);

		$cnum=Db::name("comments")->count();
		$this->assign('cnum',$cnum);

        $anum=Db::name("article")->count();
        $this->assign('anum',$anum);

        $v=Db::query("select * from video order by uploaddate desc");
        $this->assign('video',$v);

    	return $this->fetch();


 }
 		 public function logout(){
    	Session::clear();
    	$this->redirect("index/index");
    }
}