<?php

namespace app\clubadmin\validate;

use think\Validate;

class Student extends Validate
{
    protected $rule=[
        'sid'=>'require',
        'studentname'=>'require|max:10',
        'email'=>'require|email'
    ];
    protected $message=[
        'studentname.require'=>'未填写用户名名',
        'studentname.max'=>'用户名长度超过10',
        'email.email'=>'邮箱格式有误',
    ];
}
