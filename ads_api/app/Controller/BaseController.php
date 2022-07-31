<?php

declare(strict_types=1);

namespace App\Controller;

class BaseController extends AbstractController
{
    /**
     * BaseController constructor.
     */
    public function __construct()
    {
        $this->initialize();
    }

    public function initialize()
    {
    }

}
