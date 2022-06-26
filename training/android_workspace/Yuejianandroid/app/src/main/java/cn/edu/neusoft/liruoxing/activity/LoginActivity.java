package cn.edu.neusoft.liruoxing.activity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.bean.LoginBean;
import cn.edu.neusoft.liruoxing.model.LoginModel;
import cn.edu.neusoft.liruoxing.service.LoginService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class LoginActivity extends AppCompatActivity {
    @BindView(R.id.name)
    AutoCompleteTextView mNameView;
    @BindView(R.id.password)
    EditText mPasswordView;
    @BindView(R.id.sign_in_button)
    Button sign_in_button;

    Context context = this;

    @OnClick(R.id.sign_in_button)
    public void login(Button button) {
        button.setClickable(false);
        if (validate()) {
            login();
        } else button.setClickable(true);
    }

    @OnClick(R.id.go_register)
    public void register() {
        startActivity(new Intent(this, RegisterActivity.class));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        ButterKnife.bind(this);
        initData();
    }

    private void initData() {
        try {
            mNameView.setText(getIntent().getStringExtra("phone"));
            mPasswordView.setText(getIntent().getStringExtra("password"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private boolean validate() {
        String name = mNameView.getText().toString();
        String password = mPasswordView.getText().toString();

        if (name.equals("")) {
            mNameView.setError("用户名不能为空");
            return false;
        }
        if (password.equals("")) {
            mPasswordView.setError("密码不能为空");
            return false;
        }

        return true;
    }

    private void login() {
        LoginService loginService = new LoginModel().model().create(LoginService.class);
        Call<LoginBean> call = loginService.login(mNameView.getText().toString(), mPasswordView.getText().toString());

        call.enqueue(new Callback<LoginBean>() {
            @Override
            public void onResponse(Response<LoginBean> response) {
                try {
                    if (response.body().getStatus() == 0) {
                        Toast.makeText(context, "登录失败", Toast.LENGTH_LONG).show();
                        sign_in_button.setClickable(true);
                    } else if (response.body().getStatus() == 1) {
                        SharedPreferences sp = getSharedPreferences("yj", MODE_PRIVATE);
                        SharedPreferences.Editor editor = sp.edit();
                        editor.putString("id", response.body().getData().getId() + "");
                        editor.commit();

                        startActivity(new Intent(context, MainActivity.class));
                    }
                } catch (Exception e) {
                    Toast.makeText(context, "登录失败", Toast.LENGTH_LONG).show();
                    sign_in_button.setClickable(true);
                }
            }

            @Override
            public void onFailure(Throwable t) {
            }
        });
    }

}
