<?php
namespace app\admin\model;

use think\Model;

class Master extends Model
{
    protected $table='master';
    protected $pk='msid';
    protected $autoWriteTimestamp='datetime';
    protected $createTime='create_at';
    protected $updateTime=false;
}