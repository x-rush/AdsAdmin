<?php
namespace app\admin\controller;

use app\admin\model\Train;

use think\Db;
use think\Paginator;
use think\Request;
use think\Session;


class TrainController extends BaseController{

	public function index()
    {
        $t=Train::all();
//        $type=Db::name('type')->order('tid desc')->paginate(2);
        $this->assign('Train',$t);
   //      $result=array(
			//   // 'code'=>$code,
			//   // 'message'=>$message,
			//   // 'data'=>$data 
			// "trid"=>input("param.trid"),
   //          "trname"=>input("param.trname"),
   //          "trintro"=>input("param.trintro"),
   //          "trdate"=>input("param.trdate"),
   //          "traddress"=>input("param.traddress"),
   //          "price"=>input("param.price"),
			// );
			// //输出json
			// echo json_encode($result);
			// exit;
        return $this->fetch('train/index');
    }
    public function trainadd(Request $request)
    {
        //对数据进行过滤，防止未知的用户输入风险（sql注入、恶意输入）
//        $request->filter(['strip_tags','htmlspecialchars']);
        $data = $request->post();
        // dump($data);
        // die();
        $file = request()->file('trpic');
        if($file){
            //上传
            $info = $file->rule('uniqid')->move(ROOT_PATH . 'public' . DS . 'static' . DS . 'poster');
            if ($info) {
                $pic = $info->getFilename();
                $data['trpic'] = $pic;
            }
            else{
                Session::flash('trainerror','上传活动海报失败');
                $this->redirect('admin/train');
            }
        }
        $ac=new Train();
        $result=$ac->validate(true)->save($data);

        if (false === $result) {
            // 验证失败 输出错误信息
            Session::flash('trainerror',$ac->getError());
            $this->redirect('admin/train');
            
        } else {
            Session::flash('trainsuccess','添加成功');
            $this->redirect('admin/train');
        }

    }
    public function traindel(){
        $id=input('param.trid');
        
//        $re=Type::where('tid',$id)->delete();
        Db::startTrans();
        $re=Train::destroy($id);
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
    public function trainedit(){
        # code...
        $trid=input("param.trid");
        $train=Train::get($trid);
        echo json_encode($train);
    }
    public function trainupdate(){
        # code...
        $data=[
            "trid"=>input("param.trid"),
            "trname"=>input("param.trname"),
            "trintro"=>input("param.trintro"),
            
            "trdate"=>input("param.trdate"),
            "traddress"=>input("param.traddress"),
            "price"=>input("param.price"),
        ];
        $exist=Train::where('trname',$data["trname"])->Count();
//        if($exist>0){
//            Session::flash('trainerror',"该培训已存在");
//            $this->redirect('admin/train');
//        }else{
            if(Train::update($data)->where('trid',$data["trid"])){
                Session::flash('trainsuccess',"修改成功");
                $this->redirect('admin/train');
            }else{
                Session::flash('trainerror',"修改失败");
                $this->redirect('admin/train');
            }
//        }
    }

}
