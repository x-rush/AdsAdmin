<?php
namespace app\admin\controller;

use app\admin\model\Master;
use app\admin\model\Matchs;
use think\Db;
use think\Session;

class MasterController extends BaseController
{
    public function index(){
        $date=Db::table('master')
            ->alias('a')
            ->join('trainer t','a.trid = t.trid')
            ->join('club c','t.cid = c.cid')
            ->field('msid,t.trid,t.cid,cname,tname,tsex,tintro,tpic,hittimes')
            ->select();
        $this->assign('master',$date);
        return $this->fetch('master/empty');
    }

    public function trainerList(){
        $order=Db::table('trainer')->order('hittimes desc')->limit(20) ->paginate(5);
        $this->assign('order',$order);
        return $this->fetch('master/mastersorder');
    }

    public function masterDel(){
        $id=input('param.msid');
//        $re=Type::where('tid',$id)->delete();
        Db::startTrans();
        $re=Master::destroy($id);
        if($re){
            Db::commit();
        }else{
            Db::rollback();
        }
        if ($re){
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

    public function masterAdd(){
        $data=input('param.');
        $master           = new Master();
        $result=$master->validate(true)->save($data);
//        if (!$result) {
//            // 验证失败 输出错误信息
//            Session::flash('matchserror','添加失败');
//            $this->redirect('admin/matchs');
//        } else {
//            Session::flash('matchssuccess','添加成功');
//            $this->redirect('admin/matchs');
//        }
        if (true === $result){
            $date=[
                'status'=>0,
                'msg'=>'添加成功'
            ];
        }else{
            $date=[
                'status'=>1,
                'msg'=>$master->getError()
            ];
        }
        return $date;
    }
}
