<?php
namespace app\admin\model;

use think\Model;
use think\Db;
use think\Session;

class Login extends Model
{
	public function login($a,$p){

			$admin=Db::name('admins')->where("adminname",$a)->find();
		
			if($admin){
					
					if(md5($p)!=$admin['password']){
					//echo "<script>alert('密码错误');</script>";
						return 1;
					}else{
						Session::set('adminname',$a);
						Session::set('adminname',$admin['adminid']);
						//$this->redirect('video/index');
						return 3;
					}
				
			}else{
				//echo "<script>alert('用户不存在');</script>";
				return 2;
			}
	}
}