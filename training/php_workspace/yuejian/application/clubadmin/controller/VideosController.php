<?php
namespace app\clubadmin\controller;

use app\clubadmin\model\Videos;
use think\Db;
use think\Session;

class VideosController extends BaseController
{
    public function index()
    {

        $cadminid=Session('cadminid');
        $cid=Db::name("club")->where('cadminid',$cadminid)->value('cid');
        $trid=Db::name("trainer")->where('cid',$cid)->select();
        $this->assign("trid",$trid);
//        $coid=Db::query("select * from course c,trainer t where c.trid=t.trid and t.cid=$cid order by coid desc");
       // $coid=Db::table('course')->alias('c')->join('trainer t','c.trid = t.cid')->order('coid desc')->select();
        $coid=Db::table('course')->alias('c')->join('trainer t','c.trid = t.trid')->order('coid desc')->select();
        $this->assign('course',$coid);


      
        $subsql=Db::table('course')->field('coid,coname,trid')->group('coid')->buildSql();
        $subsql2=Db::table('trainer')->field('trid')->where('cid',$cid)->group('trid')->buildSql();
        $video=Db::table('video')
            ->alias('a')
            ->join([$subsql=>'b'],'a.coid = b.coid')
            ->join([$subsql2=>'c'],'b.trid=c.trid')
            ->select();
        $this->assign('video',$video);
//        dump($video);
        return $this->fetch('video/index');
    }
     public function add()
    {
        $info="";
        $pic = request()->file('pic');
        if($pic)
        {
            $info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'adminMSI'.DS.'vposters');
           if ($info == false) {
                $this->$pic->getError();
            }   
        }
        if(request()->isPost()){
            $data=[
                "vname"=>input("param.vname"),
                "vintro"=>input("param.vintro"),
                "pic" =>empty($info)?'default.jpg':$info->getFilename(),
                "coid"=>input("param.course"),
                "create_at"=>date("Y-m-d-h-m-s"),
                "update_at"=>date("Y-m-d-h-m-s"),
                "address"=>input("param.path")
             

            ];

            if(Db::name("video")->insert($data))
                $this->success("添加视频成功");
                else
                    $this->error("添加视频失败");
            }
    }

     public function watch(){
        $vid=input("param.vid");
        $info=Db::name("video")->find($vid);
        echo json_encode($info);
    }
 

    public function vEdit(){
        $vid=input("param.vid");
        $info=Db::name("video")->find($vid);
        echo json_encode($info);
    }

    public function vDel(){
        $id=input('param.vid');
        $p=Db::name("video")->where('vid',$id)->value('pic');
        unlink(ROOT_PATH . 'public' . DS . 'static' . DS .'adminMSI'. DS . 'vposters/'.$p);
        Db::startTrans();
        $re=Videos::destroy($id);
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

    public function vupdate(){
         $info="";
            $pic = request()->file('pic');
            if($pic)
        {
            $info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'adminMSI'.DS.'vposters');
            if ($info == false) {
                $this->$pic->getError();
            }    
        }

            if(request()->isPost()){
                if(empty($info)){
                    $data=[
                        "vid"=>input("param.vid"),
                        "vname"=>input("param.vname"),
                        "coid"=>input("param.course"),
                        "vintro"=>input("param.vintro"),
                        "update_at"=>date("Y-m-d-h-m-s"),
                        "address"=>input("param.path"),
                    ];
                    if(Db::name("video")->update($data))
                        $this->success("修改视频成功");
                    else
                        $this->error("修改视频失败");
                }
                $data=[
                    "vid"=>input("param.vid"),
                    "vname"=>input("param.vname"),
                    "coid"=>input("param.course"),
                    "vintro"=>input("param.vintro"),
                    "update_at"=>date("Y-m-d-h-m-s"),
                    "address"=>input("param.path"),
                    "pic" =>empty($info)?'default.jpg':$info->getFilename(),
                  
                ];
                if(Db::name("video")->update($data))
                    $this->success("修改视频成功");
                    else
                        $this->error("修改视频失败");
                }
        }
}