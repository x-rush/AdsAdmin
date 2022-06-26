<?php
namespace app\admin\controller;

use app\admin\model\Club;
use app\admin\model\ClubAdmin;
use think\Db;
use think\Loader;
use think\Session;

class ClubController extends BaseController
{
    public function index(){
        $club=Db::table('club')
            ->alias('a')
            ->join('club_admin b','a.cadminid = b.cadminid')
            ->select();
        $type=ClubAdmin::all();
        $admin=\db('club_admin')->select();
        $this->assign('club_admin',$type);
        $this->assign('admin',$admin);
        $this->assign('club',$club);
        return $this->fetch('club/index');

    }

    public function clubedit(){
        $lid=input("param.cid");
        $type=Club::find($lid);
        echo $type->hidden(['createtime','updatetime'])->toJson();
    }

    public function clubdel(){
        $id=input('param.cid');

        Db::startTrans();
        $re=Club::destroy($id);
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
    public function clubUpdate(){
        $data=request()->post();
        $file = request()->file('cpic');
        $stu=new Club();
        if($file){
            $pic=Club::where('cid',$data['cid'])->value('cpic');
            $filename=ROOT_PATH . 'public' . DS . 'static' . DS . 'img/'.$pic;
            if(file_exists($filename)){
                $delPic=unlink($filename);
                if(!$delPic){
                    Session::flash('cluberror','头像更新失败');
                    $this->redirect('admin/club');
                }
            }
            //上传新头像
            $info = $file->rule('uniqid')->move(ROOT_PATH . 'public' . DS . 'static' . DS . 'img');
            if ($info) {
                $pic = $info->getFilename();
                $data['cpic'] = $pic;
            }
            else{
                Session::flash('cluberror','头像更新失败');
                $this->redirect('admin/club');
            }
        }

        $result=$stu->validate(true)->save($data,['cid'=>$data['cid']]);
        if (false === $result) {
            Session::flash('cluberror',$stu->getError());
            $this->redirect('admin/club');
        } else {
            Session::flash('clubsuccess','更新成功');
            $this->redirect('admin/club');
        }
    }

    public function clubAdd(){
        $data=request()->post();
        
        $file=request()->file('cpic');
        if($file){
            //上传
            $info = $file->rule('uniqid')->move(ROOT_PATH . 'public' . DS . 'static' . DS . 'img');
            if ($info) {
                $pic = $info->getFilename();
                $data['cpic'] = $pic;
            }
            else{
                Session::flash('cluberror','上传海报失败');
                return $this->fetch('index/club');
            }
        }
        $us=new Club();
        $result=$us->validate(true)->save($data);
        if (false === $result) {
            Session::flash('cluberror',$us->getError());
            $this->redirect('index/club');
        } else {
            Session::flash('clubsuccess','添加成功');
            $this->redirect('admin/club');
        }
    }

    public function allClub(){
        $page=input('param.page',1);
        $pager=$page.',10';

        $list = Db::table('club')->page($pager)->select();
        if(empty($list)){
            $date=[
                'error'=>404,
                'msg'=>'暂无任何俱乐部信息'
            ];
            return json_encode($date);
        }
        for($i=0;$i<count($list);$i++){
            $list[$i]['cpic']='/static/img/'.$list[$i]['cpic'];
        }
        return json_encode($list);
    }
}