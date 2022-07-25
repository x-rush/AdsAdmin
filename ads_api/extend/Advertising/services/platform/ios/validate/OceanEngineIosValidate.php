<?php


namespace Advertising\services\platform\ios\validate;


use App\Utils\Send;

trait OceanEngineIosValidate
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
            if (in_array($k, ['idfa', 'mac']) && $$k == $v)
                Send::error('success',200);
        }
        //idfa验证
        if (isset($idfa) && $idfa == 0 && in_array($idfa, ['', '00000000-0000-0000-0000-000000000000'])) {
            $input['idfa']     = '';
            $input['idfa_md5']     = '';
        }else{
            $input['idfa_md5'] = md5($input['idfa']);
        }
        //mac地址格式匹配
        if (isset($mac)) {
            $input['mac'] = str_replace(':', '', $mac);
            $input['mac'] = strtoupper($mac);
            if (in_array($mac, ['020000000000', '02:00:00:00:00:00', ''])) {
                $input['mac'] = '';
            }
        }
        return $input;
    }
}