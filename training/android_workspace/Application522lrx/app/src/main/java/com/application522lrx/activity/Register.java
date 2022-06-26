package com.application522lrx.activity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.application522lrx.iface.RegisterListener;
import com.application522lrx.model.RegisterMode;
import com.application522lrx.R;

/**
 * Created by Administrator on 2017/5/25.
 */

public class Register extends AppCompatActivity implements RegisterListener,View.OnClickListener {

    private EditText et_username,et_password,et_rePassword,et_tel;
    private Button register;
    private Button back;
    private Context context;

    private SharedPreferences preferences;
    final static String PREF_NAME="loginPref";


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        getSupportActionBar().hide();
        setContentView(R.layout.register);
        initView();
    }

    private void initView() {
        et_username= (EditText) findViewById(R.id.editText_username);
        et_password= (EditText) findViewById(R.id.editText_password);
        et_rePassword= (EditText) findViewById(R.id.editText_rePassword);
        et_tel= (EditText) findViewById(R.id.editText_tel);
        back= (Button) findViewById(R.id.button_back);
        register= (Button) findViewById(R.id.button_registion);
        register.setOnClickListener(this);
        back.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId())
        {
            case R.id.button_registion:
                String userName=et_username.getText().toString();
                String password1=et_password.getText().toString();
                String password2=et_rePassword.getText().toString();
                if(!password1.equals(password2)){
                    et_rePassword.setError("密码不一致");
                    return;
                }
                String tel=et_tel.getText().toString();
                RegisterMode mode = new RegisterMode();
                mode.register(userName,password1,tel,this);
                break;
            case R.id.button_back:
                Intent intent = new Intent(Register.this,LoginActivity.class);
                startActivity(intent);
                break;
        }
    }

    @Override
    public void onResponse(String regInfo) {
        if(regInfo.contains("1"))
            Toast.makeText(this,"注册成功",Toast.LENGTH_SHORT).show();
        else
            Toast.makeText(this,"注册失败，用户名已存在",Toast.LENGTH_SHORT).show();

    }

    @Override
    public void onFail(String msg) {

    }
}
