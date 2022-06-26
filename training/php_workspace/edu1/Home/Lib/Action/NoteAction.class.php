<?php

//自定义视频手记的模块Action类

class NoteAction extends Action{

    //显示手记列表的方法
    public function index(){
        $model = M("Note");
        //导入分页类
        import("ORG.Util.Page");
        //设置搜索分页信息
        //封装搜索条件
        if (!empty($_GET['q'])) {
            $where['title'] = array("like","%{$_GET['q']}%");
            $this->assign("title","搜索结果");
        }
        //拼装搜索用户上传的手记
        if (!empty($_GET['uid'])) {
            $where['uid'] = array("eq",$_GET['uid']);
            $this->assign("title","我创建的");
        }
        //拼装指定视频相关的所有手记
        if (!empty($_GET['vid'])) {
            $where['vid'] = array("eq",$_GET['vid']);
            $videoname = D("Video")->field("videoname")->find($_GET['vid']);
            $this->assign("title","《{$videoname["videoname"]}》视频相关手记");
        }
        //拼装搜索某用户关于某视频的全部手记
        if (!empty($_GET['uid']) && !empty($_GET['vid'])) {
            $where['uid'] = array("eq",$_GET['uid']);
            $where['vid'] = array("eq",$_GET['vid']);
            $videoname = D("Video")->field("videoname")->find($_GET['vid']);
            $this->assign("title","我创建的关于《".$videoname["videoname"]."》的手记");
        }
        //拼装用户收藏的视频条件
        if (!empty($_GET['collid'])) {
            $coll = M("collect");
            $lids = $coll->where("uid={$_SESSION[C('USER_AUTH_KEY')]['id']}")->field("nid")->select();
            $ids = array();
            foreach ($lids as $v) {
                $ids[] = $v['nid'];
            }
            $where['id'] = array("in",$ids);
            $this->assign("title","我收藏的手记列表");
        }
        //设置分页条件
        $total = $model->where($where)->count();//获取总数据条数
        $page = new Page($total,5);//实例化一个分页对象
        
        //查询手记信息
        $note = $model->where($where)->order("addtime desc")->limit($page->firstRow.",".$page->listRows)->select();
        //遍历手记数组信息 进行视频和用户名信息的追加
        foreach ($note as &$v) {
            $user = D("Users")->field("username,picture")->find($v['uid']);//追加创建用户名
            $v['username'] = $user['username'];
            $v['picture'] = $user['picture'];
            $video = D("Video")->field("videoname,picname,clicknum")->find($v['vid']);//追加用户评论的视频名
            $v['videoname'] = $video['videoname'];
            $v['picname'] = $video['picname'];
            $v['clicknum'] = $video['clicknum'];
            $coll = D("Collect")->field("nid")->where("nid={$v['id']}")->count();//追加每篇手记被赞的次数
            $v['collnum'] = $coll;
            $comm = D("Notecom")->where("nid={$v['id']}")->count();//追加每篇手记回复的条数
            $v['commnum'] = $comm;
        }
        //将查询出的信息数组赋值给模板
        $this->assign("list",$note);
        $this->assign("showPage",$page->show());
        //===============================================  
        if($_SESSION[C('USER_AUTH_KEY')]){
            //调用贴吧中的查询hfnum()方法
            R("Message/hfnum");
        }
        //最新手记列表
        $newlist = $model->order("addtime desc")->limit(16)->select();
        $this->assign("newlist",$newlist);
        $this->display();
    }

    //显示添加手记的页面
    public function add(){
        //实例化视频表对象查询视频信息
        $model = M("Video");
        $list = $model->find($_GET['vid']);
        $this->assign("vid",$list['id']);
        $this->assign("videoname",$list['videoname']);
        $this->display();
    }

    //添加手记的方法
    public function insert(){
        //实例化表对象
        $model = D("Note");
        $model->create();
        if ($model->add()) {
            $this->success("手记创建成功",U("Note/index"));
        }else{
            $this->error("创建失败！");
        }
    }

