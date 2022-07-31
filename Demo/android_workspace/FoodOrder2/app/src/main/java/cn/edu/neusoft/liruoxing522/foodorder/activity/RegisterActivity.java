package cn.edu.neusoft.liruoxing522.foodorder.activity;

import android.content.Intent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.R;
import cn.edu.neusoft.liruoxing522.foodorder.bean.RegisterBean;
import cn.edu.neusoft.liruoxing522.foodorder.model.RegisterModel;

import static cn.edu.neusoft.liruoxing522.foodorder.Server.BOOL_FLAG;

public class RegisterActivity extends BaseActivity {

    EditText et_username,et_userpassword,et_checkpass,et_phone,et_comment,et_address;
    Button btn_register;

    TListener<RegisterBean> tListener=new TListener<RegisterBean>() {
        @Override
        public void onResponse(RegisterBean registerBean) {
            String success=registerBean.getSuccess().toString();
            if(success.equals("0")){
                Toast.makeText(RegisterActivity.this,"注册失败",Toast.LENGTH_SHORT).show();
            }else{
                Toast.makeText(RegisterActivity.this,"注册成功",Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(RegisterActivity.this,LoginActivity.class);
                intent.putExtra("username", et_username.getText().toString().trim()+"");
                BOOL_FLAG=true;
                startActivity(intent);
                finish();
            }
        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(RegisterActivity.this,"注册失败",Toast.LENGTH_SHORT).show();
        }
    };
    @Override
    void initView() {
        setLayout_file(R.layout.activity_register);
        et_username=(EditText)findViewById(R.id.et_username);
        et_userpassword=(EditText)findViewById(R.id.et_userpassword);
        et_checkpass=(EditText)findViewById(R.id.et_checkpass);
        et_phone=(EditText)findViewById(R.id.et_phone);
        et_address=(EditText)findViewById(R.id.et_address);
        et_comment=(EditText)findViewById(R.id.et_comment);
        btn_register=(Button)findViewById(R.id.button_register);
    }

    @Override
    void initEvent() {
        btn_register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String username=et_username.getText().toString();
                String password=et_userpassword.getText().toString();
                String checkpass=et_checkpass.getText().toString();
                String phone=et_phone.getText().toString();
                String address=et_address.getText().toString();
                String commont=et_comment.getText().toString();
                if(username.trim().equals("")||password.trim().equals("")||checkpass.trim().equals("")||
                        phone.trim().equals("")||address.trim().equals("")||commont.trim().equals("")){
                    Toast.makeText(RegisterActivity.this,"请将信息填写完整",Toast.LENGTH_SHORT).show();
                }else if(!password.equals(checkpass)){
                    Toast.makeText(RegisterActivity.this,"两次密码不一致",Toast.LENGTH_SHORT).show();
                }else {
                    RegisterModel model = new RegisterModel();
                    model.getReglist(username,password,phone,address,commont,tListener);
                }
            }
        });

    }

    @Override
    void initData() {

    }
}
