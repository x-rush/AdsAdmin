<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Session;


class Comments extends BaseController
{
	public function index(){

		//搜索
		//$keywords=input('keywords');
		//if($keywords){

		//}

		$u=Db::name("users")->select();
		$this->assign("users",$u);
		$v=Db::name("video")->select();
		$this->assign("video",$v);
		$c=Db::query("select * from comments c,video v,users u where c.uid=u.uid and c.vid=v.vid order by cid desc");
		$this->assign('comments',$c);
		return $this->fetch();
		}



		public function edit(){
			$cid=input("param.cid");
			$content=Db::name("comments")->find($cid);
			echo json_encode($content);
		}
		public function delete($id){

				if($users=db('comments')->delete($id)){
				$this->success("删除成功");
			}else{
				$this->error("删除失败");
			}

}

		public function update(){
					$data=[
						"cid"=>input("param.cid"),
						
						"content"=>input("param.content"),
						"cdate"=>date("Y-m-d"),
					
					];
					if(Db::name("comments")->update($data))
						$this->success("修改留言成功");
					else
						$this->error("修改留言失败");
				
			}
			 public function logout(){
    	Session::clear();
    	$this->redirect("index/index");
    }


}