    //定义显示手记详情的方法
    public function detail(){
        $model = M("Note");
        $note = $model->find($_GET['id']);
        $this->assign("vo",$note);//手记的详情信息数组
        
        //查询相关的用户名
        $user = D("Users")->field("username,picture")->find($note['uid']);
        $this->assign("username",$user['username']);//给模板赋值创建手记的用户名
        $this->assign("picture",$user['picture']);//给模板赋值创建手记的头像

        //查询视频相关的信息
        $video = D("Video")->field("id,tid,uid,videoname,picname,clicknum")->find($note['vid']);
        $this->assign("tid",$video['tid']);//视频的类别
        $videouser = D("Users")->field("username")->find($video['uid']);
        $this->assign("videouser",$videouser['username']);//上传视频的用户
        $this->assign("videoname",$video['videoname']);//视频的名字
        $this->assign("picname",$video['picname']);//视频的缩略图
        $this->assign("clicknum",$video['clicknum']);//视频的点击率
        //查询视频的类别名
        $type = M("Cat")->field("name")->find($video['tid']);
        $this->assign("typename",$type['name']);
        //查询与本视频想关的手记
        $where['vid'] = array("eq",$note['vid']);
        $where['id'] = array("neq",$_GET['id']);//不包括本手记
        $list = $model->where($where)->limit(5)->select();
        foreach ($list as &$v) {
            $ob = D("Users")->field("username,picture")->find($v['uid']);
            $v['username'] = $ob["username"];
            $v['picture'] = $ob["picture"];
        }
        $this->assign("list",$list);//本视频相关手记

        //实例化赞表和收藏表对象
        $zan = M("Zan");
        $collect = M("Collect");
        //封装搜索条件
        $map['uid'] = array("eq",$_SESSION[C('USER_AUTH_KEY')]['id']);
        $map['nid'] = array("eq",$_GET['id']);
        //查询该用户是否赞过这个资源
        $iszan = $zan->where($map)->find();
        $zannum = $zan->where("nid={$_GET['id']}")->count();//查询被赞数
        $coll = $collect->where($map)->find();
        $collnum = $collect->where("nid={$_GET['id']}")->count();//查询被收藏数
        $this->assign("iszan",$iszan);
        $this->assign("zannum",$zannum);
        $this->assign("collect",$coll);
        $this->assign("collnum",$collnum);
        //调用手记评论模块中的显示评论方法
        R("Notecom/index",array($_GET['id']));
        //显示详情页
        $this->display();
    }

    //定义手记被赞的方法
    public function favo(){
        $zan = M("Zan");//实例化赞表对象

        //封装要添加的数据
        $map['uid'] = $_SESSION[C('USER_AUTH_KEY')]['id'];
        $map['nid'] = $_POST['id'];
        
        //封装搜索条件
        $where['uid'] = array("eq",$_SESSION[C('USER_AUTH_KEY')]['id']);
        $where['nid'] = array("eq",$_POST['id']);

        //查询该用户是否赞过这个手记
        $his = $zan->where($where)->find();
        if ($his) {
            $zan->where($where)->delete();//删除赞数据表中的数据
            echo "no";die;
        }else{
            //往赞表中存进手记和用户的id
            $zan->add($map);//保存数据
            echo "yes";die; 
        }     
       
    }
    //定义手记被收藏的方法
    public function collect(){
        //实例化收藏表对象
        $collect = M("Collect");
        
        //封装搜索要添加的数据
        $map['uid'] = $_SESSION[C('USER_AUTH_KEY')]['id'];
        $map['nid'] = $_POST['id'];

        //封装搜索条件
        $where['uid'] = array("eq",$_SESSION[C('USER_AUTH_KEY')]['id']);
        $where['nid'] = array("eq",$_POST['id']);

        //查询该用户是否收藏过这个手记
        $coll = $collect->where($where)->find();
        if ($coll) {
            $collect->where($where)->delete();//删除收藏数据表中的数据
            echo "no";die;
        }else{
            //往收藏表中存进手记和用户的id
            $collect->add($map);//保存数据
            echo "yes";die; 
        }     
    }
}
