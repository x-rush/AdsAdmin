<?php
namespace app\clubadmin\controller;

use app\clubadmin\model\Course;
use app\clubadmin\model\Login;
use app\clubadmin\model\Type;
use think\Db;
use think\Paginator;
use think\Request;
use think\Session;

class Index extends BaseController
{
    public function index()
    {

        $cadminid=Session('cadminid');
        $cid=Db::name("club")->where('cadminid',$cadminid)->value('cid');


        

        $t=Db::name("trainer")->where('cid',$cid)->select();
        $this->assign("trainer",$t);
        $subsql=Db::table('trainer')->field('trid,tname,cid')->group('trid')->buildSql();
        $ac=Db::table('course')
            ->alias('a')
            ->join([$subsql=>'b'],'a.trid = b.trid')
            ->where('b.cid',$cid)
            ->select();
        $this->assign('course',$ac);
        return $this->fetch('index/empty');
    }
    public function add()
    {
         $cadminid=Session('cadminid');
         $cid=Db::name("club")->where('cadminid',$cadminid)->value('cid');

        

        $info="";
        $pic = request()->file('pic');
        if($pic)
        {
            $info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'adminMSI'.DS.'posters');
           if ($info == false) {
                $this->$pic->getError();
            }    
        }
        if(request()->isPost()){
            $data=[
                "coname"=>input("param.coname"),
                "cointro"=>input("param.cointro"),
                "copic" =>empty($info)?'default.jpg':$info->getFilename(),
                "trid"=>input("param.trainer"),
                "create_at"=>date("Y-m-d-h-m-s"),
                "update_at"=>date("Y-m-d-h-m-s"),
            ];
        

            if(Db::name("course")->insert($data))
                $this->success("添加课程成功");
                else
                    $this->error("添加课程失败");
            }
    }
    public function edit(){
        # code...
        $coid=input("param.coid");
        $type=Type::get($coid);
        echo json_encode($type);
    }

    public function typedel(){
        $id=input('param.coid');
        $p=Db::name("course")->where('coid',$id)->value('pic');
        unlink(ROOT_PATH . 'public' . DS . 'static' . DS .'adminMSI'. DS . 'posters/'.$p);
        Db::startTrans();
        $re=Type::destroy($id);
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

    public function lessonupdate(){
        $info="";
        $pic = request()->file('pic');
        if($pic)
        {
            $info = $pic->rule("uniqid")->validate(["size"=>3000000,"ext"=>"jpg,png,gif"])->move(ROOT_PATH . 'public' . DS . 'static'.DS.'adminMSI'.DS.'posters');
            if ($info == false) {
                $this->$pic->getError();
            }   
        }

        if(request()->isPost()){
            if(empty($info)){
                $data=[
                "coid"=>input("param.coid"),
                "coname"=>input("param.coname"),
                "cointro"=>input("param.cointro"),
                "trid"=>input("param.trainer"),
                "update_at"=>date("Y-m-d-h-m-s")
                ];
                if(Db::name("course")->update($data))
                    $this->success("修改课程成功");
                else
                    $this->error("修改课程失败");
            }
        else{

            $data=[
                "coid"=>input("param.coid"),
                "coname"=>input("param.coname"),
                "cointro"=>input("param.cointro"),
                "copic" =>empty($info)?'default.jpg':$info->getFilename(),
                "trid"=>input("param.trainer"),
                "update_at"=>date("Y-m-d-h-m-s")
            ];
            if(Db::name("course")->update($data))
                $this->success("修改课程成功");
                else
                    $this->error("修改课程失败");
            }
        }
    }

    public function cDel(){
        $id=input('param.coid');
        $p=Db::name("course")->where('coid',$id)->value('copic');
        unlink(ROOT_PATH . 'public' . DS . 'static' . DS .'adminMSI'. DS . 'posters/'.$p);
        Db::startTrans();
        $re=Course::destroy($id);
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

    public function getUrl(Request $req){
        //获取域名
        dump($req->domain());
        //获取目录
        dump($req->url(true));
        echo $req->path();
        echo $req->controller();
        //获取根目录
        dump($req->baseFile());

        dump($req->ip());
    }
    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
//    public function update(Request $request, $id)
//    {
//        //
//    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
