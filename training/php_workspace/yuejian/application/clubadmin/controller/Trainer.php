<?php
namespace app\clubadmin\controller;

use think\Controller;
use think\Db;
use think\Exception;
use think\Validate;

class Trainer extends Controller
{
    public function index(){
        $list = Db::table('trainer')->field('trid,tname,tpic,tintro')->select();
        for($i=0;$i<count($list);$i++){
            $list[$i]['tpic']='/static/adminMSI/thead/'.$list[$i]['tpic'];
//  
        }
        return json_encode($list);

    }

    public function getTrainer(){
         $id=input('param.id');
        if(empty($id)){
            $date=[
                'error'=>412,
                'msg'=>'未接收到想要获取的教练标识'
            ];
            return json_encode($date);
        }

        $info = Db::table('trainer')->where('trid',$id)->find();
        if(!$info){
            $date=[
                'error'=>404,
                'msg'=>'获取失败'
            ];
            return json_encode($date);
        }
        $info['tpic']='/static/adminMSI/thead/'.$info['tpic'];
        return json_encode($info);
    }


    public function trainerSearch(){
        $key=input('param.key');
        $re=db('trainer')->where('tname','like',"%$key%")->select();
        if($re){
            for($i=0;$i<count($re);$i++){
                $re[$i]['tpic']='/static/adminMSI/thead/'.$re[$i]['tpic'];
            }
            return json_encode($re);
        }else{
            $date=[
                'error'=>404,
                'msg'=>'未查找到相关教练信息'
            ];
            return json_encode($date);
        }

    }
}