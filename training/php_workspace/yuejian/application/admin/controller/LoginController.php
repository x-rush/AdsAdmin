<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\admin\model\Login;
use think\Session;

class LoginController extends Controller
{
    public function login(){
        if(request()->isPost()){
            //获取验证码并验证是否正确
            $captcha=input('verifycode');
            //用验证器验证
            if(!captcha_check($captcha)){
                //验证失败
//                echo "<script>alter('密码有误');</script>";
                Session::set('message','验证码有误');
            }else{
                $aname=input('Username');
                $adminpass=input('password');

                $login=new Login();
                $result=$login->login($aname,$adminpass);
                if($result==1){
//                    echo "<script>alter('密码有误');</script>";
                    Session::set('message','密码有误');

                }else if($result==2){
//                    echo "<script>alter('用户不存在');</script>";
                    Session::set('message','用户不存在');
                }else{
                    $this->redirect('admin/index');
                }
            }
        }
        return $this->fetch('index/index');
    }
    public function show_captcha(){
        ob_clean();
        $captcha = new \think\captcha\Captcha();
//        $captcha->useZh=true;
//        $captcha->zhSet='你看房价能否快速进步飞快世界杯发生口角哲学家你们偶极矩看';
        $captcha->fontSize = 30;
        $captcha->length   = 4;
        $captcha->useNoise = false;
        return $captcha->entry();
    }

    public function logout(){
        Session::delete('adminid');
        $this->redirect('admin/login');
    }
}
