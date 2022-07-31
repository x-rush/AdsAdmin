<?php

/**
 *+----------------------------------------------------------
 * 字符串截取，支持中文和其他编码
 *+----------------------------------------------------------
 * @static
 * @access public
 *+----------------------------------------------------------
 * @param string $str 需要转换的字符串
 * @param string $start 开始位置
 * @param string $length 截取长度
 * @param string $charset 编码格式
 * @param string $suffix 截断显示字符
 *+----------------------------------------------------------
 * @return string
 *+----------------------------------------------------------
 */

function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true){
    if(function_exists("mb_substr")){
        if($suffix){
            if(strlen($str)>$length)
                return mb_substr($str, $start, $length, $charset)."...";
            else
                return mb_substr($str, $start, $length, $charset);
        }else{
            return mb_substr($str, $start, $length, $charset);
        }
    }elseif(function_exists('iconv_substr')) {
        if($suffix){
            return iconv_substr($str,$start,$length,$charset);
        }else{
            return iconv_substr($str,$start,$length,$charset);
        }
    }
}
/**
 * 邮件发送函数
 */
function sendMail($to, $title, $content) {
    Vendor ( 'PHPMailer.PHPMailerAutoload' );
    $mail = new PHPMailer (); // 实例化
    // $mail->SMTPDebug = 2;
    $mail->IsSMTP (); // 启用SMTP
    $mail->Host = config( 'MAIL_HOST' ); // smtp服务器的名称（这里以QQ邮箱为例）
    $mail->SMTPAuth =config( 'MAIL_SMTPAUTH' ); // 启用smtp认证
    $mail->Username =config( 'MAIL_USERNAME' ); // 你的邮箱名
    $mail->Password =config( 'MAIL_PASSWORD' ); // 邮箱密码
    $mail->From = config( 'MAIL_FROM' ); // 发件人地址（也就是你的邮箱地址）
    $mail->FromName =config( 'MAIL_FROMNAME' ); // 发件人姓名
    //设置使用ssl加密方式登录鉴权
    $mail->SMTPSecure = 'ssl';
    // //设置ssl连接smtp服务器的远程服务器端口号，可选465或587
    $mail->Port = 465;
    $mail->AddAddress($to, "尊敬的客户" );
    $mail->WordWrap = 50; // 设置每行字符长度
    $mail->IsHTML(config( 'MAIL_ISHTML' )); // 是否HTML格式邮件
    $mail->CharSet = config( 'MAIL_CHARSET' ); // 设置邮件编码
    $mail->Subject = $title; // 邮件主题
    $mail->Body = $content; // 邮件内容
    $mail->AltBody = "这是一个纯文本的身体在非营利的HTML电子邮件客户端"; // 邮件正文不支持HTML的备用显示
    return ($mail->Send ());
}

/**
 * 功能：生成二维码
 * @param string $qrData 手机扫描后要跳转的网址
 * @param string $qrLevel 默认纠错比例 分为L、M、Q、H四个等级，H代表最高纠错能力
 * @param string $qrSize 二维码图大小，1－10可选，数字越大图片尺寸越大
 * @param string $savePath 图片存储路径
 * @param string $savePrefix 图片名称前缀
 */
function createQRcode($savePath, $qrData = 'PHP QR Code :)', $qrLevel = 'L', $qrSize = 4, $savePrefix = 'qrcode')
{
    vendor('phpqrcode.phpqrcode');
    if (!isset($savePath)) return '';
    //设置生成png图片的路径
    $PNG_TEMP_DIR = $savePath;

    //检测并创建生成文件夹
    if (!file_exists($PNG_TEMP_DIR)) {
        mkdir($PNG_TEMP_DIR);
    }
    $filename = $PNG_TEMP_DIR . 'test.png';
    $errorCorrectionLevel = 'L';
    if (isset($qrLevel) && in_array($qrLevel, ['L', 'M', 'Q', 'H'])) {
        $errorCorrectionLevel = $qrLevel;
    }
    $matrixPointSize = 4;
    if (isset($qrSize)) {
        $matrixPointSize = min(max((int)$qrSize, 1), 10);
    }
    if (isset($qrData)) {
        if (trim($qrData) == '') {
            die('data cannot be empty!');
        }
        //生成文件名 文件路径+图片名字前缀+md5(名称)+.png
        $filename = $PNG_TEMP_DIR . $savePrefix . md5($qrData . '|' . $errorCorrectionLevel . '|' . $matrixPointSize) . '.png';
        //开始生成
        QRcode::png($qrData, $filename, $errorCorrectionLevel, $matrixPointSize, 2);
    } else {
        //默认生成
        QRcode::png('PHP QR Code :)', $filename, $errorCorrectionLevel, $matrixPointSize, 2);
    }
    if (file_exists($PNG_TEMP_DIR . basename($filename)))
        return basename($filename);
    else
        return FALSE;
}

//取子分类
function Lesson_videos($table,$sid){
    $where['lessonid']=$sid;
    $list=\think\Db::table(''.$table)->where($where)->order('lessonid')->select();
    return $list;
}



