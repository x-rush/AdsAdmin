<?php

namespace app\clubadmin\validate;

use think\Validate;

class Lesson extends Validate
{
    protected $rule=[
        'lessonid'=>'require',
        'lessonname'=>'require|max:20',
        'intro'=>'require'
    ];
    protected $message=[
        'lessonname.require'=>'未填写课程名',
        'lessonname.max'=>'课程名长度超过20',
        'intro.require'=>'未填写课程概述',
    ];
}
