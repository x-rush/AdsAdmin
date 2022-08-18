<?php

declare(strict_types=1);
/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://hyperf.wiki
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */
namespace App\Utils;

use App\Exception\ResponseErrorException;
use Hyperf\HttpServer\Contract\RequestInterface;

trait Send
{
    /**
     * 成功返回.
     *
     * @param array $data
     * @param int $code
     * @param string $message
     */
    public static function success($data = [], $code = 200, $message = 'success', array $header = [])
    {
        $result['code'] = (int) $code;
        $result['message'] = (string) $message;
        if (! empty($data)) {
            if (is_object($data)) {
                $data = method_exists($data, 'toArray') ? $data->toArray() : $data;
            }
            $result['data'] = is_string($data) ? ['info' => $data] : $data;

            $result['data'] = self::arrValueToStr($result['data']);
        }
        loge("Send",['url'=>app(RequestInterface::class)->getRequestUri(),'uid'=>uid(),'ret'=>$result]);
        return $result;
    }

    public static function arrValueToStr($array)
    {
        if (is_array($array)) {
            foreach ($array as $k => $v) {
                $array[$k] = self::arrValueToStr($array[$k]);
            }
        } else {
            if (is_int($array) || is_null($array) || is_float($array) || is_bool($array)) {
                return (string) $array;
            }
        }
        return $array;
    }

    /**
     * 错误接口返回.
     *
     * @param string $message
     * @param int $code
     * @param array $data
     */
    public static function error($message = 'error', $code = 300, $data = [], array $header = [])
    {
        throw new ResponseErrorException($code, $message, $data);
    }

    /**
     * 获取当前的response 输出类型.
     * @return string
     */
    public static function getResponseType()
    {
        return 'json';
    }
}
