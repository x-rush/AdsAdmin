<?php
class MessageAction extends Action {
    public function index(){
        $this->assign("title","帖子管理");
        $where['status']=array('eq','1');
        $mod=D("Message");
        import("ORG.Util.Page");    //导入分页类
        $count=$mod->where($where)->count();
        $page=new Page($count,10);  //创建分页对象
        //查询遍历五个精华帖
        $list=($mod->where('isbest=1')->order('addtime desc')->limit(5)->select());
        foreach($list as &$vo){
            $model=M('Users');
            $name=$model->field('username,name')->where("id={$vo['uid']}")->find();
            $modell=D('Comm');
            $num=$modell->where("mid={$vo['id']}")->count();
            $vo['plnum']=$num;
            if($name['name']!=''){
                $vo['username']=$name['name'];
            }else{
                $vo['username']=$name['username'];
            }
            $hh=stripos($vo['content'],'src="/eschool/Public/Uploads/editor');
            if(!empty($hh)){
                $vo['img']='y';
            }else{
                $vo['img']='n';
            }
        }
        //查询遍历最新贴
        $list2=($mod->where($where)->order('addtime desc')->limit($page->firstRow.','.$page->listRows)->select());
        foreach($list2 as &$vo2){
            $model2=M('Users');
            $name2=$model2->field('username,name')->where("id={$vo2['uid']}")->find();
            $modell2=D('Comm');
            $num2=$modell2->where("mid={$vo2['id']} and pid='0'")->count('mid');
            $vo2['plnum']=$num2;
            if($name2['name']!=''){
                $vo2['username']=$name2['name'];
            }else{
                $vo2['username']=$name2['username'];
            }
            $hh2=stripos($vo2['content'],'src="/eschool/Public/Uploads/editor');
            if(!empty($hh2)){
                $vo2['img']='y';
            }else{
                $vo2['img']='n';
            }
        }
        $this->assign('list',$list);
        $this->assign('list2',$list2);
        $this->assign("pageinfo",$page->show());
        $this->assign("where",$_GET);
        //===============================================  
        if($_SESSION[C('USER_AUTH_KEY')]){
            //调用查询hfnum()方法
            $this->hfnum();
        }
        $this->person();        //调用person方法,显示活跃用户信息
        $this->keyword();       //调用keyword方法，显示所有非一级分类
        $this->display("index");
    }
    //大家都在看（热门贴搜索）
    public function hot(){
        $this->assign("title","帖子管理");
        $mod=D("Message");
        $list=($mod->where('status=1')->order('scan desc')->limit(15)->select());
        foreach($list as &$vo){
            $model=M('Users');
            $name=$model->field('username,name')->where("id={$vo['uid']}")->find();
            $modell=D('Comm');
            $num=$modell->where("mid={$vo['id']} and pid='0'")->count('mid');
            $vo['plnum']=$num;
            if($name['name']!=''){
                $vo['username']=$name['name'];
            }else{
                $vo['username']=$name['username'];
            }
            $hh=stripos($vo['content'],'src="/eschool/Public/Uploads/editor');
            if(!empty($hh)){
                $vo['img']='y';
            }else{
                $vo['img']='n';
            }
        }
        $this->person();        //调用person方法
        $this->assign('list',$list);
        $this->assign("where",$_GET);
        $this->keyword();       //调用keyword方法，显示所有非一级分类
        $this->display();
    }
    //分类搜索浏览
    public function index2(){
        $mod=D("Message");
        //搜索条件
        if($_REQUEST['pid']){
            $where['keyword']=array(array('eq',"{$_REQUEST['pid']}"),array('like',"%,{$_REQUEST['pid']}"),array('like',"{$_REQUEST['pid']},%"),array('like',"%,{$_REQUEST['pid']},%"),'or');
        }
        if($_GET['q']){
            $where['title'] = array("like","%{$_GET['q']}%");
        }
        $where['status']=array('eq','1');
        
        import("ORG.Util.Page");    //导入分页类
        $count=$mod->where($where)->count();
        $page=new Page($count,15);  //创建分页对象
        $list=$mod->where($where)->order('addtime desc')->limit($page->firstRow.','.$page->listRows)->select();
        foreach($list as &$vo){
            $model=M('Users');
            $name=$model->field('username,name')->where("id={$vo['uid']}")->find();
            $modell=D('Comm');
            $num=$modell->where("mid={$vo['id']} and pid='0'")->count('mid');
            $vo['plnum']=$num;
            if($name['name']!=''){
                $vo['username']=$name['name'];
            }else{
                $vo['username']=$name['username'];
            }
            $hh=stripos($vo['content'],'src="/eschool/Public/Uploads/editor');
            if(!empty($hh)){
                $vo['img']='y';
            }else{
                $vo['img']='n';
            }
        }
        //返回标签名
        $kw=M("Cat")->find($_GET['pid']);
        $this->assign('kname',$kw);
        $this->person();        //调用person方法
        $this->assign('list',$list);
        $this->assign('list3',$list);
        $this->assign("where",$_GET);
        $this->assign("pageinfo",$page->show());
        $this->assign("pageinfo3",$page->show());
        $this->keyword();       //调用keyword方法，显示所有非一级分类
        //模板输出
        if(!$_GET['r']){
            if($_GET['q'] && isset($_GET['pid'])){
                if($_GET['pid']=='0' && $_GET['q']){
                    $this->display();
                }
            }else if(!$_GET['pid'] && !$_GET['q']){
                $this->display();
            }else{
                if($_GET['pid']){
                    $this->display();
                }
            }
        }
    }
    public function myques(){
        if($_SESSION[C('USER_AUTH_KEY')]['id']){
            $uid=$_SESSION[C('USER_AUTH_KEY')]['id'];
            if($_GET['uid']){
                $uid=$_GET['uid'];
            }
            $user=M('users');
            $res=$user->where("id={$uid}")->find();
            $res2=M('Friend')->where("fid='{$_GET['uid']}' and uid='{$_SESSION[C('USER_AUTH_KEY')]['id']}'")->find();
            if(!empty($res2)){
                $res['like']='y';
            }else{
                $res['like']='n';
            }
            //输出当前用户信息
            $this->assign('user',$res);
            //执行统计未处理消息方法
            $this->hfnum();
        }else{
            if(!$_GET['uid']){
                $this->redirect('Users/login');
                die;
            }else{
                $uid=$_GET['uid'];
                $user=M('users');
                $res=$user->where("id={$uid}")->find();
                $res['like']='n';
                $this->assign('user',$res);
            }
        }
        //统计帖子数
        $mm=D("Message");
        $mnum=$mm->where("uid={$uid} and status='1'")->count();
        $this->assign('mnum',$mnum);
        //=======================问题===========================
        $mod2=D("Question");
        $where['uid']=array('eq',$uid);     //绑定当前用户id
        $where['status']=array('eq',1);     //绑定当前用户id
        import("ORG.Util.Page");    //导入分页类
        $count2=$mod2->where($where)->count();       //获取总数据条数
        $page2=new Page($count2,10);  //创建分页对象
        $list2=($mod2->where($where)->order('addtime desc')->limit($page2->firstRow.','.$page2->listRows)->select());
        //拼接教师名
        foreach($list2 as &$vo){
            $modell=M('Users');
            $tname=$modell->where("id={$vo['tid']}")->find();
            if($tname['name']!=''){
                $vo['tname']=$tname['name'];
            }else{
                $vo['tname']=$tname['username'];
            }
        }
        //执行统计未处理消息方法
        $this->assign('mnum2',$count2);
        $this->assign('list2',$list2);
        $this->assign("pageinfo2",$page2->show());

        $this->assign("where",$_GET);

        $this->person();        //调用person方法
        $this->keyword();       //调用keyword方法，显示所有非一级分类
        $this->display('myques');
    }
    public function mymess(){
        $mod=D("Message");
        if($_SESSION[C('USER_AUTH_KEY')]['id']){
            $uid=$_SESSION[C('USER_AUTH_KEY')]['id'];
            if($_GET['uid']){
                $uid=$_GET['uid'];
            }
            $user=M('users');
            $res=$user->where("id={$uid}")->find();
            $res2=M('Friend')->where("fid='{$_GET['uid']}' and uid='{$_SESSION[C('USER_AUTH_KEY')]['id']}'")->find();
            if(!empty($res2)){
                $res['like']='y';
            }else{
                $res['like']='n';
            }
            //输出当前用户
            $this->assign('user',$res);
            //执行统计未处理消息方法
            $this->hfnum();
        }else{
            if(!$_GET['uid']){
                $this->redirect('Users/login');
                die;
            }else{
                $uid=$_GET['uid'];
                $user=M('users');
                $res=$user->where("id={$uid}")->find();
                $res['like']='n';
                $this->assign('user',$res);
            }
        }
        $where['uid']=array('eq',$uid);     //绑定当前用户id
        $where['status']=array('eq',1);     //绑定当前用户id
        import("ORG.Util.Page");    //导入分页类
        $count=$mod->where($where)->count();       //获取总数据条数
        //$count=$mod->count();
        $page=new Page($count,15);  //创建分页对象
        $list=($mod->where($where)->order('addtime desc')->limit($page->firstRow.','.$page->listRows)->select());
        foreach($list as &$vo){
            $modell=D('Comm');
            $num=$modell->where("mid={$vo['id']} and pid='0'")->count('mid');
            $vo['plnum']=$num;
            $hh=stripos($vo['content'],'src="/eschool/Public/Uploads/editor');
            if(!empty($hh)){
                $vo['img']='y';
            }else{
                $vo['img']='n';
            }
        }
        
        
        //统计提问数
        $mm2=D("Question");
        $mnum2=$mm2->where("uid={$uid} and status='1'")->count();
        $this->assign("mnum2",$mnum2);
        $this->assign('mnum',$count);
        $this->assign('list',$list);
        $this->assign("pageinfo",$page->show());
        $this->assign("where",$_GET);
        $this->person();        //调用person方法
        $this->keyword();       //调用keyword方法，显示所有非一级分类
        $this->display();
    }
    //贴吧个人首页
    public function mine(){
        $mod=D("Message");
        $mod2=D("Question");
        if($_SESSION[C('USER_AUTH_KEY')]['id']){
            $uid=$_SESSION[C('USER_AUTH_KEY')]['id'];
            if($_GET['uid']){
                $uid=$_GET['uid'];
            }
            $user=M('users');
            $res=$user->where("id={$uid}")->find();
            $res2=M('Friend')->where("fid='{$_GET['uid']}' and uid='{$_SESSION[C('USER_AUTH_KEY')]['id']}'")->find();
            if(!empty($res2)){
                $res['like']='y';
            }else{
                $res['like']='n';
            }
            //输出当前用户
            $this->assign('user',$res);
            //执行统计未处理消息方法
            $this->hfnum();
        }else{
            if(!$_GET['uid']){
                $this->redirect('Users/login');
                die;
            }else{
                $uid=$_GET['uid'];
                $user=M('users');
                $res=$user->where("id={$uid}")->find();
                $res['like']='n';
                $this->assign('user',$res);
            }
        }
        $where['uid']=array('eq',$uid);     //绑定当前用户id
        $where['status']=array('eq',1);     //绑定当前用户id
        import("ORG.Util.Page");    //导入分页类
        $count=$mod->where($where)->count();       //获取总数据条数
        $page=new Page($count,10);  //创建分页对象
        //=========================帖子=========================
        $list=($mod->where($where)->order('addtime desc')->limit($page->firstRow.','.$page->listRows)->select());
        foreach($list as &$vo){
            $modell=D('Comm');
            $num=$modell->where("mid={$vo['id']} and pid='0'")->count('mid');
            $vo['plnum']=$num;
            $hh=stripos($vo['content'],'src="/eschool/Public/Uploads/editor');
            if(!empty($hh)){
                $vo['img']='y';
            }else{
                $vo['img']='n';
            }
        }
        //==========================问题=========================
        $count2=$mod2->where($where)->count();       //获取总数据条数
        $page2=new Page($count2,10);  //创建分页对象
        $list2=($mod2->where($where)->order('addtime desc')->limit($page2->firstRow.','.$page2->listRows)->select());
        //拼接教师名
        foreach($list2 as &$vo){
            $modell=M('Users');
            $tname=$modell->where("id={$vo['tid']}")->find();
            if($tname['name']!=''){
                $vo['tname']=$tname['name'];
            }else{
                $vo['tname']=$tname['username'];
            }
        }
        //执行统计未处理消息方法
        $this->assign('mnum2',$count2);
        $this->assign('list2',$list2);
        $this->assign("pageinfo2",$page2->show());
        
        $this->assign('mnum',$count);
        $this->assign('list',$list);
        $this->assign("pageinfo",$page->show());
        $this->assign("where",$_GET);
        $this->person();        //调用person方法
        $this->keyword();       //调用keyword方法，显示所有非一级分类
        $this->display();
    }
    //贴吧个人动态浏览页
    public function mynews(){
        if($_SESSION[C('USER_AUTH_KEY')]['id']){
            $uid=$_SESSION[C('USER_AUTH_KEY')]['id'];
            if($_GET['uid']){
                $uid=$_GET['uid'];
            }
            $user=M('users');
            $res=$user->where("id={$uid}")->find();
            $this->assign('user',$res);
        }else{
            $this->redirect('Users/login');
            die;
        }
        //统计帖子数
        $mm=D("Message");
        $mnum=$mm->where("uid={$uid} and status='1'")->count();
        //统计提问数
        $mm2=D("Question");
        $mnum2=$mm2->where("uid={$uid}")->count();
        $this->assign("mnum",$mnum);
        $this->assign("mnum2",$mnum2);
        $this->person();        //调用person方法
        $this->keyword();       //调用keyword方法，显示所有非一级分类
        //执行统计未处理消息方法
        $this->hfnum();
        $this->display("mynews");
    }
    
