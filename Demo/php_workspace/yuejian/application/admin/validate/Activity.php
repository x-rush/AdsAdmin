<?php

namespace app\admin\validate;

use think\Validate;

class Activity extends Validate
{
    protected $rule=[
        'aname'=>'require|max:20',
        'address'=>'require|min:5',
        'intro'=>'require',
        'tel'=>'require',
//        'pic'=>'require',
        'price'=>'require',
        'activedate'=>'require',
    ];
    protected $message=[
        'aname.require'=>'未填写活动名',
        'aname.max'=>'活动名长度不能超过20',
        'intro.require'=>'未填写活动概述',
        'price.require'=>'未填写活动报名价格',
        'activedate.require'=>'未填写活动举办时间',
        'tel.require'=>'未填写活动报名价格',
        'address.require'=>'未填写活动地址',
//        'pic.require'=>'未选择活动海报',
        'address.min'=>'活动地址长度最少为5个字符',
    ];
}
