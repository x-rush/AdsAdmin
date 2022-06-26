<?php

namespace app\clubadmin\model;

use think\Model;
use traits\model\SoftDelete;

class Type extends Model
{
//    use SoftDelete;
    protected $table='course';
    protected $pk='coid';
//    protected static $deleteTime = 'delete_time';

    protected $autoWriteTimestamp='datetime';
    protected $createTime='createtime';
    protected $updateTime='updatetime';
}
