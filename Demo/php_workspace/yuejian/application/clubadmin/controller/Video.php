<?php
namespace app\clubadmin\controller;

use think\Controller;
use think\Db;
use think\Exception;
use think\Validate;

class Video extends Controller
{
    public function index(){
        $list = Db::table('video')->field('vid,vname,pic,address')->select();
        for($i=0;$i<count($list);$i++){
            $list[$i]['pic']='/static/adminMSI/vposters/'.$list[$i]['pic'];
//  
        }
        return json_encode($list);

    }

    public function getVideo(){
         $id=input('param.id');
        if(empty($id)){
            $date=[
                'error'=>412,
                'msg'=>'未接收到想要获取的视频标识'
            ];
            return json_encode($date);
        }

        $info = Db::table('video')->where('vid',$id)->find();
        if(!$info){
            $date=[
                'error'=>404,
                'msg'=>'获取失败'
            ];
            return json_encode($date);
        }
        $info['pic']='/static/adminMSI/vposters/'.$info['pic'];
        return json_encode($info);
    }


    public function videoSearch(){
        $key=input('param.key');
        $re=db('video')->where('vname','like',"%$key%")->select();
        if($re){
            for($i=0;$i<count($re);$i++){
                $re[$i]['pic']='/static/adminMSI/vposters/'.$re[$i]['pic'];
            }
            return json_encode($re);
        }else{
            $date=[
                'error'=>404,
                'msg'=>'未查找到相关视频信息'
            ];
            return json_encode($date);
        }

    }
}