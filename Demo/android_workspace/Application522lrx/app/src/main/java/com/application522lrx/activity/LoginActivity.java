package com.application522lrx.activity;


import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;

import com.application522lrx.bean.UserBean;
import com.application522lrx.iface.LoginListener;
import com.application522lrx.model.LoginModel;
import com.application522lrx.R;

/**
 * Created by Administrator on 2017/5/25.
 */

public class LoginActivity extends AppCompatActivity implements LoginListener {

    private EditText editText_account,editText_password;
    private Button button_register;
    private Button button_login;
    private CheckBox checkBox_remember;
    private Context context;


    private SharedPreferences preferences;
    final static String PREF_NAME="loginPref";

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        getSupportActionBar().hide();
        setContentView(R.layout.welcome);


        button_register = (Button) findViewById(R.id.button_register);
        button_login = (Button) findViewById(R.id.button_login);
        checkBox_remember=(CheckBox)findViewById(R.id.checkBox);
        editText_account=(EditText)findViewById(R.id.editText_account);
        editText_password=(EditText)findViewById(R.id.editText_password);

        context=LoginActivity.this;
        preferences= getSharedPreferences(PREF_NAME,MODE_PRIVATE);
        boolean isChecked =preferences.getBoolean("isChecked",false);
        if(isChecked)
        {
            String userName=preferences.getString("userName","");
            String password =preferences.getString("password","");
            editText_account.setText(userName);
            editText_password.setText(password);
            checkBox_remember.setChecked(isChecked);
        }
        button_register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent register_intent = new Intent(LoginActivity.this,Register.class);
                startActivity(register_intent);
//                finish();
            }
        });

        button_login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String s_username=editText_account.getText().toString();
                String password=editText_password.getText().toString();
                LoginModel mode=new LoginModel();
                mode.login(s_username,password,LoginActivity.this);
            }
        });
    }

    @Override
    public void onResponse(UserBean userBean) {
        //获取sessionId
        String sessionId=userBean.getSessionid();
        //利用简单存储
        System.out.println("----sessionid"+sessionId);
        SharedPreferences.Editor editor =preferences.edit();
        editor.putString("SessionID",sessionId);

        editor.putBoolean("isChecked",checkBox_remember.isChecked());
        if(checkBox_remember.isChecked()){
            editor.putString("userName",editText_account.getText().toString());
            System.out.println("----name"+editText_account.getText().toString());
            editor.putString("password",editText_password.getText().toString());
            System.out.println("----password"+editText_password.getText().toString());
        }
        editor.commit();

        Intent login_intent = new Intent(LoginActivity.this,MainActivity.class);
        startActivity(login_intent);
        finish();
    }

    @Override
    public void onFail(String msg) {
        System.out.println("----fail---");


    }

}
