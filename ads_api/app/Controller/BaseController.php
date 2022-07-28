<?php

declare(strict_types=1);
/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://hyperf.wiki
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */
namespace App\Controller;


use App\Utils\Send;

class BaseController extends AbstractController
{
    use Send;


    public $user = [];

    public $version = '1.0.0';

    /**
     * BaseController constructor.
     */
    public function __construct()
    {
        $this->initialize();
    }


    public function initialize()
    {
        $this->version = $this->request->header('version');
    }

    public function uid()
    {
        return uid();
    }

    public function checkUid()
    {
        if (! uid()) {
            self::error('缺少用户重要参数信息');
        }
    }

    public function checkUser()
    {
        if (! $this->user) {
            self::error('当前用户参数异常，无法获取用户信息');
        }
    }
}
