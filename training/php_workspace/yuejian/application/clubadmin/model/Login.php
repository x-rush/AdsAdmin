<?php
namespace app\clubadmin\model;
use think\Session;
use think\Model;
use think\Db;
class Login extends Model
{
	public function login($aname,$adminpass){
		$admin=Db::name("club_admin")->where("cadminname",$aname)->find();
        if($admin){
            if(md5($adminpass)!=$admin['password']){
                return 1;
            }else{
                Session::set('cadminname',$aname);
                Session::set('cadminid',$admin['cadminid']);
                return 3;
            }
        }else{
            return 2;
        }
	}
}