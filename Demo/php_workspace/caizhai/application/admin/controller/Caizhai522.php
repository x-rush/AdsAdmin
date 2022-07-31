<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Session;


class Vegetable521 extends Controller
{
	public function index(){
		//静态方法
		//$v=Db::query("select * from video v,videotype t where v.tid=t.tid order by vid desc");
		//$this->assign('video',$v);
		//return $this->fetch();
		$t=Db::name("type522")->select();
		$this->assign('type522',$t);
		$v=Db::query("select * from caizhai522 v,type522 t where v.tid522=t.tid522 order by cid522 desc");
		$this->assign('caizhai522',$v);
		return $this->fetch();

	}
	public function delete($id){
		//获取到图片的路径
		$filename=$_SERVER["DOCUMENT_ROOT"]."/caizhai/public/static/uploads/".Db::table('caizhai522')->where('cid522',$id)->value('pic522');
		if(file_exists($filename)){ //检查图片文件是否存在
		  	// echo "正在删除头像";
		    if(unlink($filename)){
    			if(Db::name("caizhai522")->delete($id)){	
					// echo Db::name("users")->getLastSql();exit;	
					$this->success('删除成功');
				}
				else $this->error('删除失败');
		    }
		     
		  }
		  else{
		  	if(Db::name("caizhai522")->delete($id)){	
					// echo Db::name("users")->getLastSql();exit;	
					$this->success('删除成功');
				}
				else $this->error('删除失败');
		  
		  } 
	}
	public function add(){
		$info="";
		$pic522 = request()->file('pic522');
		if($pic522)
		{
			$info = $pic522->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'uploads');
			if ($info == false) {
				$this->$pic522->getError();
			}	
		}
		if(request()->isPost()){
			$data=[
				"cainame522"=>input("param.cainame522"),
				"tid522"=>input("param.Caizhai522"),
				"address522"=>input("param.address522"),
				"contact522"=>input("param.contact522"),
				"opendate522"=>input("param.opendate522"),
				"pic522" =>empty($info)?'default.jpg':$info->getFilename(),
				"intro522"=>input("param.intro522"),
				"releasedate522"=>input("param.releasedate522"),
				
			];




			if(Db::name("caizhai522")->insert($data))
				$this->success("添加采摘园成功");
				else
					$this->error("添加采摘园失败");
			}
		}

		public function edit(){
			$cid522=input("param.cid522");
			$info521=Db::name("caizhai522")->find($cid522);
			echo json_encode($info);
		}
		public function update(){
			$info="";
			$pic522 = request()->file('pic522');
			if($pic522)
			{
				$info = $pic522->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'uploads');
				if ($info == false) {
					$this->$pic->getError();
				}	
			}

			if(request()->isPost()){
				if(empty($info)){
					$data=[
						"cid522"=>input("param.cid522"),
						"cainame522"=>input("param.cainame522"),
						"tid521"=>input("param.Caizhai522"),
						"address522"=>input("param.address522"),
						"contact522"=>input("param.contact522"),
						"opendate522"=>input("param.opendate522"),
						"intro522"=>input("param.intro522"),
						"releasedate522"=>input("param.releasedate522"),
					];
					if(Db::name("caizhai522")->update($data))
						$this->success("修改视频成功");
					else
						$this->error("修改视频失败");
				}
				$data=[
						"cid522"=>input("param.cid522"),
						"cainame522"=>input("param.cainame522"),
						"tid521"=>input("param.Caizhai522"),
						"address522"=>input("param.address522"),
						"contact522"=>input("param.contact522"),
						"opendate522"=>input("param.opendate522"),
						"pic522"=>$info->getFilename(),
						"intro522"=>input("param.intro522"),
						"releasedate522"=>input("param.releasedate522"),
				];
				if(Db::name("caizhai522")->update($data))
					$this->success("修改采摘园成功");
					else
						$this->error("修改采摘园失败");
				}
			}

		}