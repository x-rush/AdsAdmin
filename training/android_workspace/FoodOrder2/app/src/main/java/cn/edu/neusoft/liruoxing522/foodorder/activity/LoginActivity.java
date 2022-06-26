package cn.edu.neusoft.liruoxing522.foodorder.activity;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.support.annotation.RequiresApi;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.R;
import cn.edu.neusoft.liruoxing522.foodorder.bean.LoginBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.RegisterBean;
import cn.edu.neusoft.liruoxing522.foodorder.model.LoginModel;

import static cn.edu.neusoft.liruoxing522.foodorder.Server.BOOL_FLAG;
import static cn.edu.neusoft.liruoxing522.foodorder.Server.user_id_remember;

public class LoginActivity extends BaseActivity {
    private EditText et_user,et_password;
    private Button btn_login;
    private TextView tv_register,tv_phoneReg;
    private String username,userpass;
    private CheckBox checkBox;
    private String userid;
    private String country,phone,randomPass;

    TListener<RegisterBean> ttListener=new TListener<RegisterBean>() {
        @Override
        public void onResponse(RegisterBean registerBean) {
            String success=registerBean.getSuccess().toString();
            if(success.equals("0")){
                Toast.makeText(LoginActivity.this,"注册失败,用户名可能已注册",Toast.LENGTH_SHORT).show();
            }else{
                Toast.makeText(LoginActivity.this,"注册成功",Toast.LENGTH_SHORT).show();
                showToast("初始密码为电话后4位数："+randomPass);
                finish();
            }
        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(LoginActivity.this,"注册失败",Toast.LENGTH_SHORT).show();
        }
    };

    TListener<LoginBean> tListener = new TListener<LoginBean>() {
        @Override
        public void onResponse(LoginBean loginBean) {
            userid = loginBean.getUserid().toString();
            //记录用户id
            user_id_remember= Integer.parseInt(userid);
//            Toast.makeText(LoginActivity.this,"用户id:"+userid,Toast.LENGTH_SHORT).show();
            if(loginBean.getUserid().toString().equals("0")){
                Toast.makeText(LoginActivity.this,"登陆失败",Toast.LENGTH_SHORT).show();
            }
            else{
                Toast.makeText(LoginActivity.this,"登陆成功",Toast.LENGTH_SHORT).show();
                Intent intent = new Intent();
                intent.setClass(LoginActivity.this, MainActivity.class);
                startActivity(intent);
                finish();
            }
        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(LoginActivity.this,"登陆失败",Toast.LENGTH_SHORT).show();
        }
    };

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    public void initView(){

        getSupportActionBar().hide();
        setStatusBarColor(this, ContextCompat.getColor(this, R.color.colorPrimaryDark));
        setLayout_file(R.layout.activity_login);
        et_user = (EditText)findViewById(R.id.editText_user);
        et_password = (EditText)findViewById(R.id.editText_password);
        btn_login = (Button)findViewById(R.id.button_login);
        tv_register = (TextView)findViewById(R.id.register);
        checkBox = (CheckBox)findViewById(R.id.checkBox);
        tv_phoneReg= (TextView) findViewById(R.id.tv_phoneReg);

        boolean check=getUser_remember();
        String receive = getIntent().getStringExtra("username");

        if(check){
            username = getUser_name();
            userpass = getUser_password();
            et_user.setText(username);
            et_password.setText(userpass);
        }
        //用户注册账号成功后会把用户名传过来，用户直接输密码即可
        if(BOOL_FLAG) {
            et_user.setText(receive);
            et_password.setText("");
            BOOL_FLAG=false;
        }
        //光标移到最后
        et_user.setSelection(et_user.getText().length());
        et_password.setSelection(et_password.getText().length());
    }

    @Override
    void initEvent() {
        btn_login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(et_user.getText().toString().trim().equals("")||et_password.getText().toString().trim().equals("")){
                    Toast.makeText(LoginActivity.this,"用户名和密码不能为空",Toast.LENGTH_SHORT).show();
                }
                else{
                    //先到服务器判断用户名密码信息是否存在再决定是否保存
                    String username = et_user.getText().toString();
                    String password = et_password.getText().toString();
                    LoginModel loginModul = new LoginModel();
                    loginModul.getUserList(username,password,tListener);

                    if(checkBox.isChecked()){
                        saveUser();
                    }
                }
            }
        });

        tv_register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(LoginActivity.this,RegisterActivity.class);
                startActivity(intent);
            }
        });

    }

    @Override
    void initData() {

    }

    //保存用户名和密码
    public void saveUser(){
        SharedPreferences sp = getSharedPreferences("userInfo",MODE_PRIVATE);
        SharedPreferences.Editor editor = sp.edit();
        editor.putString("username",et_user.getText().toString());
        editor.putString("userpass",et_password.getText().toString());
        editor.putBoolean("remember",checkBox.isChecked());
        editor.putString("id",userid);
//        showToast(userid);
        editor.commit();
    }
    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    static void setStatusBarColor(Activity activity, int statusColor) {
        Window window = activity.getWindow();
        //取消状态栏透明
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        //添加Flag把状态栏设为可绘制模式
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        //设置状态栏颜色
        window.setStatusBarColor(statusColor);
        //设置系统状态栏处于可见状态
        window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_VISIBLE);
        //让view不根据系统窗口来调整自己的布局
        ViewGroup mContentView = (ViewGroup) window.findViewById(Window.ID_ANDROID_CONTENT);
        View mChildView = mContentView.getChildAt(0);
        if (mChildView != null) {
            ViewCompat.setFitsSystemWindows(mChildView, false);
            ViewCompat.requestApplyInsets(mChildView);
        }
    }


}
