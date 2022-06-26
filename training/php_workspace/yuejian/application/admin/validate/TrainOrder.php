<?php

namespace app\admin\validate;

use think\Validate;

class TrainOrder extends Validate
{
    protected $rule=[
       
        'trname'=>'require|max:20',
        'uname'=>'require'];
    protected $message=[
        'trname.require'=>'未填写培训名',
        'trname.max'=>'培训名长度超过20',
        'uname.require'=>'未填写用户名'];
}
