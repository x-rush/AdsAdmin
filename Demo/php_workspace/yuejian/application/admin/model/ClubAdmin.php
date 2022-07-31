<?php

namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;

class ClubAdmin extends Model
{
    protected $table='club_admin';
    protected $pk='cadminid';
}
