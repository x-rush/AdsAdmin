<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Session;
class BaseController extends Controller
{
		//初始化方法：其他方法运行前自动调用该方法
		public function _initialize(){
			if(!Session::has('adminid')){
				$this->error("请登录后访问",'index/index');
			}
		}
}
