<?php

namespace app\admin\validate;

use think\Validate;

class Users extends Validate
{
    protected $rule=[
        'uname'=>'require|max:10',
    ];
    protected $message=[
        'uname.require'=>'未填写用户名',
        'uname.max'=>'用户名长度超过10',
    ];
}
