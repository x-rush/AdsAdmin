<?php
namespace app\api\controller;

use think\Controller;
use think\Db;
use think\Exception;
use think\Validate;

//require_once __DIR__.'/ErrorInfo.php';
class Matchs extends Controller
{
    public function index(){
        $page=input('param.page',1);
        $pager=$page.',10';

        $list = Db::table('matchs')->page($pager)->select();
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
            $list[$i]['mpic']=$prefix. '/static/poster/'.$list[$i]['mpic'];
//            $value['pic'] = dirname(dirname(\request()->url(true))). 'static/' . DS . 'poster/'.$value['pic'];
        }
        return json_encode($list);
    }

    public function matchInfo(){
        $id=input('id');
        if(empty($id)){
//            throw new Exception('活动Id不能为空',001);
            $date=[
                'error'=>412,
                'msg'=>'未接收到想要获取的比赛标识'
            ];
            return json_encode($date);
        }

        $info = Db::table('matchs')->where('mid',$id)->find();
        if(!$info){
//            throw new Exception('获取失败',002);
            $date=[
                'error'=>404,
                'msg'=>'获取失败'
            ];
            return json_encode($date);
        }
        $pos= strpos(\request()->url(true),"public",0);
        $prefix=substr(\request()->url(true),0,$pos+6);
        $info['mpic']=$prefix.'/static/poster/'.$info['mpic'];
        return json_encode($info);
    }

    public function matchEnroll(){
        $data=input('param.');
        if(empty($data['mid'])||empty($data['uid'])){
            $date=[
                'error'=>404,
                'msg'=>'非法请求'
            ];
            return json_encode($date);
        }

        $data['create_at']=date('Y-m-d H:i:s');

        $count=db('match_order')->where('mid',$data['mid'])->where('uid',$data['uid'])->select();
        if($count){
            $date=[
                'error'=>412,
                'msg'=>'您已提交过报名，无需再次提交'
            ];
            return json_encode($date);
        }

        $validate = new Validate([
            'mid'  => 'require',
            'uid' => 'require'
        ]);

        if (!$validate->check($data)) {
            $date=[
                'error'=>412,
                'msg'=>$validate->getError()
            ];
            return json_encode($date);
        }

        $re=db('match_order')->insert($data);
        if($re){
            $date=[
                'success'=>1,
                'msg'=>'提交成功'
            ];
            return json_encode($date);
        }else{
            $date=[
                'error'=>412,
                'msg'=>'提交失败'
            ];
            return json_encode($date);
        }
    }

    public function matchSearch(){
        $key=input('param.key');
        $re=db('matchs')->where('mname','like',"%$key%")->select();
        if($re){
            $pos= strpos(\request()->url(true),"public",0);
            $prefix=substr(\request()->url(true),0,$pos+6);
            for($i=0;$i<count($re);$i++){
                $re[$i]['mpic']=$prefix. '/static/poster/'.$re[$i]['mpic'];
//            $value['pic'] = dirname(dirname(\request()->url(true))). 'static/' . DS . 'poster/'.$value['pic'];
            }
            return json_encode($re);
        }else{
            $date=[
                'error'=>404,
                'msg'=>'未查找到相关比赛信息'
            ];
            return json_encode($date);
        }

    }
}