<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Error extends Controller
{
    public function index()
    {
        $this->redirect('admin/index');
        $this->error('aaa');
    }

//空操作主要解决用户恶意输入一些错误的地址，如果没有这个地址就自动空操作返回到首页
    public function _empty(){
        $this->redirect('admin/index');
    }
}
