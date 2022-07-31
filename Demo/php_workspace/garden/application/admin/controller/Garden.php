<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Db;
class Garden extends Controller
{
	public function index(){
		$type522=Db::name("type522")->select();
		$this->assign('type522',$type522);
		$gardens=Db::query("select * from caizhai522 g,type522 t where g.tid522=t.tid522 order by cid522 DESC");
		$this->assign("gardens",$gardens);

		return $this->fetch(); 
        return $this->redirect();
        $this->success();
        $this->error();
	}

}