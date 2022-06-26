<?php
namespace app\admin\controller;

use app\admin\model\Student;
use app\admin\model\Teacher;
use think\Session;
use think\Validate;

class PassController extends BaseController
{
    public function teacher()
    {
        $teacher=Teacher::all();
        $this->assign('teacher',$teacher);
        return $this->fetch('pass/index');
    }
    public function updateTeacherPass(){
        $data=request()->post();
        $validate = new Validate(
            [
            'password'=>'require|min:6|max:12',
            ],
            ['password.require'=>'未填写用户密码',
             'password.min'=>'用户密码长度应该在6-12位数',
             'password.max'=>'用户密码长度应该在6-12位数',
            ]);

        if (!$validate->check($data)) {
            Session::flash('teachererror',$validate->getError());
            $this->redirect('admin/teacherpass');
        }else {
            $teacher = Teacher::get($data['teacherId']);
            $teacher->password = md5($data['password']);
            $result = $teacher->save();
            if ($result) {
                // 验证失败 输出错误信息
                Session::flash('teachererror', '修改失败，请重试');
                $this->redirect('admin/teacherpass');
            } else {
                Session::flash('teachersuccess', '修改成功');
                $this->redirect('admin/teacherpass');
            }
        }
    }
    public function student()
    {
        $stu=Student::all();
        $this->assign('student',$stu);
        return $this->fetch('pass/student');
    }
    public function updateStuPass(){
        $data=request()->post();
        $validate = new Validate(
            [
                'password'=>'require|min:6|max:12',
            ],
            ['password.require'=>'未填写用户密码',
                'password.min'=>'用户密码长度应该在6-12位数',
                'password.max'=>'用户密码长度应该在6-12位数',
            ]);

        if (!$validate->check($data)) {
            Session::flash('studenterror',$validate->getError());
            $this->redirect('admin/studentpass');
        }else {
            $stu = Student::get($data['sid']);
            $stu->password = md5($data['password']);
            $result = $stu->save();
            if ($result) {
                // 验证失败 输出错误信息
                Session::flash('studenterror', '修改失败,请重试');
                $this->redirect('admin/studentpass');
            } else {
                Session::flash('studentsuccess', '修改成功');
                $this->redirect('admin/studentpass');
            }
        }
    }
}