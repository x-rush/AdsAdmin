package cn.edu.neusoft.liruoxing.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.bean.RegisterBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.model.RegisterModel;

public class RegisterActivity extends AppCompatActivity implements RetrofitListener<RegisterBean> {
    @BindView(R.id.phone)
    AutoCompleteTextView phone;
    @BindView(R.id.username)
    AutoCompleteTextView username;
    @BindView(R.id.password)
    EditText mPasswordView;

    @OnClick(R.id.register_button)
    public void register(Button button) {
        button.setClickable(false);
        if (validate()) {
            RegisterModel model = new RegisterModel();
            model.register(this, phone.getText().toString(), mPasswordView.getText().toString(), username.getText().toString());
        } else button.setClickable(true);
    }

    @OnClick(R.id.go_login)
    public void login() {
        startActivity(new Intent(this, LoginActivity.class));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        ButterKnife.bind(this);
    }

    private boolean validate() {
        String number = phone.getText().toString();
        String password = mPasswordView.getText().toString();

        if (number.equals("")) {
            phone.setError("手机号不能为空");
            return false;
        }
        if (password.equals("")) {
            mPasswordView.setError("密码不能为空");
            return false;
        }

        return true;
    }

    @Override
    public void onSuccess(RegisterBean registerBean, int flag) {
        Intent intent = new Intent(this, LoginActivity.class);
        intent.putExtra("phone", phone.getText().toString());
        intent.putExtra("password", mPasswordView.getText().toString());
        startActivity(intent);
    }

    @Override
    public void onFail(String msg) {

    }
}
