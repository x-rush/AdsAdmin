<?php

namespace app\admin\validate;

use think\Validate;

class Master extends Validate
{
    protected $rule=[
        'trid'=>'require|unique:master,trid',
    ];
    protected $message=[
        'trid.require'=>'为获取到需添加教练的记录',
        'trid.unique'=>'该教练已经被推选为大师，无需再添加',
    ];
}
