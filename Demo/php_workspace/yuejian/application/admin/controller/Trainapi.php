<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Exception;
use think\Validate;

class Trainapi extends Controller
{
    public function index(){
        $list = Db::table('train')->field('trid,trname,trintro,trpic')->select();
        for($i=0;$i<count($list);$i++){
            $list[$i]['trpic']='/static/poster/'.$list[$i]['trpic'];
//  
        }
        return json_encode($list);

    }

    public function getTrain(){
         $id=input('param.id');
        if(empty($id)){
            $date=[
                'error'=>412,
                'msg'=>'未接收到想要获取的训练标识'
            ];
            return json_encode($date);
        }

        $info = Db::table('train')->where('trid',$id)->find();
        if(!$info){
            $date=[
                'error'=>404,
                'msg'=>'获取失败'
            ];
            return json_encode($date);
        }
        $info['trpic']='/static/poster/'.$info['trpic'];
        return json_encode($info);
    }


    public function trainSearch(){
        $key=input('param.key');
        $re=db('train')->where('trname','like',"%$key%")->select();
        if($re){
            for($i=0;$i<count($re);$i++){
                $re[$i]['trpic']='/static/poster/'.$re[$i]['trpic'];
            }
            return json_encode($re);
        }else{
            $date=[
                'error'=>404,
                'msg'=>'未查找到相关课程信息'
            ];
            return json_encode($date);
        }

    }
}