<?php

namespace app\admin\validate;

use think\Validate;

class ClubAdmin extends Validate
{
    protected $rule=[
        'cadminname'=>'require|max:20', 
        'password'=>'require|min:6|max:12',     
    ];
    protected $message=[
        'cadminname.require'=>'未填写用户名名',
        'cadminname.max'=>'用户名长度超过20',
        'password.require'=>'未填写用户密码',
        'password.min'=>'用户密码长度应该在6-12位数',
        'password.max'=>'用户密码长度应该在6-12位数',
    ];
}