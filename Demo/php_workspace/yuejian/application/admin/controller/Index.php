<?php
namespace app\admin\controller;

use app\admin\model\Activity;
use think\Db;
use think\Paginator;
use think\Request;
use think\Session;

class Index extends BaseController
{
    public function index()
    {
        $ac=Activity::all();
//        $type=Db::name('type')->order('tid desc')->paginate(2);
        $this->assign('activity',$ac);
        return $this->fetch('index/empty');
    }
    public function edit(){
        # code...
        $tid=input("param.aid");
        $type=Activity::get($tid);
        echo json_encode($type);
    }

    public function orderList($id){
        $aid=$id;
        $order=Db::table('activity')
                ->alias('a')
                ->join('activity_order ao','a.aid = ao.aid')
                ->join('users u','u.uid = ao.uid')
                ->field('aoid,ao.create_at,uname,u.pic')
                ->where('a.aid',$aid)
                ->paginate(5);
//        $type=Db::name('type')->order('tid desc')->paginate(2);
        $this->assign('order',$order);
        $this->assign('aid',$aid);
        return $this->fetch('index/activityorder');
    }

    public function activityDel(){
        $id=input('param.aid');
//        $re=Type::where('tid',$id)->delete();
        $pic=Activity::where('aid',$id)->value('pic');
        $filename=ROOT_PATH . 'public' . DS . 'static' . DS . 'poster/'.$pic;
        if(unlink($filename)) {
            Db::startTrans();
            $re=Activity::destroy($id);
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
        }else{
            Session::flash('lessonerror','删除失败，无法删除海报');
            $this->redirect('admin/lesson');
        }

    }

    public function activityAdd(){
        $data=request()->post();

        $file=request()->file('pic');
        if($file){
            //上传
            $info = $file->rule('uniqid')->move(ROOT_PATH . 'public' . DS . 'static' . DS . 'poster');
            if ($info) {
                $pic = $info->getFilename();
                $data['pic'] = $pic;
            }
            else{
                Session::flash('activityerror','上传活动海报失败');
                return $this->fetch('index/empty');
            }
        }
        $ac=new Activity();
//        $re=$lesson->data($data)->save();
        $result=$ac->validate(true)->save($data);
        if (false === $result) {
            // 验证失败 输出错误信息
            Session::flash('activityerror',$ac->getError());
            $this->redirect('index/empty');
        } else {
            Session::flash('activitysuccess','添加成功');
            $this->redirect('index/empty');
        }
    }
    public function activityUpdate(){
        $data=request()->post();
        $file = request()->file('pic');
        $ac=new Activity();
        if($file){
            // 先删除原头像
            $pic=Activity::where('aid',$data['aid'])->value('pic');
            $filename=ROOT_PATH . 'public' . DS . 'static' . DS . 'poster/'.$pic;
            if(unlink($filename)) {
                //上传新头像
                $info = $file->rule('uniqid')->move(ROOT_PATH . 'public' . DS . 'static' . DS . 'poster');
                if ($info) {
                    $pic = $info->getFilename();
                    $data['pic'] = $pic;
                }
            }else{
                Session::flash('activityerror','海报更新失败');
                $this->redirect('index/empty');
            }
        }
        $result=$ac->validate(true)->save($data,['aid'=>$data['aid']]);
        if (false === $result) {
            // 验证失败 输出错误信息
            Session::flash('activityerror',$ac->getError());
            $this->redirect('index/empty');
        } else {
            Session::flash('activitysuccess','更新成功');
            $this->redirect('index/empty');
        }
    }

    public function getUrl(Request $req){
        //获取域名
//        dump($req->domain());
        dump($_SERVER['HTTP_HOST']);
        dump(dirname(dirname($req->url(true))));
        $pos= strpos($req->url(true),"public",0);
        dump(substr($req->url(true),0,$pos));
//        dump(basename($req->url(true)));

        dump(parse_url($req->url(true)));
        //获取目录
        dump($req->url(true));
        echo $req->baseUrl();
        $date='08/26/2018';
        echo preg_replace('/(\d+)\/(\d+)\/(\d+)/','$3/$1/$2',$date);
//        echo $req->controller();
//        echo '<br>';
//        echo 'public' . DS . 'static' . DS . 'poster';
//        //获取根目录
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
