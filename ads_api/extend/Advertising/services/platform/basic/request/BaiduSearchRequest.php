<?php


namespace Advertising\services\platform\basic\request;


use app\commons\traits\Send;

trait BaiduSearchRequest
{
    public  $callbackUrl = '';
    public  $ATYPE = 'activate';
    public  $AVALUE = 0;
    protected $akey = 'MzE0MTk1Mjc=';

    public function setCallbackParam(array $input){
        $input['callback_url']
            ?:Send::error('callback_url不能为空');
        $this->callbackUrl = $input['callback_url'];

        $this->setAVALUE($input['AVALUE']??$this->getAVALUE());

        $this->callbackUrl = str_replace('{{ATYPE}}',$this->getATYPE(),$this->callbackUrl);
        $this->callbackUrl = str_replace('{{AVALUE}}',$this->getAVALUE(),$this->callbackUrl);

        return $this;
    }

    /**
     * @return string
     */
    public function getATYPE(): string
    {
        return $this->ATYPE;
    }

    /**
     * @param string $ATYPE
     */
    public function setATYPE(string $ATYPE)
    {
        $this->ATYPE = $ATYPE;
    }

    /**
     * @return int
     */
    public function getAVALUE(): int
    {
        return $this->AVALUE;
    }

    /**
     * @param int $AVALUE
     */
    public function setAVALUE(int $AVALUE)
    {
        $this->AVALUE = $AVALUE;
    }
    /**
     * 回调请求发送
     * @return array
     */
    public function send()
    {

        $params = [
            'sign' => md5($this->callbackUrl.$this->akey)
        ];
        $info = self::get($this->callbackUrl,$params);
        return [
            'param' => $params,
            'result' => $info
        ];
    }
}