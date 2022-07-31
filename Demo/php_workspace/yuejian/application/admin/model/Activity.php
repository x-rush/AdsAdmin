<?php
namespace app\admin\model;

use think\Model;

class Activity extends Model
{
    protected $table='activity';
    protected $pk='aid';
    protected $autoWriteTimestamp='datetime';
    protected $createTime='create_at';
    protected $updateTime='update_at';
}