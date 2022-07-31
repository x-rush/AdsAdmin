<?php

namespace app\admin\validate;

use think\Validate;

class Prize extends Validate
{
    protected $rule=[
       
        'prname'=>'require|max:20',
        'printro'=>'require'];
    protected $message=[
        'prname.require'=>'未填写奖品名',
        'prname.max'=>'奖品名长度超过20',
        'printro.require'=>'未填写奖品概述'];
}
