<?php

namespace app\admin\validate;

use think\Validate;

class Matchs extends Validate
{
    protected $rule=[
        'mname'=>'require|max:20',
        'maddress'=>'require|min:5',
        'cintro'=>'require',
        'mtel'=>'require',
//        'pic'=>'require',
        'price'=>'require',
        'mdate'=>'require',
    ];
    protected $message=[
        'mname.require'=>'未填写比赛名',
        'mname.max'=>'比赛名长度不能超过20',
        'cintro.require'=>'未填写比赛概述',
        'price.require'=>'未填写比赛报名价格',
        'mdate.require'=>'未填写比赛举办价格',
        'mtel.require'=>'未填写比赛报名价格',
        'maddress.require'=>'未填写比赛地址',
//        'pic.require'=>'未选择活动海报',
        'maddress.min'=>'比赛地址长度最少为5个字符',
    ];
}
