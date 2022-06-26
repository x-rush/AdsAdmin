<?php

namespace app\admin\validate;

use think\Validate;

class Train extends Validate
{
    protected $rule=[
       
        'trname'=>'require|max:20',
        'trintro'=>'require'];
    protected $message=[
        'trname.require'=>'未填写培训名',
        'trname.max'=>'培训名长度超过20',
        'trintro.require'=>'未填写培训概述'];
}
