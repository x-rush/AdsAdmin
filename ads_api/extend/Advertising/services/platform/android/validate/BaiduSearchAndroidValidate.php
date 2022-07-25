<?php


namespace Advertising\services\platform\android\validate;


trait BaiduSearchAndroidValidate
{
    /**
     * 请求参数验证
     * @param $input
     * @return mixed
     */
    public function RequestValidate($input)
    {
        extract($input);
        foreach ($this->devicePars as $k => $v) {
            if (!isset($$k))
                $this->setError('缺少参数:' . $k);
            if (in_array($k, ['click_id', 'imei_md5', 'oaid', 'mac']) && $$k == $v)
                die('success');
        }
        $input['imei'] = '';
        $input['androidid'] = '';
        //imei验证
        if (isset($imei_md5) && $imei_md5)
            $input['imei_md5'] = '';

        //oaid验证
        if (isset($oaid) && $oaid == 0 && in_array($oaid, ['', '00000000-0000-0000-0000-000000000000'])) {
            $input['oaid']     = '';
            $input['oaid_md5'] = '';
        }
        if ($input['oaid']){
            $input['oaid_md5'] = md5($input['oaid']);
        }
        //mac地址格式匹配
        if (isset($mac)) {
            $input['mac'] = str_replace(':', '', $mac);
            $input['mac'] = strtoupper($mac);
            if (in_array($mac, ['020000000000', '02:00:00:00:00:00', ''])) {
                $input['mac'] = '';
                $input['mac_md5'] = '';
            }
        }

        $input['android_id_md5'] = '';
        if (isset($androidid) && $androidid){
            $input['android_id_md5'] = md5($androidid);
        }
        if ($input['mac']){
            $input['mac_md5'] = md5($input['mac']);
        }
        return $input;
    }
}