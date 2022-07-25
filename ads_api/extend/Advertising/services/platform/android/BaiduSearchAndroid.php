<?php


namespace Advertising\services\platform\android;


use Advertising\services\platform\android\validate\BaiduSearchAndroidValidate;
use Advertising\services\platform\basic\BaseBaiduSearch;

class BaiduSearchAndroid extends BaseBaiduSearch
{
    use BaiduSearchAndroidValidate;
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
        "imei_md5" => "{{IMEI_MD5}}",             //安卓设备标识
        "oaid" => "{{OAID}}",                     //Android Q 及更高版本的设备号
        "android_id_md5" => "{{ANDROID_ID_MD5}}", //md5加密值，对原值进行标准32位小写MD5编码
        "mac" => "{{MAC}}",                       //MAC地址
        "ip" => "{{IP}}",                         //IP地址
        "os" => "{{OS}}",                         //操作系统类型安卓2 IOS1
        "ua" => "{{UA}}",                         //数据上报终端设备User Agent
    ];
}