<?php
namespace app\admin\controller;
use app\admin\model\Login;
use \think\Controller;
use \think\captcha\Captcha;
use \think\Db;
use \think\Session;

class Index extends Controller
{
	public function index()
	{
		if(request()->isPost())
		{
			if(!captcha_check(input("verifycode"))){
				echo "<script>alert('验证码错误')</script>";
			}else{
				$a=input("adminname");
				$p=input("password");
				$log=new Login;
				//1密码错误,2用户名不存在,3成功
				$result=$log->login($a,$p);
				if($result==1)
					echo "<script>alert('密码错误')</script>";
				else if($result==2)
					echo "<script>alert('用户不存在')</script>";
				else
					$this->redirect("video/index");
			}
		}
		return $this->fetch();
	}
	public function show_captcha(){
		ob_clean();
		$captcha = new Captcha();
		// $captcha->useZh=true;
		// $captcha->zhSet="只需职场模拟被重写我任意球舞二了橙欧普已破图片热千瓦的发酵快递费活动时间客服哈大口径符合时女厕型中不存在八福";
		$captcha->fontSize = 30;
		$captcha->length   = 4;
		$captcha->useNoise = false;
		return $captcha->entry();
	}
	public function logout(){
		Session::clear();
		$this->redirect("index/index");
	}
}
