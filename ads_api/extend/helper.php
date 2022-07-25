<?php

declare(strict_types=1);

use Hyperf\HttpServer\Contract\ResponseInterface;
use Hyperf\Logger\LoggerFactory;
use Hyperf\Utils\Arr;
use Hyperf\Utils\Str;
use Psr\Log\LoggerInterface;

/**
 * 传递一个model返回这个model当前的sql.
 *
 * @param $model
 *
 * @return mixed|string
 */
function toSql($model)
{
    $sql      = $model->toSql();
    $bindings = $model->getBindings();
    if (!Arr::isAssoc($bindings)) {
        foreach ($bindings as $value) {
            $sql = Str::replaceFirst('?', "'{$value}'", $sql);
        }
    }
    return $sql;
}

/**
 * memory 使用量单位k.
 */
function memory_usage_start()
{
    $start = memory_get_usage();
    \Hyperf\Utils\Context::set('memory_start', $start);
}

/**
 * memory 使用量单位k.
 *
 * @return float|int
 */
function memory_usage_end()
{
    $end   = memory_get_usage();
    $start = \Hyperf\Utils\Context::get('memory_start');
    return ($end - $start) / 1024;
}

/**
 * 从容器获取一个资源.
 */
function container(): Psr\Container\ContainerInterface
{
    return \Hyperf\Utils\ApplicationContext::getContainer();
}

/**
 * 验证器类.
 *
 * @return \Hyperf\Validation\Contract\ValidatorFactoryInterface|mixed
 */
function validator()
{
    return container()->get(\Hyperf\Validation\Contract\ValidatorFactoryInterface::class);
}

/**
 * sha256.
 *
 * @return false|string
 */
function sha256(string $str = '')
{
    return hash('sha256', $str);
}

/**
 * 获取redis实例.
 *
 * @return \Hyperf\Redis\Redis|mixed
 */
function redis()
{
    return container()->get(\Hyperf\Redis\Redis::class);
}

/**
 * Error log.
 *
 * @param mixed $msg
 * @param mixed $context
 */
function loge($msg, $context = [])
{
    go(function () use ($msg, $context) {
        if (!is_array($context)){
            $context = [$context];
        }
        /** @var LoggerInterface $log */
        $log = container()->get(LoggerFactory::class)->get(config('app_name'));
        $log->error($msg, $context);
    });
}

/**
 * Waring log.
 *
 * @param mixed $msg
 * @param mixed $context
 */
function logw($msg, $context = [])
{
    go(function () use ($msg, $context) {
        if (!is_array($context)){
            $context = [$context];
        }
        /** @var LoggerInterface $log */
        $log = container()->get(LoggerFactory::class)->get(config('app_name'));
        $log->warning($msg, $context);
    });
}

/**
 * Debug log.
 *
 * @param mixed $msg
 * @param mixed $context
 */
function logd($msg, $context = [])
{
    go(function () use ($msg, $context) {
        if (!is_array($context)){
            $context = [$context];
        }
        /** @var LoggerInterface $log */
        $log = container()->get(LoggerFactory::class)->get(config('app_name'));
        $log->debug($msg, $context);
    });
}

/**
 * Info log.
 *
 * @param mixed $msg
 * @param mixed $context
 */
function logi($msg, $context = [])
{
    go(function () use ($msg, $context) {
        if (!is_array($context)){
            $context = [$context];
        }
        /** @var LoggerInterface $log */
        $log = container()->get(LoggerFactory::class)->get(config('app_name'));
        $log->info($msg, $context);
    });
}

/**
 * 容器.
 *
 * @param $id
 *
 * @return mixed
 */
function app($id)
{
    return container()->get($id);
}

/**
 * 返回response对象
 *
 * @return mixed|ResponseInterface
 */
function response()
{
    return container()->get(ResponseInterface::class);
}

/**
 * 返回格式化json.
 *
 * @return \Psr\Http\Message\ResponseInterface
 */
function json(array $data = [], int $code = 200, string $message = 'ok'): Psr\Http\Message\ResponseInterface
{
    $return['code']    = (int)$code;
    $return['message'] = (string)$message;
    $return['data']    = [];
    if (!empty($data)) {
        if (is_object($data)) {
            $data = method_exists($data, 'toArray') ? $data->toArray() : $data;
        }
        $return['data'] = is_string($data) ? ['info' => $data] : $data;
    }
    return response()->json($return);
}

/**
 * 全局获取uid除了当前请求协程以外的地方都能拿到.当前请求协程内的子协程也可以获取到,处理逻辑是从Context上下文中先获取，不存在则从当前上下文的request的header中获取.
 *
 * @return string
 */
function uid()
{
    $uid = \Hyperf\Utils\Context::get('uid', 0);
    $request = container()->get(\Hyperf\HttpServer\Contract\RequestInterface::class);
    if ($uid == 0) {
        $uid     = $request->header('uid');
        \Hyperf\Utils\Context::set('uid', $uid);
    }
    loge('uid',[$uid,$request->getRequestUri()]);
    return $uid;
}

/**
 * 获取客户端ip地址
 *
 * @return mixed
 */
function ip()
{
    $res = app(\Hyperf\HttpServer\Contract\RequestInterface::class)->getServerParams();
    if (isset($res['http_client_ip'])) {
        return $res['http_client_ip'];
    } else if (isset($res['http_x_real_ip'])) {
        return $res['http_x_real_ip'];
    } else if (isset($res['http_x_forwarded_for'])) {
        //部分CDN会获取多层代理IP，所以转成数组取第一个值
        $arr = explode(',', $res['http_x_forwarded_for']);
        return $arr[0];
    } else {
        return $res['remote_addr'];
    }
}

