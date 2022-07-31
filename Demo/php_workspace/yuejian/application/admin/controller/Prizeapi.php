<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Exception;
use think\Validate;

class Prizeapi extends Controller
{
    public function index(){
        $list = Db::table('prize')->field('prid,prname,printro,prpic')->select();
        for($i=0;$i<count($list);$i++){
            $list[$i]['prpic']='/static/poster/'.$list[$i]['prpic'];
//  
        }
        return json_encode($list);

    }

    public function getPrize(){
         $id=input('param.id');
        if(empty($id)){
            $date=[
                'error'=>412,
                'msg'=>'未接收到想要获取的训练标识'
            ];
            return json_encode($date);
        }

        $info = Db::table('prize')->where('prid',$id)->find();
        if(!$info){
            $date=[
                'error'=>404,
                'msg'=>'获取失败'
            ];
            return json_encode($date);
        }
        $info['prpic']='/static/poster/'.$info['prpic'];
        return json_encode($info);
    }


    public function prizeSearch(){
        $key=input('param.key');
        $re=db('prize')->where('prname','like',"%$key%")->select();
        if($re){
            for($i=0;$i<count($re);$i++){
                $re[$i]['prpic']='/static/poster/'.$re[$i]['prpic'];
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