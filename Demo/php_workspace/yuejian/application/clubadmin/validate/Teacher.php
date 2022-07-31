<?php

namespace app\clubadmin\validate;

use think\Validate;

class Teacher extends Validate
{
    protected $rule=[
        'teacherId'=>'require',
        'teachername'=>'require|max:10',
        'email'=>'require|email'
    ];
    protected $message=[
        'teachername.require'=>'未填写用户名名',
        'teachername.max'=>'用户名长度超过10',
        'email.email'=>'邮箱格式有误',
    ];
}