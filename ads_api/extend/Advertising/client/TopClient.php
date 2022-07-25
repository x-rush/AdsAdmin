<?php
/**
 * @author: lvyabin<mail@lvyabin.com>
 * @day: 2020/12/12
 */

namespace Advertising\client;

use Advertising\services\platform\android\OceanEngineAndroid;
use Advertising\services\platform\android\TencentAdvertisingAndroid;
use Advertising\services\platform\android\KwaiAdsAndroid;
use Advertising\services\platform\android\BaiduSearchAndroid;
use Advertising\services\platform\ios\OceanEngineIos;
use Advertising\services\platform\ios\TencentAdvertisingIos;
use Advertising\services\platform\ios\KwaiAdsIos;
use Advertising\services\platform\ios\BaiduSearchIos;
use Advertising\services\platform\ios\ClueputIos;

use App\Model\tui\promotion\android\OceanEngine as OceanEngineAndroidModel;
use App\Model\tui\promotion\android\TencentAdvertising as TencentAdvertisingAndroidModel;
use App\Model\tui\promotion\android\KwaiAds as KwaiAdsAndroidModel;
use App\Model\tui\promotion\android\BaiduSearch as BaiduSearchAndroidModel;
use App\Model\tui\promotion\ios\OceanEngine as OceanEngineIosModel;
use App\Model\tui\promotion\ios\TencentAdvertising as TencentAdvertisingIosModel;
use App\Model\tui\promotion\ios\KwaiAds as KwaiAdsIosModel;
use App\Model\tui\promotion\ios\BaiduSearch as BaiduSearchIosModel;
use App\Model\tui\promotion\ios\Clueput as ClueputIosModel;

/**
 * Class TopClient
 * @package client
 */
class TopClient
{
    /**
     * @var string
     */
    protected $host = 'https://www.badiu.com/test';
    /**
     * @var string
     */
    protected $click_api = '/api/click';
    /**
     * @var string
     */
    protected $show_api = '/api/show';

    /**
     * @var array
     */
    protected $devicePars = [

    ];
    protected $DIYPars = [

    ];
    protected $config = [
        //安卓巨量引擎
        'OCEANENGINEANDROID' => [
            'service' => OceanEngineAndroid::class,
            'model' => OceanEngineAndroidModel::class,
        ],
        //IOS巨量引擎
        'OCEANENGINEIOS' => [
            'service' => OceanEngineIos::class,
            'model' => OceanEngineIosModel::class,
        ],

        //安卓广点通
        'TENCENTADVERTISINGANDROID' => [
            'service' => TencentAdvertisingAndroid::class,
            'model' => TencentAdvertisingAndroidModel::class,
        ],
        //IOS广点通
        'TENCENTADVERTISINGIOS' => [
            'service' => TencentAdvertisingIos::class,
            'model' => TencentAdvertisingIosModel::class,
        ],

        //安卓快手
        'KWAIADSANDROID' => [
            'service' => KwaiAdsAndroid::class,
            'model' => KwaiAdsAndroidModel::class,
        ],
        //IOS快手
        'KWAIADSIOS' => [
            'service' => KwaiAdsIos::class,
            'model' => KwaiAdsIosModel::class,
        ],

        //安卓百度大搜
        'BDDSANDROID' => [
            'service' => BaiduSearchAndroid::class,
            'model' => BaiduSearchAndroidModel::class,
        ],
        //IOS百度大搜
        'BDDSIOS' => [
            'service' => BaiduSearchIos::class,
            'model' => BaiduSearchIosModel::class,
        ],
        //线索投放
        'CLUEPUT' => [
            'service' => ClueputIos::class,
            'model' => ClueputIosModel::class,
        ],
    ];
    /**
     * @var KwaiAdsAndroid|OceanEngineAndroid|TencentAdvertisingAndroid|KwaiAdsIos|OceanEngineIos|TencentAdvertisingIos|mixed
     */
    protected $service;
    /**
     * @var KwaiAdsAndroidModel|OceanEngineAndroidModel|TencentAdvertisingAndroidModel|KwaiAdsIosModel|OceanEngineIosModel|TencentAdvertisingIosModel|mixed
     */
    protected $model;


    /**
     * 绑定一个服务
     * @param string $source
     * @return TopClient
     * @throws \Exception
     */
    public function BindService(string $source = ''): TopClient
    {

        if (!isset($this->config[$source])) {
            throw new \Exception('source non-existent');
        }
        if (!$source) {
            throw new \Exception('source is not null');
        }
        $this->service = new $this->config[$source]['service'];
        $this->model   = new $this->config[$source]['model'];

        $this->devicePars = $this->service->getDevicePars();

        $this->setDIYPars(['source' => $source]);

        return $this;
    }

    /**
     * @param string $host
     * @return TopClient
     */
    public function setHost(string $host): TopClient
    {
        $this->host = $host;
        return $this;
    }

    /**
     * @param string $click_api
     * @return TopClient
     */
    public function setClickApi(string $click_api): TopClient
    {
        $this->click_api = $click_api;
        return $this;
    }

    /**
     * @param string $show_api
     * @return TopClient
     */
    public function setShowApi(string $show_api): TopClient
    {
        $this->show_api = $show_api;
        return $this;
    }

    /**
     * 获取点击链接
     * @return string
     */
    public function getClickLink()
    {
        $pars = array_merge($this->devicePars, $this->DIYPars);
        $url  = $this->host . $this->click_api;
        $url  .= stripos($this->host . $this->click_api, '?') !== false ? '&' : '?' . http_build_query($pars);
        return $url;
    }

    /**
     * 获取展示链接
     * @return string
     */
    public function getShowLink(): string
    {
        $pars = array_merge($this->devicePars, $this->DIYPars);
        $url  = $this->host . $this->show_api;
        $url  .= stripos($this->host . $this->show_api, '?') !== false ? '&' : '?' . http_build_query($pars);
        return $url;
    }

    /**
     * @param array $DIYPars
     * @return TopClient
     */
    public function setDIYPars(array $DIYPars): TopClient
    {
        $this->DIYPars = array_merge($this->DIYPars, $DIYPars);
        return $this;
    }

    /**
     * @param array $devicePars
     * @return TopClient
     */
    public function setDevicePars(array $devicePars): TopClient
    {
        $this->devicePars = array_merge($this->devicePars, $devicePars);
        return $this;
    }

    /**
     * @return KwaiAdsAndroid|OceanEngineAndroid|TencentAdvertisingAndroid|BaiduSearchAndroid|KwaiAdsIos|OceanEngineIos|TencentAdvertisingIos|BaiduSearchIos|mixed
     */
    public function getService()
    {
        return $this->service;
    }

    /**
     * @return KwaiAdsAndroidModel|OceanEngineAndroidModel|TencentAdvertisingAndroidModel|BaiduSearchAndroidModel|KwaiAdsIosModel|OceanEngineIosModel|TencentAdvertisingIosModel|BaiduSearchIosModel|mixed
     */
    public function getModel()
    {
        return $this->model;
    }
}