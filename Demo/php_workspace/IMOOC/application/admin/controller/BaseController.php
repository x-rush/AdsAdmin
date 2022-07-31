<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
class BaseController extends Controller
{
		//初始化方法：其他方法运行前自动调用该方法
		public function _initialize(){
			if(!Session::has('adminid')){
				$this->error("请登录后访问",'admin/index/index');
			}
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
     public function logout(){
        Session::clear();
        $this->redirect("index/index");
    }
}
