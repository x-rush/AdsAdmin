package cn.edu.neusoft.liruoxing.fragment;

import android.app.Fragment;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.bumptech.glide.Glide;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.activity.MineFocusActivity;
import cn.edu.neusoft.liruoxing.activity.MineOrderActivity;
import cn.edu.neusoft.liruoxing.activity.MineSettingActivity;
import cn.edu.neusoft.liruoxing.activity.UpdateMessageActivity;
import cn.edu.neusoft.liruoxing.myapplication.MyApplication;
import cn.edu.neusoft.liruoxing.bean.UserBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.model.UserMsgModel;

import static android.content.Context.MODE_PRIVATE;

public class MineFragment extends Fragment implements RetrofitListener<UserBean> {
    @BindView(R.id.avatar)
    ImageView avatar;
    @BindView(R.id.user_name)
    TextView user_name;

    Intent intent;

    @OnClick({R.id.btn_mine_setting})
    public void click(TextView view) {
        view.getContext().startActivity(new Intent(view.getContext(), MineSettingActivity.class));
    }

    @OnClick({R.id.tab_shaitu, R.id.tab_focus, R.id.tab_order})
    public void nav(RelativeLayout view) {
        if (view.getId() == R.id.tab_shaitu) {

        } else if (view.getId() == R.id.tab_focus) {
            startActivity(new Intent(getContext(), MineFocusActivity.class));
        } else if (view.getId() == R.id.tab_order) {
            startActivity(new Intent(getContext(), MineOrderActivity.class));
        }
    }

    @OnClick(R.id.btn_update_message)
    public void click() {
        startActivity(intent);
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_mine, container, false);
        ButterKnife.bind(this, root);
        initData();
        intent = new Intent(getContext(), UpdateMessageActivity.class);
        return root;
    }

    private void initData() {
        UserMsgModel model = new UserMsgModel();
        SharedPreferences sp = getContext().getSharedPreferences("yj", MODE_PRIVATE);
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