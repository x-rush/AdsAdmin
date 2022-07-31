<?php
namespace app\api\controller;

use think\Controller;
use think\Db;
use think\Exception;
use think\Validate;

//require_once __DIR__.'/ErrorInfo.php';
class Master extends Controller
{
    public function index(){
        $page=input('param.page',1);
        $pager=$page.',10';

        $list = Db::table('master')
            ->alias('a')
            ->join('trainer b','a.trid=b.trid')
            ->field('b.trid,b.tname,tsex,tintro,tpic,hittimes')
            ->page($pager)->select();

        if(empty($list)){
//            throw new Exception('暂无活动信息',ErrorInfo::LONGIN_FAIL);
            $date=[
                'error'=>404,
                'msg'=>'暂无任何活动信息'
            ];
            return json_encode($date);
        }
        $pos= strpos(\request()->url(true),"public",0);
        $prefix=substr(\request()->url(true),0,$pos+6);
        for($i=0;$i<count($list);$i++){
            $list[$i]['tpic']=$prefix. '/static/img/'.$list[$i]['tpic'];
//            $value['pic'] = dirname(dirname(\request()->url(true))). 'static/' . DS . 'poster/'.$value['pic'];
        }
        return json_encode($list);
    }

    public function masterInfo($id){
        if(empty($id)){
//            throw new Exception('活动Id不能为空',001);
            $date=[
                'error'=>412,
                'msg'=>'未接收到想要获取的活动标识'
            ];
            return json_encode($date);
        }

        $info = Db::table('trainer')->where('trid',$id)->find();
        if(!$info){
//            throw new Exception('获取失败',002);
            $date=[
                'error'=>404,
                'msg'=>'获取失败'
            ];
            return json_encode($date);
        }
        $course=Db::table('course')
            ->where('trid',$info['trid'])
            ->select();
        $pos= strpos(\request()->url(true),"public",0);
        $prefix=substr(\request()->url(true),0,$pos+6);
        for($i=0;$i<count($course);$i++){
            $course[$i]['copic']=$prefix. '/static/poster/'.$course[$i]['copic'];
        }

        $info['course']=$course;
//        $pos= strpos(\request()->url(true),"public",0);
//        $prefix=substr(\request()->url(true),0,$pos+6);
//        $info['pic']=$prefix. '/static/poster/'.$info['pic'];
        return json_encode($info);
    }

    public function course(){
        $id=input('id');
        if(empty($id)){
            $date=[
                'error'=>412,
                'msg'=>'未接收到想要获取的课程标识'
            ];
            return json_encode($date);
        }
        $data=Db::table('video')->where('coid',$id)->select();
        if(!$data){
            $date=[
                'error'=>404,
                'msg'=>'获取失败'
            ];
            return json_encode($date);
        }
        $pos= strpos(\request()->url(true),"public",0);
        $prefix=substr(\request()->url(true),0,$pos+6);
        for($i=0;$i<count($data);$i++){
            $data[$i]['pic']=$prefix. '/static/poster/'.$data[$i]['pic'];
        }
        return json_encode($data);
    }


    public function masterSearch(){
        $key=input('param.key');
        $re=db('master')
            ->alias('a')
            ->join('trainer b','a.trid=b.trid')
            ->where('tname','like',"%$key%")->select();
        if($re){
            $pos= strpos(\request()->url(true),"public",0);
            $prefix=substr(\request()->url(true),0,$pos+6);
            for($i=0;$i<count($re);$i++){
                $re[$i]['tpic']=$prefix. '/static/poster/'.$re[$i]['tpic'];
            }
            return json_encode($re);
        }else{
            $date=[
                'error'=>404,
                'msg'=>'未查找到相关活动信息'
            ];
            return json_encode($date);
        }

    }
}