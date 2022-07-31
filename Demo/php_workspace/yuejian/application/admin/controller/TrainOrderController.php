<?php
namespace app\admin\controller;

use app\admin\model\TrainOrder;

use think\Db;
use think\Paginator;
use think\Request;
use think\Session;


class TrainOrderController extends BaseController{
	public function index()
    {
        $t=Db::table('train_order')
        ->alias('a')
        ->join('train t','a.trid = t.trid')
        ->join('users u','a.uid = u.uid')
        ->select();
        $this->assign('TrainOrder',$t);
        // $result=array(
        //       // 'code'=>$code,
        //       // 'message'=>$message,
        //       // 'data'=>$data 
        //     "trid"=>input("param.trid"),
        //     "trname"=>input("param.trname"),
        //     "trintro"=>input("param.trintro"),
        //     "trpic"=>input("param.trpic"),
        //     "trdate"=>input("param.trdate"),
        //     "traddress"=>input("param.traddress"),
        //     "price"=>input("param.price"),
        //     );
        //     //输出json
        //     echo json_encode($result);
        //     exit;
        return $this->fetch('train_order/index');
    }
    public function train_orderadd(Request $request)
    {
        //对数据进行过滤，防止未知的用户输入风险（sql注入、恶意输入）
//        $request->filter(['strip_tags','htmlspecialchars']);
        $data = $request->post();
        // dump($data);
        // die();
        $file = request()->file('pic');
        
        $ac=new TrainOrder();
        $result=$ac->save($data);

        if (!$result) {
            // 验证失败 输出错误信息
            Session::flash('train_ordererror',$ac->getError());
            $this->redirect('admin/train_order');
            
        } else {
            Session::flash('train_ordersuccess','添加成功');
            $this->redirect('admin/train_order');
        }

    }
    public function train_orderdel(){
        $id=input('param.toid');
        
//        $re=Type::where('tid',$id)->delete();
        Db::startTrans();
        $re=TrainOrder::destroy($id);
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
    public function train_orderedit(){
        # code...
        $toid=input("param.toid");
        $train_order=Train::get($toid);
        echo json_encode($train_order);
    }
    public function train_orderupdate(){
        # code...
        $data=[
            "trid"=>input("param.trid"),
            "trname"=>input("param.trname"),
            "trintro"=>input("param.trintro"),
            
            "trdate"=>input("param.trdate"),
            "traddress"=>input("param.traddress"),
            "price"=>input("param.price"),
        ];
        $exist=TrainOrder::where('trname',$data["trname"])->Count();
        if($exist>0){
            Session::flash('trainerror',"该培训已存在");
            $this->redirect('admin/train');
        }else{
            if(Train::update($data)->where('trid',$data["trid"])){
                Session::flash('trainsuccess',"修改成功");
                $this->redirect('admin/train');
            }else{
                Session::flash('trainerror',"修改失败");
                $this->redirect('admin/train');
            }
        }
    }

}