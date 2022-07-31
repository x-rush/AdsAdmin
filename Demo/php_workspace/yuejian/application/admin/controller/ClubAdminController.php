<?php
namespace app\admin\controller;

use app\admin\model\ClubAdmin;
use app\admin\model\Login;
use think\Db;
use think\Paginator;
use think\Request;
use think\Session;

class ClubAdminController extends BaseController
{
    public function index()
    {
        $ca=ClubAdmin::all();
        $this->assign('club_admin',$ca);
        return $this->fetch('clubAdmin/index');
    }

    public function clubAdminedit(){
        $id=input("param.cadminid");
        $type=ClubAdmin::get($id);
        echo json_encode($type);
    }

    public function clubAdminUpdate(){
        $data=request()->post();

        $stu=new ClubAdmin();
        $result=$stu->validate(true)->save($data,['cadminid'=>$data['cadminid']]);
        if (false === $result) {
            Session::flash('clubadminerror',$stu->getError());
            $this->redirect('admin/clubadmin');
        } else {
            Session::flash('clubadminsuccess','更新成功');
            $this->redirect('admin/clubadmin');
        }
    }

    public function clubAdminDel(){
        $id=input('param.cadminid');
        Db::startTrans();
        $ca=ClubAdmin::destroy($id);
        if($ca){
            Db::commit();
        }else{
            Db::rollback();
        }
        if ($ca){
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

    public function clubAdminadd(){
        $data=request()->post();

        $us=new ClubAdmin();
        $result=$us->validate(true)->save($data);
        if (false === $result) {
            Session::flash('clubadminerror',$us->getError());
            $this->redirect('admin/clubadmin');
        } else {
            Session::flash('clubadminsuccess','添加成功');
            $this->redirect('admin/clubadmin');
        }
    }
}
