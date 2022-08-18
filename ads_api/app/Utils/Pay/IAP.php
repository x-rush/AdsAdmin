<?php
/**
 * Created by PHP@大海 [三十年河东三十年河西,莫欺少年穷.!]
 *  十年生死两茫茫，写程序，到天亮。
 *      千行代码，Bug何处藏。
 *  纵使上线又怎样，朝令改，夕断肠。
 *
 *  领导每天新想法，天天改，日日忙。
 *     相顾无言，惟有泪千行。
 *  每晚灯火阑珊处，夜难寐，加班狂。
 */

namespace App\Utils\Pay;

use App\Utils\Send;

/**
 * 苹果内购
 * 错误码
 * 21000 App Store不能读取你提供的JSON对象
 * 21002 receipt-data域的数据有问题
 * 21003 receipt无法通过验证
 * 21004 提供的shared secret不匹配你账号中的shared secret
 * 21005 receipt服务器当前不可用
 * 21006 receipt合法，但是订阅已过期。服务器接收到这个状态码时，receipt数据仍然会解码并一起发送
 * 21007 receipt是Sandbox receipt，但却发送至生产系统的验证服务
 * 21008 receipt是生产receipt，但却发送至Sandbox环境的验证服务
 *
 */
class IAP
{
    /**
     * @var string 测试时使用
     */
    private $testUrl = 'https://sandbox.itunes.apple.com/verifyReceipt';
    /**
     * @var string 正式时使用
     */
    private $url = 'https://buy.itunes.apple.com/verifyReceipt';
    /**
     * @var string 凭证
     */
    private $receipt;
    /**
     * @var string 密码
     */
    private $password;
    /**
     * @var array 苹果服务器返回的数据
     */
    private $returnData = [];

    /**
     * ApplePay constructor.
     * @param string $receipt 凭证
     * @param string $password 密码
     */
    public function __construct(string $receipt, string $password = '')
    {
        $this->receipt  = $receipt;
        $this->password = $password;
    }

    /**
     * 验证凭证
     * @param bool $sendBox 是否使用沙箱环境
     * @return bool
     */
    private function verify(bool $sandbox = false)
    {
        if (strlen($this->receipt) < 10) {
            Send::error('凭证数据长度太短，请确定数据正确！',22002);
        }
        $return = $this->postData($this->receipt, $this->password, $sandbox ? $this->testUrl : $this->url);
        if ($return) {
            $this->returnData = json_decode($return, true);
            if ($this->returnData['status'] !== 0) {
                $this->setStatusError($this->returnData['status']);
            }
            return $this->returnData;
        }
        Send::error('与苹果服务器通讯失败',22001);
    }

    /**
     * 验证凭证
     * @param bool $sandbox 是否沙盒环境
     * @return bool
     */
    public function verifyReceipt(bool $sandbox = false)
    {
        if ($result = $this->verify($sandbox)) {
            return $result;
        }
        return false;
    }

    /**
     * 设置状态错误消息
     * @param $status
     */
    private function setStatusError($status): void
    {
        $errCode = [
            21000 => 'AppleStore不能读取你提供的JSON对象',
            21002 => 'receipt-data域的数据有问题',
            21003 => 'receipt无法通过验证',
            21004 => '提供的shared secret不匹配你账号中的shared secret',
            21005 => 'receipt服务器当前不可用'
        ];
        if (isset($errCode[(int)$status])){
            Send::error($errCode[(int)$status],$status);
        }elseif ((int)$status == 21007){
            $this->verifyReceipt(true);
        }elseif ((int)$status == 21008){
            $this->verifyReceipt(false);
        }elseif ((int)$status == 21006){
            return;
        }elseif ((int)$status != 0){
            Send::error('未知错误',501);
        }
    }

    /**
     * 返回交易id
     * @return mixed
     */
    public function getTransactionId()
    {
        return $this->returnData['receipt']['in_app'][0]['transaction_id'];
    }

    /**
     * 查询数据是否有效
     * @param $productId
     * @param \Closure $callback
     * @return bool
     */
    public function query($productId, \Closure $callback)
    {
        if ($this->returnData) {
            if ($this->returnData['status'] === 0) {
                if ($productId === $this->returnData['receipt']['in_app'][0]['product_id']) {
                    return $callback($this->getTransactionId(), $this->returnData);
                }
                Send::error('非法的苹果商店product_id，这个凭证有可能是伪造的！',22003);
            }
            Send::error('苹果服务器返回订单状态不正确',22004);
        }
        Send::error('非法的苹果商店product_id，这个凭证有可能是伪造的！',22003);
    }

    /**
     * curl提交数据
     * @param $receipt_data
     * @param string $password
     * @param $url
     * @return bool|string
     */
    private function postData($receipt_data, string $password, $url)
    {
        $postData = ['receipt-data' => $receipt_data, 'password' => $password];
        $ch       = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }
}