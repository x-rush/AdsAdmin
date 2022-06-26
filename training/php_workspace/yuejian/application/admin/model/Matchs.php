<?php
namespace app\admin\model;

use think\Model;

class Matchs extends Model
{
    protected $table='matchs';
    protected $pk='mid';
    protected $autoWriteTimestamp='datetime';
    protected $createTime='create_at';
    protected $updateTime='update_at';
}