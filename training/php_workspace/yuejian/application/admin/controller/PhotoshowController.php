<?php
namespace app\admin\controller;

use app\admin\model\Photoshow;
use think\Db;

class PhotoshowController extends BaseController
{
    public function index(){
        $photoshow=Photoshow::all();
        $photoshow=Db::table('photoshow')
            ->alias('a')
            ->join('users b','a.uid = b.uid')
            ->field('b.uid,pid,uname,content,a.pic')
            ->select();
        $this->assign('photoshow',$photoshow);
        return $this->fetch('photoshow/index');
    }

    public function photoshowDel(){
        $id=input('param.pid');
        Db::startTrans();
        $re=Photoshow::destroy($id);
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

    public function commentDel(){
        $id=input('param.commentid');
        Db::startTrans();
        $re=Comment::destroy($id);
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

    public function allPhotoshow(){
        $page=input('param.page',1);
        $pager=$page.',10';

        $list = Db::table('photoshow')->page($pager)->select();
        if(empty($list)){
            $date=[
                'error'=>404,
                'msg'=>'暂无任何晒图信息'
            ];
            return json_encode($date);
        }
        for($i=0;$i<count($list);$i++){
            $list[$i]['pic']='/static/img/'.$list[$i]['pic'];
        }
        return json_encode($list);
    }
}