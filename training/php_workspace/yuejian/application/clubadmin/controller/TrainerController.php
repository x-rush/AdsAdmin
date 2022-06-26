<?php
namespace app\clubadmin\controller;

use app\clubadmin\model\Trainer;
use think\Controller;
use think\Db;
use think\Session;

class TrainerController extends BaseController
{
    public function index(){
        $cadminid=Session('cadminid');
        $cid=Db::name("club")->where('cadminid',$cadminid)->value('cid');

        $trainer=Db::table('trainer')->alias('t')
            ->join('club c','t.cid = c.cid')
            ->field('cname,t.*')
            ->where('c.cid',$cid)->select();
        $this->assign('trainer',$trainer);
        return $this->fetch('trainer/index');
    }
    public function add(){

         $cadminid=Session('cadminid');
         $cid=Db::name("club")->where('cadminid',$cadminid)->value('cid');


        $tname=input('param.tname');
        $num=Db::name("trainer")->where("tname='$tname'")->count();
        
        if($num>0){
            $this->error("该教练已存在");
            //把值存入数据库
        }
        $info="";
        $pic = request()->file('pic');
        if($pic)
        {
            $info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'adminMSI'.DS.'thead');
            if ($info == false) {
                $this->$pic->getError();
            }   
        }
        if(request()->isPost()){
            if(!$tname){
                $this->error("请输入名字");
            }
            $num=Db::name("trainer")->where("tname='$tname'")->count();
        
        if($num>0){
            $this->error("该教练已存在");
            //把值存入数据库
        }
            else{
            $data=[
                "tname"=>input("param.tname"),
                "tsex"=>input("param.gender"),
                "tintro"=>input("param.tintro"),
                "tpic" =>empty($info)?'default.jpg':$info->getFilename(),
                "cid"=>$cid,
                "hittimes"=>0,
                "create_at"=>date("Y-m-d-h-m-s"),
                "update_at"=>date("Y-m-d-h-m-s")

            ];

            if(Db::name("trainer")->insert($data))
                $this->success("添加教练成功");
                else
                    $this->error("添加教练失败");
        }
    }
    }
    public function tredit(){
        $trid=input("param.trid");
        $info=Trainer::get($trid);
        echo json_encode($info);

    }

    public function trdel(){
        $id=input('param.trid');
        Db::startTrans();
        $re=Trainer::destroy($id);
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

    public function trupdate(){
        $trid=input('param.trid');
        $tname=input('param.tname'); 
         if(!$tname){
                $this->error("请输入名字");
            }
        $info="";
        $pic = request()->file('pic');
        if($pic)
        {
            $info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'adminMSI'.DS.'thead');
           if ($info == false) {
                $this->$pic->getError();
            }   
        }
        if(request()->isPost()){
          
       if(empty($info)){
                    $data=[
                        "trid"=>input("param.trid"),
                        "tname"=>input("param.tname"),
                         "tsex"=>input("param.gender"),
                         "tintro"=>input("param.tintro"),
                         "update_at"=>date("Y-m-d-h-m-s")
                    ];
                    if(Db::name("trainer")->update($data))
                        $this->success("修改教练成功");
                    else
                        $this->error("修改教练失败");
                }
            else{
            $data=[
                "trid"=>input("param.trid"),
                "tname"=>input("param.tname"),
                "tsex"=>input("param.gender"),
                "tintro"=>input("param.tintro"),
                "tpic" =>empty($info)?'default.jpg':$info->getFilename(),
                "update_at"=>date("Y-m-d-h-m-s"),
                
            ];

            if(Db::name("trainer")->update($data))
                $this->success("修改教练成功");
                else
                    $this->error("修改教练失败");
        }
    }
    }
}