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
import cn.edu.neusoft.liruoxing.bean.MatchDetailBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.model.MatchModel;

public class MatchDetailActivity extends AppCompatActivity implements RetrofitListener<MatchDetailBean> {

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
        setContentView(R.layout.activity_match);
        getSupportActionBar().hide();
        ButterKnife.bind(this);
        intent = new Intent(this, MatchEnrollActivity.class);
        init();
    }

    private void init() {
        Intent intent = getIntent();
        String id = intent.getIntExtra("id", 0) + "";
        MatchModel model = new MatchModel();
        model.getMatchDetail(id, this);
    }

    @Override
    public void onSuccess(MatchDetailBean matchDetailBean, int flag) {
        title.setText("比赛名称: " + matchDetailBean.getData().getMatch_name());
        Glide.with(MyApplication.getAppContext())
                .load(MyApplication.getImagePath() + matchDetailBean.getData().getMatch_pic())
                .into(detail_image);
        content.setText("地址: " + matchDetailBean.getData().getAddress() + "\n"
                + "费用: " + matchDetailBean.getData().getMatch_price() + "\n"
                + "比赛时间: " + matchDetailBean.getData().getMatch_time());

        intent.putExtra("match_id", matchDetailBean.getData().getId() + "");
        intent.putExtra("title", matchDetailBean.getData().getMatch_name() + "");
        intent.putExtra("match_pic", matchDetailBean.getData().getMatch_pic() + "");
        intent.putExtra("intro", matchDetailBean.getData().getMatch_name() + "");
        intent.putExtra("cost", matchDetailBean.getData().getMatch_price() + "");
        intent.putExtra("address", matchDetailBean.getData().getAddress() + "");
        intent.putExtra("time", matchDetailBean.getData().getMatch_time() + "");

    }

    @Override
    public void onFail(String msg) {

    }
}