    public function add(){
        if(!$_SESSION[C('USER_AUTH_KEY')]['id']){
            $this->redirect('Users/login');
            die;
        }
        if($_GET['qid']){
            $rr=D('Question')->find($_GET['qid']);

            $ee=explode(',',$rr['keyword']);
            $c2=D('Cat');
            foreach($ee as $vo){
                $r2=$c2->find($vo);
                $rr['cname'].=$r2['name'].',';
            }
            $this->assign('ql',$rr);
        }
        $this->person();        //调用person方法，查询出活跃用户信息
        $this->keyword();       //调用keyword方法，查询出分类信息
        $_SESSION['article_img']=array(); //定义一个用于存放上传图片信息数组变量
        $this->display("add");
    }
    public function insert(){
        $mod=D("Message");
        //自动验证判断
        $_POST['content']=trim($_POST['content']);
        if(!trim($_POST['title'])){
            $this->error("标题不能为空");
        }
        if(!$_POST['content']){
            $this->error("内容不能为空");
        }
        if(!$mod->create()){
            $this->error($mod->getError()); //输出验证错误信息
        }
        if($_SESSION[C('USER_AUTH_KEY')]['id']){
            $mod->uid=$_SESSION[C('USER_AUTH_KEY')]['id'];
        }else{
            $this->redirect('Users/login');
            die;
        }
        $mod->title=htmlspecialchars(trim($_POST['title']));
        $mod->keyword=trim($_POST['keyword'],',');
        $mod->addtime=time();               //添加时间
        if($result=$mod->add()){
            // 回调接口
			if (method_exists($this, '_tigger_insert')) {
				$mod->id = $result;
				$this->_tigger_insert($mod);
			}
            $this->redirect('Message/index');
        }else{
            $this->error("添加失败");
        }
    }

