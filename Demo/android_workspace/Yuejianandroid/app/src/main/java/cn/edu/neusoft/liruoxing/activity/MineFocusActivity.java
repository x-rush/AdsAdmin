package cn.edu.neusoft.liruoxing.activity;

import android.graphics.Color;
import android.os.Bundle;
import android.app.Activity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.TextView;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.adapter.ClubAdapter;
import cn.edu.neusoft.liruoxing.adapter.MasterAdapter;
import cn.edu.neusoft.liruoxing.bean.ClubBean;
import cn.edu.neusoft.liruoxing.bean.MasterBean;
import cn.edu.neusoft.liruoxing.model.MasterModel;
import cn.edu.neusoft.liruoxing.service.ClubService;
import cn.edu.neusoft.liruoxing.service.MasterService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MineFocusActivity extends Activity {
    @BindView(R.id.tab_club)
    TextView tab_club;
    @BindView(R.id.tab_master)
    TextView tab_master;
    @BindView(R.id.list_club)
    RecyclerView list_club;
    @BindView(R.id.list_master)
    RecyclerView list_master;

    @OnClick({R.id.tab_club, R.id.tab_master})
    public void tabSwitch(TextView view) {
        if (view.getId() == R.id.tab_club) {
            resetState();
            tab_club.setBackgroundColor(Color.parseColor("#e5aebf"));
            getClubList();
            list_club.setVisibility(View.VISIBLE);
        } else if (view.getId() == R.id.tab_master) {
            resetState();
            tab_master.setBackgroundColor(Color.parseColor("#e5aebf"));
            getMasterList();
            list_master.setVisibility(View.VISIBLE);
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mine_focus);
        ButterKnife.bind(this);
        initView();
    }

    private void initView() {
        list_club.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        list_master.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        getMasterList();
    }

    private void resetState() {
        tab_club.setBackgroundColor(Color.parseColor("#FFFFFF"));
        tab_master.setBackgroundColor(Color.parseColor("#FFFFFF"));

        list_club.setVisibility(View.GONE);
        list_master.setVisibility(View.GONE);
    }

    private void getMasterList() {
        MasterService service = new MasterModel().model().create(MasterService.class);
        String user_id = getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0");
        Call<MasterBean> call = service.careMasterList(user_id);

        call.enqueue(new Callback<MasterBean>() {
            @Override
            public void onResponse(Response<MasterBean> response) {
                list_master.setAdapter(new MasterAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

    private void getClubList() {
        ClubService service = new MasterModel().model().create(ClubService.class);
        String user_id = getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0");
        Call<ClubBean> call = service.careClubList(user_id);

        call.enqueue(new Callback<ClubBean>() {
            @Override
            public void onResponse(Response<ClubBean> response) {
                list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });

    }

}
