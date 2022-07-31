<?php
namespace app\admin\model;
use think\Session;
use think\Model;
use think\Db;
class Login extends Model
{
	public function login($aname,$adminpass){
		$admin=Db::name("admin")->where("name",$aname)->find();
        if($admin){
            if(md5($adminpass)!=$admin['password']){
                return 1;
            }else{
                Session::set('adminname',$aname);
                Session::set('adminid',$admin['id']);
                return 3;
            }
        }else{
            return 2;
        }
	}
}