    //信息添加的回调方法，目的处理上传图片信息
	public function _tigger_insert($mod){
		$mid = $mod->id; //获取添加成功的帖子id号
		$mod2=M("Picture");
		//遍历所有上传图片
		foreach($_SESSION['article_img'] as $im){
			//使用正则来判断图片是否还存在于帖子中
			if(preg_match("/{$im['picname']}/",$_POST['content'])){
				$mod2->where("id=".$im['id'])->save(array("mid"=>$mid));
			}else{
				$mod2->delete($im['id']);   //删除数据
				//删除图片
				unlink('./Public/Uploads/article/'.date("Ym",$im['create_time'])."/".$im['picname']);
			}
		}
        $_SESSION['article_img']=array();   //清空session中的图片数据
    }
    public function _tigger_comm($mod){
        $cid = $mod->id; //获取添加成功的评论id号
		$model=M("Picture");
		//遍历所有上传图片
		foreach($_SESSION['article_img'] as $im){
			//使用正则来判断图片是否还存在于评论中
			if(preg_match("/{$im['picname']}/",$_POST['content'])){
				$model->where("id=".$im['id'])->save(array("cid"=>$cid));
			}else{
				$model->delete($im['id']);   //删除数据
				//删除图片
				unlink('./Public/Uploads/article/'.date("Ym",$im['create_time'])."/".$im['picname']);
			}
		}
        $_SESSION['article_img']=array();   //清空session中的图片数据
	}

