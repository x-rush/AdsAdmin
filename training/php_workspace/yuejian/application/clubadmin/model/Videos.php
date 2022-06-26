<?php
namespace app\clubadmin\model;

use think\Model;

class Videos extends Model
{
    protected $table='video';
    protected $pk='vid';
    protected $autoWriteTimestamp='datetime';
    protected $createTime='createtime';
    protected $updateTime='updatetime';
}