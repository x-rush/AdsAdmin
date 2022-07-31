package cn.edu.neusoft.liruoxing522.foodorder.activity;

import android.content.Intent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.security.MessageDigest;

import cn.edu.neusoft.liruoxing522.foodorder.bean.RegisterBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.UserBean;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.model.ChangeModel;
import cn.edu.neusoft.liruoxing522.foodorder.model.UserModel;
import cn.edu.neusoft.liruoxing522.foodorder.R;

import static cn.edu.neusoft.liruoxing522.foodorder.Server.user_id_remember;

public class ChangeInfoActivity extends BaseActivity {
    EditText et_user,et_password,et_newpass,et_checkpass,et_phone,et_address;
    Button btn_change,btn_back;
    String username,userpass;
    String userid,checkpassword;
    TListener<UserBean> listener = new TListener<UserBean>() {
        @Override
        public void onResponse(UserBean userBean) {
            et_user.setText(userBean.getUsername().toString());
            et_phone.setText(userBean.getMobilenum().toString());
            et_address.setText(userBean.getAddress().toString());
            checkpassword=userBean.getUserpass().toString();
            showToast(userBean.getUser_id()+"");
        }

        @Override
        public void onFail(String msg) {
            showToast("Fail");
        }
    };

    TListener<RegisterBean> tListener = new TListener<RegisterBean>() {
        @Override
        public void onResponse(RegisterBean registerBean) {
            if(registerBean.getSuccess().toString().equals("1")){
                showToast("修改成功");
                finish();
                restartApplication();
            }else{
                showToast("修改失败");
            }
        }

        @Override
        public void onFail(String msg) {
            showToast("修改失败");
        }
    };

    public void initView(){
        getSupportActionBar().hide();
        setLayout_file(R.layout.activity_changeinfo);
        et_user = (EditText)findViewById(R.id.et_username);
        et_password = (EditText)findViewById(R.id.et_userpassword);
        et_newpass = (EditText)findViewById(R.id.et_newpassword);
        et_checkpass = (EditText)findViewById(R.id.et_checkpass);
        et_phone= (EditText) findViewById(R.id.et_phone);
        et_address= (EditText) findViewById(R.id.et_address);

        btn_change = (Button)findViewById(R.id.btn_change);
        btn_back= (Button) findViewById(R.id.button_back);


    }

    @Override
    void initEvent() {

        UserModel userModel = new UserModel();
        userModel.getUserMeg(user_id_remember,listener);
        btn_change.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(et_newpass.getText().toString().trim().equals("")||et_password.getText().toString().trim().equals("")||
                        et_checkpass.getText().toString().trim().equals("")){
                    Toast.makeText(ChangeInfoActivity.this,"信息填写不完整",Toast.LENGTH_SHORT).show();
                }
                else{
                    if(et_password.getText().toString().trim().equals(et_checkpass.getText().toString().trim())||
                            checkpassword.equals(encrypt(et_password.getText().toString()))){

                        String username, password, mobile, address;
                        username = et_user.getText().toString();
                        password = et_checkpass.getText().toString();
                        mobile = et_phone.getText().toString();
                        address = et_address.getText().toString();

                        ChangeModel changeModel = new ChangeModel();
                        changeModel.getChangeMeg(user_id_remember, username, password, mobile, address, tListener);

                    }else {
                        showToast("确认密码或原密码有误");
                    }
                }
            }
        });
        btn_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    @Override
    void initData() {

    }
    //MD5加密工具类
    public final static String  encrypt(String plaintext) {
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f' };
        try {
            byte[] btInput = plaintext.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            return null;
        }
    }
    private void restartApplication() {
        final Intent intent1 = getPackageManager().getLaunchIntentForPackage(getPackageName());
        intent1.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(intent1);
    }
}