    //定义edit方法编译edit模板修改帖子
    public function edit(){
        if($_SESSION[C('USER_AUTH_KEY')]['id']!=$_GET['uid']){
            $this->error('没有权限！');
        }else{
            $this->assign("title","帖子管理");
            $mod=D("Message");
            $list=$mod->find($_GET['id']);
            
            $rr=explode(',',$list['keyword']);
            $c2=D('Cat');
            foreach($rr as $vo){
                $r2=$c2->find($vo);
                $list['cname'].=$r2['name'].',';
            }
            $this->assign("list",$list);
            $this->person();        //调用person方法，查询出活跃用户信息
            $this->keyword();       //调用keyword方法，查询出分类信息
            $this->display("edit");
        }
    }
    //执行修改帖子方法
    public function update(){
        $mod=D("Message");
        
        //自动验证判断
        $_POST['content']=trim($_POST['content']);
        if(!trim($_POST['title'])){
            $this->error("标题不能为空");
        }
        if(!$_POST['content']){
            $this->error("内容不能为空");
        }
        if(!$mod->create()){
            $this->error($mod->getError()); //输出验证错误信息
        }
        $mod->title=htmlspecialchars(trim($_POST['title']));
        $mod->keyword=trim($_POST['keyword'],',');
        if($mod->save()){
            $this->redirect("Message/show?id={$_POST['id']}");
        }else{
            $this->error("修改失败");
        }
        //echo $mod->getLastSql();
    }
    //执行帖子的删除方法
    public function delete(){
        $mod=D("Message");
        $mod2=D('Comm');
        $res=$mod->where("id='{$_GET['id']}'")->find();
        //检索用户id
        if($_SESSION[C('USER_AUTH_KEY')]['id']!=$res['uid']){
            $this->error('没有权限！');
            die;
        }
        //检测帖子内容是否含有图片地址,有则截取图路径
        preg_match_all('/\/Public\/Uploads\/editor\/\d+\/[\w.]+/i',$res['content'],$arr);
        $res2=$mod2->where("mid='{$res['id']}'")->select();
        //检测评论内容是否含有图片地址,有则截取图路径
        foreach($res2 as $vo){
            preg_match_all('/\/Public\/Uploads\/editor\/\d+\/[\w.]+/i',$vo['content'],$aa);
            if(!empty($aa[0])){
                foreach($aa[0] as $ss){
                    $arr2[]=$ss;
                }
            }
        }
        foreach($res2 as $vo){
            $where[]=$vo['id'];
        }
        if($mod->delete($_GET['id'])){
            if(!empty($arr[0])){
                foreach($arr[0] as $vo){
                    unlink('.'.$vo);
                }
            }          
            if(!empty($arr2)){
                foreach($arr2 as $vo){
                    unlink('.'.$vo);
                }
            }
            //删除该帖子被收藏中的数据
            M("Like")->where("mid='{$_GET['id']}'")->delete();
            $this->success("删除成功",$_SERVER['HTTP_REFERER']);
        }else{
            $this->error("删除失败");
        }
    }
    //执行评论或回复的删除方法
    public function delcomm(){
        $mod=D('Comm');
        $res=$mod->where("id='{$_GET['cid']}'")->find();
        
        //检测评论内容是否含有图片地址,有则截取图路径
        preg_match_all('/\/Public\/Uploads\/editor\/\d+\/[\w.]+/i',$res['content'],$arr);
        if($mod->delete($_GET['cid'])){
            if(!empty($arr[0])){
                foreach($arr[0] as $vo){
                    //执行图片删除
                    unlink('.'.$vo);
                }
            }
            //判断并删除该评论的所有回复
            $mod->where("pid={$_GET['cid']}")->delete();
            if($_GET['id']){
                $this->redirect("Message/show?id={$_GET['id']}");
            }else{
                $this->redirect("Message/mynews");
            }
        }else{
            $this->error("删除失败");
        }
    }
    //收藏操作
    public function like(){
        if(!$_SESSION[C('USER_AUTH_KEY')]['id']){
            if($_GET['id']){
                $this->redirect('Users/login');
            }else{
                echo false;
            }
            die;
        }
        $mod=M("Like");
        $mod->uid=$_SESSION[C('USER_AUTH_KEY')]['id'];
        $mod->mid=$_POST['mid'];
        if($_POST['vv']=='n'){
            if($result=$mod->add() ){
                echo json_encode($result);
            }else{
                $this->error("收藏失败");
            }
        }else{
            if($result=$mod->where("uid={$_SESSION[C('USER_AUTH_KEY')]['id']} and mid={$_POST['mid']}")->delete() ){
                echo json_encode($result);
            }else{
                $this->error("取消收藏失败");
            }
        }
    }
    //我的收藏展示
    public function mylike(){
        if($_SESSION[C('USER_AUTH_KEY')]['id']){
            $uid=$_SESSION[C('USER_AUTH_KEY')]['id'];
            if($_GET['uid']){
                $uid=$_GET['uid'];
            }
            $user=M('users');
            $res=$user->where("id={$uid}")->find();
            $res2=M('Friend')->where("fid='{$_GET['uid']}' and uid='{$_SESSION[C('USER_AUTH_KEY')]['id']}'")->find();
            if(!empty($res2)){
                $res['like']='y';
            }else{
                $res['like']='n';
            }
            //输出用户信息
            $this->assign('user',$res);
            //执行统计未处理消息方法
            $this->hfnum();
        }else{
            if(!$_GET['uid']){
                $this->redirect('Users/login');
                die;
            }else{
                $uid=$_GET['uid'];
                $user=M('users');
                $res=$user->where("id={$uid}")->find();
                $res['like']='n';
                $this->assign('user',$res);
            }
        }
        $mod=M("Like");
        $mod2=D("Message");
        $mod3=D("Question");
        $res=$mod->where("uid={$uid}")->select();
        foreach($res as $v){
            if($v['mid']!='0'){
                $mm=$mod2->find($v['mid']);
                $uu=$user->field('username,name')->find($mm['uid']);

                if($uu['name']!=''){
                    $mm['username']=$uu['name'];
                }else{
                    $mm['username']=$uu['username'];
                }

                $list[]=$mm;
                
            }else{
                $qq=$mod3->find($v['qid']);
                $list2[]=$qq;
            }
        }
        
        //统计帖子数
        $mm=D("Message");
        $mnum=$mm->where("uid={$uid} and status='1'")->count();
        //统计提问数
        $mm2=D("Question");
        $mnum2=$mm2->where("uid={$uid}")->count();
        $this->assign("mnum",$mnum);
        $this->assign("mnum2",$mnum2);
        $this->person();        //调用person方法
        $this->keyword();       //调用keyword方法，显示所有非一级分类
        $this->assign('list',$list);
        $this->assign('list2',$list2);
        $this->display("mylike");
    }
    //关注操作
    public function friend(){
        if(!$_SESSION[C('USER_AUTH_KEY')]['id']){
            if($_GET['id']){
                $this->redirect('Users/login');
            }else{
                echo false;
            }
            die;
        }
        $mod=M("Friend");
        $mod->uid=$_SESSION[C('USER_AUTH_KEY')]['id'];
        $mod->fid=$_POST['fid'];
        if($_SESSION[C('USER_AUTH_KEY')]['id']==$_POST['fid']){
            die;
        }
        if($_POST['vv']=='n'){
            if($result=$mod->add() ){
                echo json_encode($result);
            }else{
                $this->error("关注失败");
            }
        }else{
            if($result=$mod->where("uid={$_SESSION[C('USER_AUTH_KEY')]['id']} and fid={$_POST['fid']}")->delete() ){
                echo json_encode($result);
            }else{
                $this->error("取消关注失败");
            }
        }
    }
    //我的关注展示
    public function myfri(){
        if($_SESSION[C('USER_AUTH_KEY')]['id']){
            $uid=$_SESSION[C('USER_AUTH_KEY')]['id'];
            if($_GET['uid']){
                $uid=$_GET['uid'];
            }
            $user=M('users');
            $res=$user->where("id={$uid}")->find();
            //输出用户信息
            $this->assign('user',$res);
            //执行统计未处理消息方法
            $this->hfnum();
        }else{
            if(!$_GET['uid']){
                $this->redirect('Users/login');
                die;
            }else{
                $uid=$_GET['uid'];
                $user=M('users');
                $res=$user->where("id={$uid}")->find();
                $this->assign('user',$res);
            }
        }
        $mod=M("Friend");
        $mod2=M("Users");
        import("ORG.Util.Page");    //导入分页类
        //====================================================
        //我的关注
        $count=$mod->where("uid={$uid}")->count();       //获取总数据条数
        //$count=$mod->count();
        $page=new Page($count,10);  //创建分页对象
        $res=$mod->where("uid={$uid}")->limit($page->firstRow.','.$page->listRows)->select();

        foreach($res as &$v){
            $uu=$mod2->field('username,name,picture,sex,age,class')->find($v['fid']);
            $v['name']=$uu['name'];
            $v['username']=$uu['username'];
            $v['picture']=$uu['picture'];
            $v['sex']=$uu['sex'];
            $v['age']=$uu['age'];
            $v['class']=$uu['class'];
            $v['fri']=$mod->where("uid={$v['fid']}")->count();
            $v['fs']=$mod->where("fid={$v['fid']}")->count();
            $res2=M('Friend')->where("fid='{$v['fid']}' and uid='{$_SESSION[C('USER_AUTH_KEY')]['id']}'")->find();
            if(!empty($res2)){
                $v['like']='y';
            }else{
                $v['like']='n';
            }
        }

        //=====================================================
        //我的粉丝
        $count2=$mod->where("fid={$uid}")->count();       //获取总数据条数
        //$count=$mod->count();
        $page2=new Page($count2,10);  //创建分页对象
        $res2=$mod->where("fid={$uid}")->limit($page2->firstRow.','.$page2->listRows)->select();
        foreach($res2 as &$v){
            $uu=$mod2->field('username,name,picture,sex,age,class')->find($v['uid']);
            $v['name']=$uu['name'];
            $v['username']=$uu['username'];
            $v['picture']=$uu['picture'];
            $v['sex']=$uu['sex'];
            $v['age']=$uu['age'];
            $v['class']=$uu['class'];
            $v['fri']=$mod->where("uid={$v['uid']}")->count();
            $v['fs']=$mod->where("fid={$v['uid']}")->count();
            $qq=$mod->where("fid='{$v['uid']}' and uid='{$_SESSION[C('USER_AUTH_KEY')]['id']}'")->find();
            if(!empty($qq)){
                $v['like']='y';    
            }else{
                $v['like']='n';
            }
        }
        //统计帖子数
        $mm=D("Message");
        $mnum=$mm->where("uid={$uid} and status='1'")->count();
        //统计提问数
        $mm2=D("Question");
        $mnum2=$mm2->where("uid={$uid}")->count();
        $this->assign("mnum",$mnum);        //帖子数
        $this->assign("mnum2",$mnum2);      //问题数
        $this->assign("myfri",count($res)); //关注数
        $this->assign("myfs",count($res2)); //粉丝数
        
        $this->assign('list',$res);
        $this->assign('list2',$res2);
        $this->assign("pageinfo",$page->show());
        $this->assign("pageinfo2",$page2->show());
        $this->person();        //调用person方法
        $this->keyword();       //调用keyword方法，显示所有非一级分类
        $this->display("myfri");
    }
    //评论、回复
    public function comm(){
        if(!$_SESSION[C('USER_AUTH_KEY')]['id']){
            if($_GET['id']){
                $this->redirect('Users/login');
            }else{
                echo false;
            }
            die;
        }
        $mod2=D("Comm");
        //自动验证判断
        if($_GET['id']){
            $_POST['mid']=$_GET['id'];
        }
        if(!$mod2->create()){
            $this->error($mod2->getError()); //输出验证错误信息
        }
        $mod2->addtime=time();               //添加时间
        $mod2->uid=$_SESSION[C('USER_AUTH_KEY')]['id'];
        if($_POST['pid']){
            $mod2->content=htmlspecialchars($_POST['content']);
        }
        if($result=$mod2->add() ){
            // 回调接口
			if (method_exists($this, '_tigger_comm')) {
				$mod2->id = $result;
				$this->_tigger_comm($mod2);
			}
            $list=$mod2->find($result);
            $list['addtime']=date("Y-m-d H:i:s",$list['addtime']);
            if($_GET['id']){
                $this->redirect("Message/show?id={$_POST['mid']}");
            }else{
                if($_POST['hf']!==''){
                    $data['status']='1';
                    $mod2->where("id={$_POST['hf']}")->save($data);
                }
                echo json_encode($list);
            }
        }else{
            $this->error("评论失败");
        }
    }
    //贴吧详情
    public function show(){
        $mod=D("Message");
        $aa=$mod->find($_GET['id']);
        $data['scan']=$aa['scan']+1;
        $mod->where("id={$_GET['id']}")->save($data);
        $list=$mod->find($_GET['id']);
        //联表查询用户名
        $model=M('Users');
        $name=$model->field('username,name')->where("id={$list['uid']}")->find();
        if($name['name']!=''){
            $list['username']=$name['name'];
        }else{
            $list['username']=$name['username'];
        }
        $rr=explode(',',$list['keyword']);
        $c2=D('Cat');
        foreach($rr as $vo){
            $r2=$c2->find($vo);
            $ll.=$r2['name'].',';
        }
        $res=M('Like')->where("mid={$list['id']} and uid='{$_SESSION[C('USER_AUTH_KEY')]['id']}'")->select();
        if(!empty($res)){
            $list['like']='y';
        }else{
            $list['like']='n';
        }
        $list['cname']=rtrim($ll,',');
        $this->assign("list",$list);
        $this->showComm();      //调用showComm方法
        $this->person();        //调用person方法
        $this->keyword();       //调用keyword方法，显示所有非一级分类
        $this->display('show');
    }
    
