<?php


namespace App\Utils;



class Wechat
{
    /**
     * 获取openid AccessToken
     * @param $code
     * @return mixed|array|string|null|void|Json
     */
    public static function getCodeInfo($code)
    {
        $url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" . config('project.wxchat_appid') . "&secret=" . config('project.wxchat_secret') . "&code={$code}&grant_type=authorization_code";

        $wxInfo = HttpService::get($url);
        //微信API返回openid AccessToken
        $info = json_decode($wxInfo, true);
        if (isset($info['errcode'])) {
            Send::error('请重新登录');
        }
        return $info;
    }

    /**
     * AccessToken
     * @param $refresh_token
     * @return mixed
     */
    public static function saveAccessToken($refresh_token)
    {
        $url = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=" . config('project.wxchat_appid') . "&grant_type=refresh_token&refresh_token={$refresh_token}";

        $wxInfo = HttpService::get($url);
        //微信API返回openid AccessToken
        $info = json_decode($wxInfo, true);

        return $info;
    }


    /**
     * 获取微信用户信息
     * @param $access_token
     * @param $openid
     * @return mixed
     */
    public static function getWxUser($access_token, $openid)
    {
        $url = "https://api.weixin.qq.com/sns/userinfo?access_token={$access_token}&openid={$openid}";

        $wxInfo = HttpService::get($url);
        //微信API返回openid AccessToken
        $info = json_decode($wxInfo, true);

        return $info;
    }
}