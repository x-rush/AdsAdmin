<?php
namespace app\admin\controller;

use app\admin\model\Prize;
use app\admin\model\Login;
use app\admin\model\Type;
use think\Db;
use think\Paginator;
use think\Request;
use think\Session;

class PrizeController extends BaseController
{
	public function index()
    {
        $p=Prize::all();
//        $type=Db::name('type')->order('tid desc')->paginate(2);
        $this->assign('Prize',$p);
        // $result=array(
        //       // 'code'=>$code,
        //       // 'message'=>$message,
        //       // 'data'=>$data 
        //     "prid"=>input("param.prid"),
        //     "prname"=>input("param.prname"),
        //     "printro"=>input("param.printro"),
        //     "value"=>input("param.value"),
        //     "prpic"=>input("param.prpic"),
        //     );
        //     //输出json
        //     echo json_encode($result);
        //     exit;
        return $this->fetch('prize/index');
    }
    public function prizeadd(Request $request)
    {
        //对数据进行过滤，防止未知的用户输入风险（sql注入、恶意输入）
//        $request->filter(['strip_tags','htmlspecialchars']);
        $data = $request->post();
        // dump($data);
        // die();
        $file = request()->file('prpic');
        if($file){
            //上传
            $info = $file->rule('uniqid')->move(ROOT_PATH . 'public' . DS . 'static' . DS . 'poster');
            if ($info) {
                $pic = $info->getFilename();
                $data['prpic'] = $pic;
            }
            else{
                Session::flash('pirzeerror','上传海报失败');
                $this->redirect('admin/prize');
            }
        }
        $ac=new Prize();
//        $re=$lesson->data($data)->save();
         $result=$ac->validate(true)->save($data);
         // $result=$ac->save($data);
         // if($result)
         //  $this->redirect('admin/prize');
        if (false === $result) {
            // 验证失败 输出错误信息
            Session::flash('prizeerror',$ac->getError());
            $this->redirect('admin/prize');
            
        } else {
            Session::flash('prizesuccess','添加成功');
            $this->redirect('admin/prize');
        }

    }
    public function prizedel(){
        $id=input('param.prid');
//        $re=Type::where('tid',$id)->delete();
        Db::startTrans();
        $re=Prize::destroy($id);
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
    public function prizeedit(){
        # code...
        $prid=input("param.prid");
        $prize=Prize::get($prid);
        echo json_encode($prize);
    }
    public function prizeupdate(){
        # code...
        $data=[
            "prid"=>input("param.prid"),
            "prname"=>input("param.prname"),
            "printro"=>input("param.printro"),
            "value"=>input("param.value"),
        ];
        $exist=Prize::where('prname',$data["prname"])->Count();
//        if($exist>0){
//            Session::flash('prizeerror',"该奖品已存在");
//            $this->redirect('admin/prize');
//        }else{
            if(Prize::update($data)->where('prid',$data["prid"])){
                Session::flash('prizesuccess',"修改成功");
                $this->redirect('admin/prize');
            }else{
                Session::flash('prizeerror',"修改失败");
                $this->redirect('admin/prize');
            }
//        }
    }

}