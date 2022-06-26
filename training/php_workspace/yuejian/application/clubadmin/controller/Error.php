<?php

namespace app\clubadmin\controller;

use think\Controller;
use think\Request;

class Error extends Controller
{
     public function index()
    {
        $this->redirect('clubadmin/index');
    }
  
}
