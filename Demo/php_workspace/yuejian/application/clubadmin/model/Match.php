<?php
namespace app\clubadmin\model;

use think\Model;

class Match extends Model
{
    protected $table='matchs';
    protected $pk='mid';
    protected $autoWriteTimestamp='datetime';
    protected $createTime='createtime';
    protected $updateTime='updatetime';
}