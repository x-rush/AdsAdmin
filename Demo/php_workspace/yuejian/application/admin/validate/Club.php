<?php

namespace app\admin\validate;

use think\Validate;

class Club extends Validate
{
    protected $rule=[
        'cname'=>'require|max:40',
        'intro'=>'require'
    ];
    protected $message=[
        'cname.require'=>'未填写俱乐部名称',
        'cname.max'=>'俱乐部名长度超过40',
        'intro.require'=>'未填写俱乐部描述',
    ];
}