    public function showComm(){
        //评论信息
        $mod3=D("Comm");
        import("ORG.Util.Page");    //导入分页类
        $count=$mod3->where("mid={$_GET['id']} and pid='0'")->count();
        $page=new Page($count,5);  //创建分页对象
        $list1=$mod3->where("mid={$_GET['id']} and pid='0'")->order('addtime asc')->limit($page->firstRow.','.$page->listRows)->select();
        foreach($list1 as &$vo){
            //将用户名，头像名查出并拼装到返回数组中
            $model=M('Users');
            $name=$model->field('username,name,picture')->where("id={$vo['uid']}")->find();
            $vo['name']=$name['name'];
            $vo['username']=$name['username'];
            $vo['picture']=$name['picture'];
            $list2=$mod3->where("pid={$vo['id']}")->order('addtime asc')->select();
            for($i=0;$i<count($list2);$i++){
                $res=$model->field('username,name,picture')->where("id={$list2[$i]['uid']}")->find();
                $list2[$i]['name']=$res['name'];
                $list2[$i]['username']=$res['username'];
                $list2[$i]['picture']=$res['picture'];
            }
            $vo['hf']=$list2;
        }
        $this->assign("list1",$list1);
        $this->assign("pageinfo",$page->show());
        $this->assign("where",$_GET);
    }
    //定义一个处理编辑器的上传内容
	public function doupload(){
		$res = array("err"=>"","msg"=>"");//定义一个响应信息
		import('ORG.Net.UploadFile');
		$upload = new UploadFile();// 实例化上传类
        $upload->maxSize  = 3145728 ;// 设置附件上传大小
		$upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
		$upload->savePath = './Public/Uploads/editor/'.date('Ym',time()).'/';// 设置附件上传目录
		//执行上传
		if($upload->upload()){ 
			$info =  $upload->getUploadFileInfo();
            $res["msg"]=__ROOT__."/Public/Uploads/editor/".date('Ym',time()).'/'.$info[0]['savename'];  //上传成功！
            //添加图片信息
			$mod = M("Picture");
			$data['tbname']='article';
            $data['mid']=0;
            $data['cid']=0;
			$data['picname']=$info[0]['savename'];
			$data['create_time']=time();
			$data['id']=$mod->add($data);
			//将上传成功的图片信息存放到session数组中
            $_SESSION['article_img'][]=$data;

		}else{
			$res['err']=$upload->getErrorMsg(); //失败
        }
		echo json_encode($res);
	}

