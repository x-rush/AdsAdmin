package cn.edu.neusoft.liruoxing.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.myapplication.MyApplication;
import cn.edu.neusoft.liruoxing.bean.ActivityDetailBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.model.ActivityModel;

public class  ActivityDetailActivity extends AppCompatActivity implements RetrofitListener<ActivityDetailBean> {
    @BindView(R.id.title)
    TextView title;
    @BindView(R.id.detail_image)
    ImageView detail_image;
    @BindView(R.id.content)
    TextView content;

    Intent intent;

    @OnClick(R.id.btn_enroll)
    public void enroll() {
        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_activity);
        getSupportActionBar().hide();
        ButterKnife.bind(this);
        intent = new Intent(this, ActivityEnrollActivity.class);
        init();
    }

    private void init() {
        Intent intent = getIntent();
        String id = intent.getIntExtra("id", 0) + "";
        ActivityModel model = new ActivityModel();
        model.getActivityDetail(id, this);
    }

    @Override
    public void onSuccess(ActivityDetailBean activityDetailBean, int flag) {
        title.setText(activityDetailBean.getData().getActivity_name());
        Glide.with(MyApplication.getAppContext())
                .load(MyApplication.getImagePath() + activityDetailBean.getData().getActivity_pic())
                .into(detail_image);
        content.setText("简介: " + activityDetailBean.getData().getIntro() + "\n"
                + "费用: " + activityDetailBean.getData().getSign_number() + "\n"
                + "地址: " + activityDetailBean.getData().getAddress() + "\n"
                + "日期: " + activityDetailBean.getData().getActivity_time());

        intent.putExtra("activity_id", activityDetailBean.getData().getId() + "");
        intent.putExtra("title", activityDetailBean.getData().getActivity_name() + "");
        intent.putExtra("activity_pic", activityDetailBean.getData().getActivity_pic() + "");
        intent.putExtra("intro", activityDetailBean.getData().getIntro() + "");
        intent.putExtra("cost", activityDetailBean.getData().getSign_number() + "");
        intent.putExtra("address", activityDetailBean.getData().getAddress() + "");
        intent.putExtra("time", activityDetailBean.getData().getActivity_time() + "");
    }

    @Override
    public void onFail(String msg) {

    }

}
