<?php
namespace app\admin\model;

use think\Model;

class Users extends Model
{
    protected $table='users';
    protected $pk='uid';
    protected $autoWriteTimestamp='datetime';
    protected $createTime='create_at';
    protected $updateTime='update_at';

}