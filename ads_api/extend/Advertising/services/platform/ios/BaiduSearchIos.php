<?php


namespace Advertising\services\platform\ios;


use Advertising\services\platform\ios\validate\BaiduSearchIosValidate;
use Advertising\services\platform\basic\BaseBaiduSearch;

class BaiduSearchIos extends BaseBaiduSearch
{
    use BaiduSearchIosValidate;

    /**
     * 快手参数信息
     * @var string[]
     */
    public $devicePars = [
        "userid" => "{{USER_ID}}",                //账户ID
        "aid" => "{{IDEA_ID}}",                   //创意ID
        "pid" => "{{PLAN_ID}}",                   //计划ID
        "uid" => "{{UNIT_ID}}",                   //单元ID
        "callback_url" => "{{CALLBACK_URL}}",     //效果数据回传URL
        "click_id" => "{{CLICK_ID}}",             //点击唯一ID
        "idfa" => "{{IDFA}}",                     //IOD设备标识
        "ip" => "{{IP}}",                         //IP地址
        "os" => "{{OS}}",                         //操作系统类型安卓2 IOS1
        "ua" => "{{UA}}",                         //数据上报终端设备User Agent
    ];
}