    //统计当前用户的提示消息
    public function hfnum(){
        if(!$_SESSION[C('USER_AUTH_KEY')]){
            die;
        }
        $num=D('Comm');
        $mm=D('Message');
        $uu=M('Users');
        $qq=D('Question');
        $uid=$_SESSION[C('USER_AUTH_KEY')]['id'];

        //统计所有未查看的,帖子的被评论的数
        $res1=$mm->where("uid={$uid} and status='1'")->select();    //统计当前用户的所有帖子
        //循环查询每一个帖子的未查看消息
        $ss1=0;         //初始化统计总数
        $arr1=array();  //初始化统计信息详情
        for($i=0;$i<count($res1);$i++){
            $arr=$num->where("mid='{$res1[$i]['id']}' and status='0' and pid='0'")->select();
            foreach($arr as $vo){
                $user=$uu->field('username,name')->where("id='{$vo['uid']}'")->find();
                //拼装帖子标题信息
                $vo['title']=$res1[$i]['title'];
                //拼装用户名信息
                if($user['name']!=''){
                    $vo['username']=$user['name'];
                }else{
                    $vo['username']=$user['username'];
                }
                $arr1[]=$vo;
            }
        }
        
        //统计所有未查看的，帖子评论的回复数
        $res2=$num->where("uid={$uid}")->select();      //统计当前用户所有评论
        $ss2=0;         //初始化统计总数
        $arr2=array();  //初始化统计信息详情
        for($i=0;$i<count($res2);$i++){
            $where=array();
            $where['uid']=array('neq',$uid);
            $where['status']=array('eq','0');
            $where['addtime']=array('gt',$res2[$i]['addtime']);
            $where['pid']=array(array('eq',$res2[$i]['id']),array('eq',$res2[$i]['pid']),'or');
            $arr=$num->where($where)->select();
            foreach($arr as $vo){
                //第一次赋值
                if($vo['pid']=='0'){
                    break;
                }
                if(empty($arr2)){
                    //拼装帖子标题信息
                    $str1=$mm->field('title')->where("id={$vo['mid']}")->find();
                    $vo['title']=$str1['title'];
                    //拼装用户名信息
                    $str2=$uu->field('username,name')->where("id='{$vo['uid']}'")->find();
                    if($str2['name']!=''){
                        $vo['username']=$str2['name'];
                    }else{
                        $vo['username']=$str2['username'];
                    }
                    //拼装我的评论信息
                    $str3=$num->field('content')->where("id='{$vo['pid']}'")->find();
                    $vo['mypl']=$str3['content'];
                    $arr2[]=$vo;
                }
                //之后去重
                $m=0;
                for($j=0;$j<count($arr2);$j++){
                    if($arr2[$j]['id']!=$vo['id']){
                        $m++;
                    }
                }
                if($m==count($arr2)){
                    //拼装帖子标题信息
                    $str1=$mm->field('title')->where("id={$vo['mid']}")->find();
                    $vo['title']=$str1['title'];
                    //拼装用户名信息
                    $str2=$uu->field('username,name')->where("id='{$vo['uid']}'")->find();
                    if($str2['name']!=''){
                        $vo['username']=$str2['name'];
                    }else{
                        $vo['username']=$str2['username'];
                    }
                    //拼装我的评论信息
                    $str3=$num->field('content')->where("id='{$vo['pid']}'")->find();
                    $vo['mypl']=$str3['content'];
                    $arr2[]=$vo;
                }

            }
        }
        //我的问题被回复的提醒数
        $qres=$qq->field("id,tid,content,replay")->where("uid='{$uid}' and remind='1' and status='1'")->order('rtime desc')->select();
        foreach($qres as &$vo){
            $quser=$uu->field('username,name')->where("id='{$vo['tid']}'")->find();
            if($quser['name']!=''){
                $vo['username']=$quser['name'];
            }else{
                $vo['username']=$quser['username'];
            }
        }
        //将问题的提醒数清零
        //$qq->where("uid='{$uid}' and remind='1' and status='1'")->data("remind=0")->save();
        $arr1=array_reverse($arr1);
        $arr2=array_reverse($arr2);
        $ss1=count($arr1);
        $ss2=count($arr2);
        $ss3=count($qres);
        $_SESSION[C('USER_AUTH_KEY')]['hfnum']=$ss1+$ss2+$ss3;
        $this->assign('hf1',$arr1);
        $this->assign('hf2',$arr2);
        $this->assign('hf3',$qres);
    }
    //执行评论或回复的标记已读方法
    public function readall(){
        $mod=D('Comm');
        $mod2=D("Question");
        if($_POST['qid']){
            $qid=trim($_POST['qid'],',');
            $mod2->where("id in ({$qid})")->data("remind=0")->save();
        }
        if($_POST['id']){
            $id=trim($_POST['id'],',');
            $data['status']='1';
            $mod->where("id in ({$id})")->data($data)->save();
        }
        $_SESSION[C('USER_AUTH_KEY')]['hfnum']='0';     //待回复消息归零
        $this->redirect('Message/mynews');
    }
    //定义活跃用户的统计方法
    public function person(){
        $cc=D('Comm');
        $mm=D('Message');
        $qq=D('Question');
        $uu=M('Users');
        //时间在三天之内
        $now=time();
        $tt=$now-(3*24*60*60);
        
        $arr1=$cc->query("select uid,count('uid') num from bbs_comm where addtime>'{$tt}' group by uid order by num desc");
        $arr2=$mm->query("select uid,count('uid') num from bbs_message where addtime>'{$tt}' group by uid order by num desc");
        $arr3=$qq->query("select uid,count('uid') num from bbs_question where addtime>'{$tt}' group by uid order by num desc");
        foreach($arr2 as $vo){
            for($i=0;$i<count($arr1);$i++){
                if($arr1[$i]['uid']==$vo['uid']){
                    $arr1[$i]['num']+=$vo['num'];
                    $m=1;
                    break;
                }else{
                    $m=2;
                }
            }
            if($m!=1){
                $arr1[]=$vo;
            }
        }
        foreach($arr3 as $vo){
            for($i=0;$i<count($arr1);$i++){
                if($arr1[$i]['uid']==$vo['uid']){
                    $arr1[$i]['num']+=$vo['num'];
                    $m=1;
                    break;
                }else{
                    $m=2;
                }
            }
            if($m!=1){
                $arr1[]=$vo;
            }
        }
        foreach($arr1 as $vo){
            $arr[$vo['uid']]="{$vo['num']}";
        }
        //排序
        arsort($arr);
        //根据id查询用户名
        $i=1;
        foreach($arr as $key=>$vo){
            if($i>5){
                break;
            }
            $ll[]=$uu->find($key);
            $i++;
        }
        $this->assign('person',$ll);
    }
    //标签
    public function keyword(){
        $cc=D('Cat');
        $res=$cc->field('id,name')->where('pid!=0')->select();
        $this->assign('kw',$res);
        shuffle($res);
        for($i=0;$i<6;$i++){
            $rr[]=$res[$i];
        }
        $this->assign('cat',$rr);
    }
}
