<?php
namespace app\admin\model;

use think\Model;

class TrainOrder extends Model
{
	protected $autoWriteTimestamp='datetime';
    protected $createTime='create_at';
    protected $updateTime=false;
    protected $table='train_order';
    protected $pk='toid';
}