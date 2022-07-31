<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Session;


class Video extends BaseController
{
	public function index(){
		

		//搜索
		//$keywords=input('keywords');
		//if($keywords){

		//}

		$keywords=input('vname');
		if($keywords){
			$t=Db::name("videotype")->select();
			$this->assign("types",$t);
			$v=Db::query("select * from video v,videotype t where v.tid=t.tid and videoname like '%{$keywords}%' order by vid desc");
			$this->assign('videos',$v);
			return $this->fetch();
		}
		else{
		
		$t=Db::name("videotype")->select();
		$this->assign("types",$t);
		$v=Db::query("select * from video v,videotype t where v.tid=t.tid order by vid desc");
		$this->assign('videos',$v);
		return $this->fetch();
		}
	}

	public function add(){
		$info="";
		$pic = request()->file('pic');
		if($pic)
		{
			$info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'adminMSI'.DS.'posters');
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
				"uploaddate"=>date("Y-m-d-h-m-s"),
				"uploadadmin"=>Session('adminid'),
				"studynumber"=>0,
				"hittimes"=>0,
				"address"=>input("param.address"),

			];



			//$validate = \think\Loader::validate('Video');

			/*if(!$validate->check($data)){
   				 $this->error($validate->getError());
			}*/

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
		public function delete($id){
			$p=Db::name("video")->where('vid',$id)->value('pic');
			if($p=='default.jpg'){
				if($users=db('video')->delete($id)){
				$this->success("删除成功");
			}else{
				$this->error("删除失败");
			}}
			else{


			unlink($_SERVER["DOCUMENT_ROOT"]."IMOOC/public/static/adminMSI/posters/".$p);
			if($users=db('video')->delete($id)){
				$this->success("删除成功");
			}else{
				$this->error("删除失败");
		}
	}
}

		public function update(){
			$info="";
			$pic = request()->file('pic');
			if($pic)
		{
			$info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'adminMSI'.DS.'posters');
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
						"uploaddate"=>date("Y-m-d"),
						"address"=>input("param.address"),
					];
					if(Db::name("video")->update($data))
						$this->success("修改视频成功");
					else
						$this->error("修改视频失败");
				}
				$data=[
					"vid"=>input("param.vid"),
					"videoname"=>input("param.videoname"),
					"tid"=>input("param.videotype"),
					"pic" =>empty($info)?'default.jpg':$info->getFilename(),
					"intro"=>input("param.intro"),
					"uploaddate"=>date("Y-m-d"),
					"address"=>input("param.address"),
				];
				if(Db::name("video")->update($data))
					$this->success("修改视频成功");
					else
						$this->error("修改视频失败");
				}
			}
	public function logout(){
    	Session::clear();
    	$this->redirect("index/index");
    }
	public function findpwd(){
        if(request()->isPost()){
        	$email=input('email');
        	//该邮箱是否存在
        	$emailinfo=Db::name("admin")->where("email",$email)->count();
        	if($emailinfo){
        		$title = "找回密码通知！";
				$srand = rand ( 11111, 99999 );
				$data ['rand'] = $srand;
				Db::name("admin")->where ( "email = '$email'" )->update ( $data ); // 更新数据库
				// echo Db::name("users")->getLastSQL();die();
				$content = "校验码:$srand";

				if (SendMail ( $email, $title, $content )) {
					$this->success( "发送成功,请到邮箱查看校验码!", url('setpwd',['email'=>$email]) );
					die ();
				} else {
					$this->error( $mail->ErrorInfo );
					die ();
				}
        	}else{
        		$this->error("邮箱不存在");
        	}
        	//如果存在，则生成四位随机数，发到该邮箱
        }
        return $this->fetch();
    }
    public function setpwd(){
    	if(request()->isPost()){
    		$rand=input('rand');
    		$newpwd=input('newpwd');
    		$dbrand=Db::name("admin")->where("email",session("email"))->find();
    		// var_dump($dbrand);
    		if($rand!=$dbrand["rand"]){
    			$this->success("验证码错误");
    		}else{
    			Db::name("admin")->where("email",session("email"))->update(["password"=>md5($newpwd)]);
    			$this->success('重设密码成功',"index");
    		}
    	}else{
    		$email=input("email");
    		session("email",$email);
    	}
    	return $this->fetch();
    }

    public function stat(){
    	$types=Db::query("select t.tid,typename,count(vid) num from videotype t left join video v on t.tid=v.tid group by t.tid,typename");
    	

    	$this->assign("types",$types);
    	return $this->fetch();

    }


}
