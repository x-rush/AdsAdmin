<?php
namespace app\admin\model;

use think\Model;

class Club extends Model
{
    protected $table='club';
    protected $pk='cid';
    protected $autoWriteTimestamp='datetime';
    protected $createTime='create_at';
    protected $updateTime='update_at';
}