<?php
namespace app\index\controller;
use \think\Controller;
use \think\Db;

class Developers extends Controller
{
    public function index(){
    	$a=DB::query("select * from article a,users u where a.adminid=u.uid order by aid desc");
		$this->assign('article',$a);


        return $this->fetch('developers');
    }

}
