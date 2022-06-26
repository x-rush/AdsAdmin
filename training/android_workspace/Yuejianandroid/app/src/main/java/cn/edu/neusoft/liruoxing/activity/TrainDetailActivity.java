package cn.edu.neusoft.liruoxing.activity;

import android.content.Intent;
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
import cn.edu.neusoft.liruoxing.bean.TrainDetailBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;

import cn.edu.neusoft.liruoxing.model.TrainModel;


public class TrainDetailActivity extends AppCompatActivity implements RetrofitListener<TrainDetailBean> {
    @BindView(R.id.title)
    TextView title;
    @BindView(R.id.detail_image)
    ImageView detail_image;
    @BindView(R.id.content)
    TextView content;

    Intent intent;

    @OnClick(R.id.enroll)
    public void enroll() {
        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_train);
        getSupportActionBar().hide();
        ButterKnife.bind(this);
        intent = new Intent(this, TrainEnrollActivity.class);
        init();
    }

    private void init() {
        Intent intent = getIntent();
        String id = intent.getIntExtra("id", 0) + "";
        TrainModel model = new TrainModel();
        model.getTrainDetail(id, this);


    }

    @Override
    public void onSuccess(TrainDetailBean trainDetailBean, int flag) {

        title.setText(trainDetailBean.getData().getName());
        Glide.with(MyApplication.getAppContext())
                .load(MyApplication.getImagePath() + trainDetailBean.getData().getTran_pic())
                .into(detail_image);
        content.setText("地址: " + trainDetailBean.getData().getAddress() + "\n"
                + "开放时间: " + trainDetailBean.getData().getTime() + "\n"
                + "介绍: " + trainDetailBean.getData().getIntro() + "\n"
                + "价格: " + trainDetailBean.getData().getPrice());

        intent.putExtra("train_id", trainDetailBean.getData().getId() + "");
        intent.putExtra("title", trainDetailBean.getData().getName() + "");
        intent.putExtra("train_pic", trainDetailBean.getData().getTran_pic() + "");
        intent.putExtra("intro", trainDetailBean.getData().getIntro() + "");
        intent.putExtra("cost", trainDetailBean.getData().getPrice() + "");
        intent.putExtra("address", trainDetailBean.getData().getAddress() + "");
        intent.putExtra("time", trainDetailBean.getData().getTime() + "");

    }

    @Override
    public void onFail(String msg) {

    }

}

