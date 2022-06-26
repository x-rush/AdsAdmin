package cn.edu.neusoft.liruoxing.activity;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.EditText;
import android.widget.Toast;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.bean.StatusBean;
import cn.edu.neusoft.liruoxing.model.UserMsgModel;
import cn.edu.neusoft.liruoxing.service.MineMsgService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class UpdateMessageActivity extends AppCompatActivity {
    @BindView(R.id.et_name)
    EditText et_name;
    @BindView(R.id.et_phone)
    EditText et_phone;
    @BindView(R.id.et_address)
    EditText et_address;
    @BindView(R.id.et_password)
    EditText et_password;

    Context context = this;

    @OnClick(R.id.commit)
    public void update() {
        SharedPreferences sp = getSharedPreferences("yj", MODE_PRIVATE);
        String userId = sp.getString("id", "0");

        MineMsgService service = new UserMsgModel().model().create(MineMsgService.class);
        Call<StatusBean> call = service.updateMessage(userId, et_name.getText().toString(), et_phone.getText().toString(), et_address.getText().toString(), et_password.getText().toString());

        call.enqueue(new Callback<StatusBean>() {
            @Override
            public void onResponse(Response<StatusBean> response) {
                Toast.makeText(context, "修改成功", Toast.LENGTH_LONG).show();
                finish();
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update_measage);
        ButterKnife.bind(this);

        initView();
    }

    private void initView() {
        et_name.setText(getIntent().getStringExtra("username"));
        et_phone.setText(getIntent().getStringExtra("phone"));
        et_address.setText(getIntent().getStringExtra("address"));
        et_password.setText(getIntent().getStringExtra("password"));

    }

}
