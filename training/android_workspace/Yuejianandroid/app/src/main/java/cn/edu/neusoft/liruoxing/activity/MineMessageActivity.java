package cn.edu.neusoft.liruoxing.activity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.myapplication.MyApplication;
import cn.edu.neusoft.liruoxing.bean.UserBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.model.UserMsgModel;

public class MineMessageActivity extends AppCompatActivity implements RetrofitListener<UserBean> {
    @BindView(R.id.avatar)
    ImageView avatar;
    @BindView(R.id.user_name)
    TextView user_name;

    Intent intent;

    @OnClick({R.id.btn_shaitu, R.id.btn_focus, R.id.btn_order})
    public void nav(ImageView view) {
        if (view.getId() == R.id.btn_shaitu) {

        } else if (view.getId() == R.id.btn_focus) {
            startActivity(new Intent(this, MineFocusActivity.class));
        } else if (view.getId() == R.id.btn_order) {
            startActivity(new Intent(this, MineOrderActivity.class));
        }
    }

    @OnClick(R.id.btn_update_message)
    public void click() {

        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mine_message);
        ButterKnife.bind(this);
        initData();
        intent = new Intent(this, UpdateMessageActivity.class);
    }

    private void initData() {
        UserMsgModel model = new UserMsgModel();
        SharedPreferences sp = getSharedPreferences("yj", MODE_PRIVATE);
        String userId = sp.getString("id", "0");
        model.getUserMessage(this, userId);
    }

    @Override
    public void onSuccess(UserBean userBean, int flag) {
        user_name.setText(userBean.getData().getUsername());
        Glide.with(MyApplication.getAppContext())
                .load(MyApplication.getImagePath() + userBean.getData().getAvatar())
                .into(avatar);

        intent.putExtra("username", userBean.getData().getUsername());
        intent.putExtra("phone", userBean.getData().getPhone());
        intent.putExtra("address", userBean.getData().getAddress());
        intent.putExtra("password", userBean.getData().getPassword());

    }

    @Override
    public void onFail(String msg) {

    }
}
