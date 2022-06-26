package cn.edu.neusoft.liruoxing.activity;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.bumptech.glide.Glide;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.myapplication.MyApplication;
import cn.edu.neusoft.liruoxing.bean.ClubBean;
import cn.edu.neusoft.liruoxing.bean.ClubDetailBean;
import cn.edu.neusoft.liruoxing.bean.StatusBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.model.ClubModel;
import cn.edu.neusoft.liruoxing.service.ClubService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ClubDetailActivity extends AppCompatActivity implements RetrofitListener<ClubDetailBean> {
    @BindView(R.id.title)
    TextView title;
    @BindView(R.id.btn_care)
    Button btn_care;
    @BindView(R.id.detail_image)
    ImageView detail_image;
    @BindView(R.id.content)
    TextView content;

    Context context = this;

    @OnClick({R.id.btn_care})
    public void care() {
        String user_id = getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0");
        String club_id = String.valueOf(getIntent().getIntExtra("id", 0));

        if (btn_care.getText().toString().equals("取消关注")) {
            cancelCareClub(user_id, club_id);
        } else if (btn_care.getText().toString().equals("点击关注")) {
            careClub(user_id, club_id);
        }

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_club);
        getSupportActionBar().hide();
        ButterKnife.bind(this);

        init();
    }

    private void init() {
        Intent intent = getIntent();
        String id = intent.getIntExtra("id", 0) + "";
        ClubModel model = new ClubModel();
        model.getClubDetail(id, this);

        String user_id = getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0");
        String club_id = String.valueOf(getIntent().getIntExtra("id", 0));
        isFocus(user_id, club_id);
    }

    @Override
    public void onSuccess(ClubDetailBean clubDetailBean, int flag) {
        title.setText(clubDetailBean.getData().getClub_name());
        Glide.with(MyApplication.getAppContext())
                .load(MyApplication.getImagePath() + clubDetailBean.getData().getClub_pic())
                .into(detail_image);
        content.setText("地址: " + clubDetailBean.getData().getAddress() + "\n"
                + "开放时间: " + clubDetailBean.getData().getOpen_time() + "\n"
                + "介绍: " + clubDetailBean.getData().getClub_intro() + "\n"
                + "联系电话: " + clubDetailBean.getData().getPhone());


    }

    @Override
    public void onFail(String msg) {

    }

    private void careClub(String userId, String clubId) {
        ClubService service = new ClubModel().model().create(ClubService.class);
        Call<StatusBean> call = service.careClub(userId, clubId);

        call.enqueue(new Callback<StatusBean>() {
            @Override
            public void onResponse(Response<StatusBean> response) {
                btn_care.setText("取消关注");
                Toast.makeText(context, "关注成功", Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

    private void cancelCareClub(String userId, String clubId) {
        ClubService service = new ClubModel().model().create(ClubService.class);
        Call<StatusBean> call = service.cancelCareClub(userId, clubId);

        call.enqueue(new Callback<StatusBean>() {
            @Override
            public void onResponse(Response<StatusBean> response) {
                btn_care.setText("点击关注");
                Toast.makeText(context, "取消成功", Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

    private void isFocus(String userId, final String clubId) {
        ClubService service = new ClubModel().model().create(ClubService.class);
        Call<ClubBean> call = service.careClubList(userId);

        call.enqueue(new Callback<ClubBean>() {
            @Override
            public void onResponse(Response<ClubBean> response) {
                for (int i = 0; i < response.body().getData().size(); i++) {
                    if (clubId.equals(response.body().getData().get(i).getId() + "")) {
                        btn_care.setText("取消关注");
                    }
                }
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

}
