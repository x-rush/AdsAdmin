<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;
Route::group(['name'=>'admin','prefix'=>''],function (){
//    Route::bind('admin');
    Route::any('login','LoginController/login');
    Route::any('logout','LoginController/logout');
//});
//------------------------------------------------------------------------------李旭
//活动管理
    Route::any('index','Index/index');
    Route::any('tindex','Index/tLesson');
    Route::any('edit','Index/edit');
//    Route::any('url','Index/getUrl');
    Route::any('activitydel','Index/activityDel');
    Route::any('activityadd','Index/activityAdd');
    Route::any('activityupdate','Index/activityUpdate');
    Route::any('orderlist/:id','Index/orderList');
//比赛管理
    Route::any('matchs','MatchsController/index');
    Route::any('matchsedit','MatchsController/edit');
    Route::any('matchsdel','MatchsController/matchsDel');
    Route::any('matchsupdate','MatchsController/matchsUpdate');
    Route::any('matchsadd','MatchsController/matchsAdd');
    Route::any('matchsorder/:id','MatchsController/orderList');
//大师管理
    Route::any('masters','MasterController/index');
    Route::any('mastersdel','MasterController/masterDel');
    Route::any('mastersadd','MasterController/masterAdd');
    Route::any('trainerlist','MasterController/trainerList');

//------------------------------------------------------------------------------李若星
    Route::any('trainapi','Trainapi/index');
    Route::any('gettrainapi','Trainapi/getTrain');
    Route::any('trainapisearch','Trainapi/trainSearch');

    Route::any('prizeapi','Prizeapi/index');
    Route::any('getprizeapi','Prizeapi/getPrize');
    Route::any('prizeapisearch','Prizeapi/prizeSearch');

Route::any('trainorderapi','TrainOrderapi/index');
Route::any('gettrainorderapi','TrainOrderapi/getTrainorder');
Route::any('trainorderapisearch','TrainOrderapi/trainorderSearch');
//奖品管理
    Route::any('prize','PrizeController/index');
    Route::any('prizeadd','PrizeController/prizeadd');
    Route::any('prizedel','PrizeController/prizedel');
    Route::any('prizeupdate','PrizeController/prizeupdate');
    Route::any('prizeedit','PrizeController/prizeedit');

//培训管理
    Route::any('train','TrainController/index');
    Route::any('trainadd','TrainController/trainadd');
    Route::any('traindel','TrainController/traindel');
    Route::any('trainupdate','TrainController/trainupdate');
    Route::any('trainedit','TrainController/trainedit');

//培训报名管理
    Route::any('train_order','TrainOrderController/index');
    Route::any('train_orderadd','TrainOrderController/train_orderadd');
    Route::any('train_orderdel','TrainOrderController/train_orderdel');
    Route::any('train_orderupdate','TrainOrderController/train_orderupdate');
    Route::any('train_orderedit','TrainOrderController/train_orderedit');
//------------------------------------------------------------------------------罗扬
//俱乐部信息
    Route::any('club','ClubController/index');
    Route::any('clubedit','ClubController/clubedit');
    Route::any('clubdel','ClubController/clubdel');
    Route::any('clubAdd','ClubController/clubAdd');
    Route::any('clubupdate','ClubController/clubUpdate');
    Route::any('allClub','ClubController/allClub');

//俱乐部管理员信息
    Route::any('clubadmin','ClubAdminController/index');
    Route::any('clubAdminedit','ClubAdminController/clubAdminedit');
    Route::any('clubAdminUpdate','ClubAdminController/clubAdminUpdate');
    Route::any('clubAdminadd','ClubAdminController/clubAdminadd');
    Route::any('clubAdminDel','ClubAdminController/clubAdminDel');

//用户信息
    Route::any('user','UserController/index');
    Route::any('useredit','UserController/edit');
    Route::any('studel','UserController/stuDel');

//晒图评论信息
    Route::any('photoshow','photoshowController/index');
    Route::any('photoshowdel','photoshowController/photoshowDel');
    Route::any('allPhotoshow','photoshowController/allPhotoshow');
    Route::any('comment','commentController/index');
    Route::any('commentdel','commentController/commentdel');
    Route::any('commentInfo','commentController/commentInfo');

});
//------------------------------------------------------------------------------王皓
Route::group('clubadmin',function (){
//    Route::bind('admin');
    Route::any('login','clubAdmin/LoginController/login');
    Route::any('logout','LoginController/logout');
//API
    Route::any('Courses','Courses/index');
    Route::any('getCourse','Courses/getCourse');
    Route::any('courseSearch','Courses/courseSearch');

    Route::any('Trainers','Trainer/index');
    Route::any('getTrainer','Trainer/getTrainer');
    Route::any('trainerSearch','Trainer/trainerSearch');

    Route::any('Videos','Video/index');
    Route::any('getVideo','Video/getVideo');
    Route::any('videoSearch','Video/videoSearch');
//});
//课程类型
    Route::any('index','Index/index');
    Route::any('tindex','Index/tLesson');
    Route::any('edit','Index/edit');
    Route::any('url','Index/geturl');
    Route::any('cDel','Index/cDel');
    Route::any('typeadd','Index/typeadd');
    Route::any('typeupdate','Index/typeupdate');
//视频信息
    Route::any('video','VideosController/index');
    Route::any('videoedit','VideosController/vEdit');
    Route::any('watch','VideosController/watch');
    // Route::any('videoupdate','VideosController/vupdate');
    Route::any('videodel','VideosController/vDel');

//教师注册信息
    Route::any('trainer','TrainerController/index');
    Route::any('tredit','TrainerController/tredit');
    Route::any('trdel','TrainerController/trdel');
});

Route::group('api',function (){
//    Route::bind('api');
    Route::any('activity','Activity/index');
//    Route::any('activityinfo/:id','Activity/activityInfo',[],['id'=>'\d+']);
//    Route::any('activityenroll/:aid/:uid','Activity/activityEnroll');
//    Route::any('activitysearch/[:key]','Activity/activitySearch');
    Route::any('activityinfo','Activity/activityInfo');
    Route::any('activityenroll','Activity/activityEnroll');
    Route::any('activitysearch','Activity/activitySearch');

    Route::any('match','Matchs/index');
//    Route::any('matchinfo/:id','Matchs/matchInfo',[],['id'=>'\d+']);
//    Route::any('matchenroll/:mid/:uid','Matchs/matchEnroll');
//    Route::any('matchsearch/[:key]','Matchs/matchSearch');
    Route::any('matchinfo','Matchs/matchInfo');
    Route::any('matchenroll','Matchs/matchEnroll');
    Route::any('matchsearch','Matchs/matchSearch');

    Route::any('master','Master/index');
//    Route::any('masterinfo/:id','Master/masterInfo',[],['id'=>'\d+']);
//    Route::any('masterenroll/:mid/:uid','Master/masterEnroll');
//    Route::any('mastersearch/[:key]','Master/masterSearch');
//    Route::any('mastervideo/:id','Master/course');
    Route::any('masterinfo','Master/masterInfo');
    Route::any('mastersearch','Master/masterSearch');
    Route::any('mastervideo','Master/course');
});
