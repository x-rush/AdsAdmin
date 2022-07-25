<?php


namespace Advertising\services\platform\basic;


use Advertising\services\BaseService;
use Advertising\services\platform\basic\interfaces\CallbackEvent;
use Advertising\services\platform\basic\request\BaiduSearchRequest;

class BaseBaiduSearch extends BaseService implements CallbackEvent
{
    use BaiduSearchRequest;
    public function activeCallback()
    {
        // TODO: Implement activeCallback() method.
        return $this;
    }

    public function registerCallback()
    {
        // TODO: Implement registerCallback() method.
        $this->setATYPE('activate');
        die('百度没有注册事件');
    }

    public function payCallback()
    {
        // TODO: Implement payCallback() method.
        $this->setATYPE('orders');
        return $this;
    }

    public function formCallback()
    {
        // TODO: Implement formCallback() method.
        die('百度没有表单提交');
    }

    public function OnlineConsultationCallback()
    {
        // TODO: Implement OnlineConsultationCallback() method.
        die('百度没有在线咨询');
    }

    public function EffectiveConsultationCallback()
    {
        // TODO: Implement EffectiveConsultationCallback() method.
        die('百度没有有效咨询');
    }

    public function retentionCallback()
    {
        // TODO: Implement retentionCallback() method.
        die('百度没有次留');
    }

    public function behaviorsCallback()
    {
        // TODO: Implement behaviorsCallback() method.
        die('百度没有关键事件');
    }
}