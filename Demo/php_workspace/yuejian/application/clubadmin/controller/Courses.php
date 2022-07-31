<?php
namespace app\clubadmin\controller;

use think\Controller;
use think\Db;
use think\Exception;
use think\Validate;

class Courses extends Controller
{
    public function index(){
        $list = Db::table('course')->field('coid,coname,copic,create_at')->select();
        for($i=0;$i<count($list);$i++){
            $list[$i]['copic']='/static/adminMSI/posters/'.$list[$i]['copic'];
//  
        }
        return json_encode($list);

    }

    public function getCourse(){
         $id=input('param.id');
        if(empty($id)){
            $date=[
                'error'=>412,
                'msg'=>'未接收到想要获取的课程标识'
            ];
            return json_encode($date);
        }

        $info = Db::table('course')->where('coid',$id)->find();
        if(!$info){
            $date=[
                'error'=>404,
                'msg'=>'获取失败'
            ];
            return json_encode($date);
        }
        $info['copic']='/static/adminMSI/posters/'.$info['copic'];
        return json_encode($info);
    }


    public function courseSearch(){
        $key=input('param.key');
        $re=db('course')->where('coname','like',"%$key%")->select();
        if($re){
            for($i=0;$i<count($re);$i++){
                $re[$i]['copic']='/static/adminMSI/posters/'.$re[$i]['copic'];
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