<?php

declare(strict_types=1);

use WhichBrowser\Parser;

if (! function_exists('isTell')) {
    function isTell($value)
    {
        $rule = '^1[3-9][0-9]\d{8}$^';
        $result = preg_match($rule, $value);
        return $result ? true : false;
    }
}

/**
 * @return string
 */
function GetUaDeviceOs(string $ua)
{
    $result = new Parser($ua);
    $osName = $result->os->getName();
    $osVersion = $result->os->getVersion();
    $manufacturer = $result->device->manufacturer;
    $model = $result->device->model;
    $identifier = $result->device->identifier;
    return ($osName ? $osName : '') .
        ($osVersion ? $osVersion : '') .
        ($manufacturer ? $manufacturer : '') .
        ($model ? $model : '') .
        ($identifier ? $identifier : '');
}

/**
 * 根据传递的os和type获取promotion标签
 * @os 设备 1：安卓 2：IOS
 * @tag juliang：巨量 kwaiAds：快手 TenAds：广点通 bdds：百度大搜
 */
function GetSource($os = 0,$channel = 'juliang'){
    $osstr = [0=>"ANDROID",1=>"IOS"];
    $typestr = ['juliang'=>"OCEANENGINE",'kwaiAds'=>"KWAIADS",'TenAds'=>"TENCENTADVERTISING",'bdds'=>"BDDS"];
    return $typestr[$channel].$osstr[$os];
}

function cache($key,$defalut ='',$ttl=''){
    $cache = app(\Hyperf\Cache\Cache::class);
    $info = $cache->get($key);
    if ($info){
        return $info;
    }else{
        $cache->set($key,$defalut,$ttl);
    }
    return $defalut;
}

if (!function_exists('arraySort')){
    //查找最新数据的方法
    function arraySort($arr,$key,$type='asc'){

        $keyArr = []; // 初始化存放数组将要排序的字段值
        foreach ($arr as $k=>$v){
            $keyArr[$k] = $v[$key]; // 循环获取到将要排序的字段值
        }
        if($type == 'asc'){
            asort($keyArr); // 排序方式,将一维数组进行相应排序
        }else{
            arsort($keyArr);
        }
        foreach ($keyArr as $k=>$v){
            $newArray[$k] = $arr[$k]; // 循环将配置的值放入响应的下标下
        }
        $newArray = array_merge($newArray); // 重置下标
        return $newArray[0]; // 数据返回
    }
}

function getCustomOnlyKey(){
    return app(\Hyperf\HttpServer\Contract\RequestInterface::class)->header('CustomOnlyKey');
}