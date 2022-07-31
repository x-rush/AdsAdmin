<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Exception;
use think\Validate;

class TrainOrderapi extends Controller
{
    public function index(){
        $list = Db::table('train_order')->field('toid,trid,uid')->select();
        
        return json_encode($list);

    }

    public function getTrainorder(){
         $id=input('param.id');
        if(empty($id)){
            $date=[
                'error'=>412,
                'msg'=>'未接收到想要获取的训练标识'
            ];
            return json_encode($date);
        }

        $info = Db::table('train_order')->where('toid',$id)->find();
        if(!$info){
            $date=[
                'error'=>404,
                'msg'=>'获取失败'
            ];
            return json_encode($date);
        }
       
        return json_encode($info);
    }


    public function trainorderSearch(){
        $key=input('param.key');
        $re=db('train_order')->where('uid','like',"%$key%")->select();
        if($re){
            
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