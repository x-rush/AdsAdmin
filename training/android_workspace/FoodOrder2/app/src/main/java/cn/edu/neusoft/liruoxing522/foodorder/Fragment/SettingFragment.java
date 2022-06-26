package cn.edu.neusoft.liruoxing522.foodorder.Fragment;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import cn.edu.neusoft.liruoxing522.foodorder.activity.CommentListActivity;
import cn.edu.neusoft.liruoxing522.foodorder.activity.OrderListActivity;
import cn.edu.neusoft.liruoxing522.foodorder.activity.SettingActivity;
import cn.edu.neusoft.liruoxing522.foodorder.bean.UserBean;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.model.UserModel;
import cn.edu.neusoft.liruoxing522.foodorder.R;

import static cn.edu.neusoft.liruoxing522.foodorder.Server.user_id_remember;

//import cn.edu.neusoft.lixu524.foodorder.Bean.UserBean;
//import cn.edu.neusoft.lixu524.foodorder.Modul.UserModel;

/**
 * Created by www44 on 2017/11/20.
 */

public class SettingFragment extends BaseFragment {
    TextView tv_username,tv_phonenum;
    ImageButton btn_settingmy;
    Context context;
    Button btn_order,btn_comment;
    TListener<UserBean> listener = new TListener<UserBean>() {
        @Override
        public void onResponse(UserBean userBean) {
            tv_username.setText(userBean.getUsername().toString());
            tv_phonenum.setText(userBean.getMobilenum().toString());
//            Toast.makeText(context,userBean.getUser_id(),Toast.LENGTH_SHORT).show();
        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(context,"Fail",Toast.LENGTH_SHORT).show();
        }
    };
    @Override
    void initLayout() {
        setLayout_file(R.layout.fragment_setting);
    }

    @Override
    void initView() {
        context=view.getContext();
        tv_phonenum=view.findViewById(R.id.tv_phonenum);
        tv_username=view.findViewById(R.id.tv_username);
        btn_settingmy=view.findViewById(R.id.btn_settingmy);
        btn_order=view.findViewById(R.id.btn_order);
        btn_comment=view.findViewById(R.id.button_comment);
    }

    @Override
    void initEvent() {
        UserModel userModel = new UserModel();
        userModel.getUserMeg(user_id_remember,listener);

        btn_order.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context, OrderListActivity.class);
                startActivity(intent);
            }
        });
        btn_comment.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent1 = new Intent(context, CommentListActivity.class);
                startActivity(intent1);
            }
        });
        btn_settingmy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent2 = new Intent(context, SettingActivity.class);
                startActivity(intent2);
            }
        });
    }

    @Override
    void initData() {

    }

    public SettingFragment(){

    }

    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        void onFragmentInteraction(Uri uri);
    }
}
