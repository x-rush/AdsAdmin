<?php
namespace app\admin\controller;

use app\admin\model\Users;
use app\admin\model\Login;
use app\admin\model\Type;
use think\Db;
use think\Paginator;
use think\Request;
use think\Session;

class UserController extends BaseController
{
    public function index()
    {
        $us=Users::all();
        $this->assign('users',$us);
        return $this->fetch('user/empty');
    }

    public function edit(){
        $uid=input("param.uid");
        $type=Users::get($uid);
        echo json_encode($type);
    }

    public function stuDel(){
        $id=input('param.uid');
        Db::startTrans();
        $us=Users::destroy($id);
        if($us){
            Db::commit();
        }else{
            Db::rollback();
        }
        if ($us){
            $date=[
                'status'=>0,
                'msg'=>'删除成功'
            ];
        }else{
            $date=[
                'status'=>1,
                'msg'=>'删除失败'
            ];
        }
        return $date;
    }
   
}
