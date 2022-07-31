package cn.edu.neusoft.liruoxing.activity;

import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.TextView;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.adapter.ActivityOrderAdapter;
import cn.edu.neusoft.liruoxing.adapter.MatchOrderAdapter;
import cn.edu.neusoft.liruoxing.adapter.TrainOrderAdapter;
import cn.edu.neusoft.liruoxing.bean.ActivityOrderBean;
import cn.edu.neusoft.liruoxing.bean.MatchOrderBean;
import cn.edu.neusoft.liruoxing.bean.TrainOrderBean;
import cn.edu.neusoft.liruoxing.model.ActivityModel;
import cn.edu.neusoft.liruoxing.model.MatchModel;
import cn.edu.neusoft.liruoxing.model.TrainModel;
import cn.edu.neusoft.liruoxing.service.ActivityService;
import cn.edu.neusoft.liruoxing.service.MatchService;
import cn.edu.neusoft.liruoxing.service.TrainService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MineOrderActivity extends AppCompatActivity {
    @BindView(R.id.tab_activity)
    TextView tab_activity;
    @BindView(R.id.tab_match)
    TextView tab_match;
    @BindView(R.id.tab_train)
    TextView tab_train;
    @BindView(R.id.list_activity)
    RecyclerView list_activity;
    @BindView(R.id.list_match)
    RecyclerView list_match;
    @BindView(R.id.list_train)
    RecyclerView list_train;

    @OnClick({R.id.tab_activity, R.id.tab_match, R.id.tab_train})
    public void tabSwitch(TextView view) {
        if (view.getId() == R.id.tab_activity) {
            resetState();
            tab_activity.setBackgroundColor(Color.parseColor("#e5aebf"));
            getActivityList();
            list_activity.setVisibility(View.VISIBLE);
        } else if (view.getId() == R.id.tab_match) {
            resetState();
            tab_match.setBackgroundColor(Color.parseColor("#e5aebf"));
            getMatchList();
            list_match.setVisibility(View.VISIBLE);
        } else if (view.getId() == R.id.tab_train) {
            resetState();
            tab_train.setBackgroundColor(Color.parseColor("#e5aebf"));
            getTrainList();
            list_train.setVisibility(View.VISIBLE);
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mine_order);
        ButterKnife.bind(this);
        initView();
        initData();
    }

    private void initView() {
        list_activity.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        list_match.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        list_train.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
    }

    private void initData() {
        getActivityList();
    }

    private void resetState() {
        tab_activity.setBackgroundColor(Color.parseColor("#FFFFFF"));
        tab_match.setBackgroundColor(Color.parseColor("#FFFFFF"));
        tab_train.setBackgroundColor(Color.parseColor("#FFFFFF"));

        list_activity.setVisibility(View.GONE);
        list_match.setVisibility(View.GONE);
        list_train.setVisibility(View.GONE);
    }

    private void getTrainList() {
        TrainService service = new TrainModel().model().create(TrainService.class);
        Call<TrainOrderBean> call = service.trainOrder(getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0"));
        //getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0")
        call.enqueue(new Callback<TrainOrderBean>() {
            @Override
            public void onResponse(Response<TrainOrderBean> response) {
                list_train.setAdapter(new TrainOrderAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

    private void getMatchList() {
        MatchService service = new MatchModel().model().create(MatchService.class);
        Call<MatchOrderBean> call = service.matchOrder(getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0"));
        //getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0")
        call.enqueue(new Callback<MatchOrderBean>() {
            @Override
            public void onResponse(Response<MatchOrderBean> response) {
                list_match.setAdapter(new MatchOrderAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

    private void getActivityList() {
        ActivityService service = new ActivityModel().model().create(ActivityService.class);
        Call<ActivityOrderBean> call = service.activityOrder(getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0"));
        //getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0")
        call.enqueue(new Callback<ActivityOrderBean>() {
            @Override
            public void onResponse(Response<ActivityOrderBean> response) {
                list_activity.setAdapter(new ActivityOrderAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

}
