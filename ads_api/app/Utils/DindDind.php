<?php

namespace App\Utils;

trait DindDind
{
    public static $url = "https://oapi.dingtalk.com/robot/send";

    public static $access_token = "";

    public static $keyworld = [
        "AppBug周知:"
    ];

    /**
     * 钉钉输出
     */
    public static function Send($data, $keyworld = 0)
    {
        $content = self::$keyworld[$keyworld] . "\n" . config('project.project_cn')."对接\n";
        $content .= $data;
        $msg     = [
            "msgtype" => "text",
            "text" => [
                "content" => $content
            ],
            "at" => [
                "atMobiles" => [
                    ""
                ],
                "isAtAll" => false
            ]
        ];
        self::request(json_encode($msg, true));
        return $msg;
    }

    /**
     * @param $content
     * @return bool|string
     */
    public static function request($content)
    {
        $url = self::$url . "?access_token=" . self::$access_token;
        $ch  = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json;charset=utf-8'));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        // 线下环境不用开启curl证书验证, 未调通情况可尝试添加该代码
        // curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);
        // curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }

    /**
     * 产品赚钱周知
     */
    public static function PaySend($data)
    {
        self::$access_token = '';
        $content            = self::$keyworld[1] . "\n";
        $content            .= $data;
        $msg                = [
            "msgtype" => "text",
            "text" => [
                "content" => $content
            ],
            "at" => [
                "atMobiles" => [
                    "",
                    "",
                    "",
                    "",
                    ""
                ],
                "isAtAll" => false
            ]
        ];
        self::request(json_encode($msg, true));
        return $msg;
    }
}