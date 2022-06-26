<?php

namespace app\api\controller;

use think\Controller;
use think\Request;

class Error extends Controller
{
    public function index()
    {
        $date=[
            'error'=>404,
            'msg'=>'非法请求'
        ];
        return json_encode($date);
    }

//空操作主要解决用户恶意输入一些错误的地址，如果没有这个地址就自动空操作返回到首页
    public function _empty(){
        $date=[
            'error'=>404,
            'msg'=>'非法请求'
        ];
        return json_encode($date);
    }
}
