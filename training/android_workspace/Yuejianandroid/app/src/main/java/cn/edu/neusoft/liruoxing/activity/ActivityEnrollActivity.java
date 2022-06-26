package cn.edu.neusoft.liruoxing.activity;

import android.content.Context;
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
import cn.edu.neusoft.liruoxing.bean.StatusBean;
import cn.edu.neusoft.liruoxing.model.ActivityModel;
import cn.edu.neusoft.liruoxing.service.ActivityService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ActivityEnrollActivity extends AppCompatActivity {
    @BindView(R.id.image)
    ImageView image;
    @BindView(R.id.tv_title)
    TextView tv_title;
    @BindView(R.id.tv_intro)
    TextView tv_intro;
    @BindView(R.id.tv_cost)
    TextView tv_cost;
    @BindView(R.id.tv_address)
    TextView tv_address;
    @BindView(R.id.tv_time)
    TextView tv_time;
    @BindView(R.id.tv_num)
    TextView tv_num;

    Context context = this;
    int num = 0;

    @OnClick({R.id.btn_add, R.id.btn_reduce, R.id.enroll})
    public void click(Button view) {
        if (view.getId() == R.id.btn_add) {
            tv_num.setText(String.valueOf(++num));
        } else if (view.getId() == R.id.btn_reduce) {
            if ((--num) >= 0)
                tv_num.setText(String.valueOf(num));
        } else if (view.getId() == R.id.enroll) {
            enroll11();
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_enroll);
        ButterKnife.bind(this);
        initData();
    }

    private void initData() {
        Glide.with(MyApplication.getAppContext())
                .load(MyApplication.getImagePath() + getIntent().getStringExtra("activity_pic"))
                .into(image);
        tv_title.setText(getIntent().getStringExtra("title"));
        tv_intro.setText(getIntent().getStringExtra("intro"));
        tv_cost.setText(getIntent().getStringExtra("cost"));
        tv_address.setText(getIntent().getStringExtra("address"));
        tv_time.setText(getIntent().getStringExtra("time"));
    }

    private void enroll11() {
        ActivityService service = new ActivityModel().model().create(ActivityService.class);
        Call<StatusBean> call = service.enroll(getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0"),
                getIntent().getStringExtra("activity_id"), tv_num.getText().toString());

        call.enqueue(new Callback<StatusBean>() {
            @Override
            public void onResponse(Response<StatusBean> response) {
                Toast.makeText(context, "报名成功", Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }
}
