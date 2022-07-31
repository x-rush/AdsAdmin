<?php
namespace app\admin\controller;

use app\admin\model\Matchs;
use think\Db;
use think\Paginator;
use think\Request;
use think\Session;

class MatchsController extends BaseController
{
    public function index()
    {
        $ac=Matchs::all();
//        $type=Db::name('type')->order('tid desc')->paginate(2);
        $this->assign('matchs',$ac);
        return $this->fetch('matchs/empty');
    }

    public function edit(){
        # code...
        $mid=input("param.mid");
        $info=Matchs::get($mid);
        echo json_encode($info);
    }

    public function orderList($id){
        $order=Db::table('matchs')
                ->alias('a')
                ->join('match_order ao','a.mid = ao.mid')
                ->join('users u','u.uid = ao.uid')
                ->field('moid,ao.create_at,uname,u.pic')
                ->where('a.mid',$id)
                ->paginate(5);
//        $type=Db::name('type')->order('tid desc')->paginate(2);
        $this->assign('order',$order);
        return $this->fetch('matchs/matchsorder');
    }

    public function matchsDel(){
        $id=input('param.mid');
//        $re=Type::where('tid',$id)->delete();
        $pic=Matchs::where('mid',$id)->value('mpic');
        $filename=ROOT_PATH . 'public' . DS . 'static' . DS . 'poster/'.$pic;
        if(unlink($filename)) {
            Db::startTrans();
            $re=Matchs::destroy($id);
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
        }else{
            Session::flash('matchserror','删除失败，无法删除海报');
            $this->redirect('admin/matchs');
        }

    }

    public function matchsAdd(){
        $data=request()->post();

        $file=request()->file('mpic');
        if($file){
            //上传
            $info = $file->rule('uniqid')->move(ROOT_PATH . 'public' . DS . 'static' . DS . 'poster');
            if ($info) {
                $pic = $info->getFilename();
                $data['mpic'] = $pic;
            }
            else{
                Session::flash('matchserror','上传活动海报失败');
                $this->redirect('admin/matchs');
            }
        }
        $ac=new Matchs();
//        $re=$lesson->data($data)->save();
        $result=$ac->validate(true)->save($data);
        if (false === $result) {
            // 验证失败 输出错误信息
            Session::flash('matchserror',$ac->getError());
            $this->redirect('admin/matchs');
        } else {
            Session::flash('matchssuccess','添加成功');
            $this->redirect('admin/matchs');
        }
    }

    public function matchsUpdate(){
        $data=request()->post();
        $file = request()->file('mpic');
        $ac=new Matchs();
        if($file){
            // 先删除原海报
            $pic=Matchs::where('mid',$data['mid'])->value('mpic');
            $filename=ROOT_PATH . 'public' . DS . 'static' . DS . 'poster/'.$pic;
            if(unlink($filename)) {
                //上传新新海报
                $info = $file->rule('uniqid')->move(ROOT_PATH . 'public' . DS . 'static' . DS . 'poster');
                if ($info) {
                    $pic = $info->getFilename();
                    $data['mpic'] = $pic;
                }
            }else{
                Session::flash('matchserror','海报更新失败');
                $this->redirect('admin/matchs');
            }
        }
        $result=$ac->validate(true)->save($data,['mid'=>$data['mid']]);
        if (false === $result) {
            // 验证失败 输出错误信息
            Session::flash('matchserror',$ac->getError());
            $this->redirect('admin/matchs');
        } else {
            Session::flash('matchssuccess','更新成功');
            $this->redirect('admin/matchs');
        }
    }
}
