<?php
namespace app\admin\controller;

use app\admin\model\Comment;
use app\admin\model\Student;
use think\Controller;
use think\Db;
use think\Request;

class CommentController extends BaseController
{
    public function index(){
        $pid=input('param.pid');
        $data=Db::table('comment')
            ->alias('a')
            ->join('users b','a.uid=b.uid')
            ->where('pid',$pid)
            ->field('cmid,uname,content,a.create_at,b.uid')
            ->select();
        $this->assign('comment',$data);
        return $this->fetch('comment/index');
    }

    public function commentdel(){
        $id=input('param.cmid');
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

    public function commentInfo(){
        $id=input('param.id');
        if(empty($id)){
            $date=[
                'error'=>412,
                'msg'=>'未接收到想要获取的评论'
            ];
            return json_encode($date);
        }

        $info = Db::table('comment')->where('pid',$id)->find();
        if(!$info){
            $date=[
                'error'=>404,
                'msg'=>'获取失败'
            ];
            return json_encode($date);
        }
        return json_encode($info);
    }

}