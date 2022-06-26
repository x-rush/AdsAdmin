<?php
/**
 * Created by PhpStorm.
 * User: www44
 * Date: 2018/7/7
 * Time: 10:57
 */

class  ErrorInfo extends \think\Exception {
    const USERNAME_EXISTED=0001;//注册用户名已存在
    const PASSWORD_CANNOT_EMPTY=0002;//密码不能为空
    const LONGIN_FAIL=0003;//登录失败，用户名或密码错误
    const ACTIVITY_IS_EMPTY=0004;//活动列表为空
    const ACTIVITY_ID_CANNOT_EMPTY=0005;//活动id不能为空
    const ACTIVITY_GET_FAILED=0006;//活动获取失败
}