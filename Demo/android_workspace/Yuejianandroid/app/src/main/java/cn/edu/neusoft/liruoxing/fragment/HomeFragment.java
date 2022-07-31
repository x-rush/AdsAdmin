package cn.edu.neusoft.liruoxing.fragment;

import android.annotation.TargetApi;
import android.app.Fragment;
import android.content.Context;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.donkingliang.banner.CustomBanner;

import java.util.ArrayList;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.adapter.ActivityAdapter;
import cn.edu.neusoft.liruoxing.adapter.MasterAdapter;
import cn.edu.neusoft.liruoxing.adapter.MatchAdapter;
import cn.edu.neusoft.liruoxing.myapplication.MyApplication;
import cn.edu.neusoft.liruoxing.bean.ActivityBean;
import cn.edu.neusoft.liruoxing.bean.MasterBean;
import cn.edu.neusoft.liruoxing.bean.MatchBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.model.ActivityModel;
import cn.edu.neusoft.liruoxing.model.MasterModel;
import cn.edu.neusoft.liruoxing.model.MatchModel;

@TargetApi(Build.VERSION_CODES.HONEYCOMB)
public class HomeFragment extends Fragment implements RetrofitListener {
    @BindView(R.id.banner)
    CustomBanner mBanner;
    @BindView(R.id.tab_activity)
    TextView tab_activity;
    @BindView(R.id.tab_master)
    TextView tab_master;
    @BindView(R.id.tab_match)
    TextView tab_match;
    @BindView(R.id.list_activity)
    RecyclerView list_activity;
    @BindView(R.id.list_master)
    RecyclerView list_master;
    @BindView(R.id.list_match)
    RecyclerView list_match;


    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_association, container, false);
        ButterKnife.bind(this, root);

        setBannerData();
        setView();
        initData();

        return root;
    }

    private void initData() {
        getActivityList();
//        getMasterList();
//        getMatchList();
    }

    private void setBannerData() {
        ArrayList<String> images = new ArrayList<>();
        images.add(MyApplication.getImagePath() + "static/1.jpg");
        images.add(MyApplication.getImagePath() + "static/2.jpg");
        images.add(MyApplication.getImagePath() + "static/3.jpg");
        images.add(MyApplication.getImagePath() + "static/4.jpg");
        images.add(MyApplication.getImagePath() + "static/5.jpg");
        images.add(MyApplication.getImagePath() + "static/6.jpg");
        images.add(MyApplication.getImagePath() + "static/7.jpg");

        mBanner.setPages(new CustomBanner.ViewCreator<String>() {
            @Override
            public View createView(Context context, int position) {
                ImageView imageView = new ImageView(context);
                imageView.setScaleType(ImageView.ScaleType.FIT_XY);
                return imageView;
            }

            @Override
            public void updateUI(Context context, View view, int position, String entity) {
                Glide.with(context).load(entity).into((ImageView) view);
            }
        }, images);
    }

    private void setView() {
        list_activity.setLayoutManager(new StaggeredGridLayoutManager(1, StaggeredGridLayoutManager.VERTICAL));
        list_master.setLayoutManager(new StaggeredGridLayoutManager(1, StaggeredGridLayoutManager.VERTICAL));
        list_match.setLayoutManager(new StaggeredGridLayoutManager(1, StaggeredGridLayoutManager.VERTICAL));
        mBanner.startTurning(3600);
        mBanner.setScrollDuration(500);
    }

    @OnClick({R.id.tab_activity, R.id.tab_master, R.id.tab_match})
    public void tabSwitch(TextView view) {
        if (view.getId() == R.id.tab_activity) {
            resetState();
            tab_activity.setBackgroundColor(Color.parseColor("#e5aebf"));
            getActivityList();
            list_activity.setVisibility(View.VISIBLE);
        } else if (view.getId() == R.id.tab_master) {
            resetState();
            tab_master.setBackgroundColor(Color.parseColor("#e5aebf"));
            getMasterList();
            list_master.setVisibility(View.VISIBLE);
        } else if (view.getId() == R.id.tab_match) {
            resetState();
            tab_match.setBackgroundColor(Color.parseColor("#e5aebf"));
            getMatchList();
            list_match.setVisibility(View.VISIBLE);
        }
    }

    private void resetState() {
        tab_activity.setBackgroundColor(Color.parseColor("#FFFFFF"));
        tab_master.setBackgroundColor(Color.parseColor("#FFFFFF"));
        tab_match.setBackgroundColor(Color.parseColor("#FFFFFF"));

        list_activity.setVisibility(View.GONE);
        list_master.setVisibility(View.GONE);
        list_match.setVisibility(View.GONE);
    }

    @Override
    public void onSuccess(Object o, int flag) {
        if (1 == flag) {
            ActivityBean list1 = (ActivityBean) o;
            ActivityAdapter adapter1 = new ActivityAdapter(list1);
            list_activity.setAdapter(adapter1);
        } else if (2 == flag) {
            MasterBean list2 = (MasterBean) o;
            MasterAdapter adapter2 = new MasterAdapter(list2);
            list_master.setAdapter(adapter2);
        } else {
            MatchBean list3 = (MatchBean) o;
            MatchAdapter adapter3 = new MatchAdapter(list3);
            list_match.setAdapter(adapter3);
        }


    }

    @Override
    public void onFail(String msg) {

    }

    private void getActivityList() {

        ActivityModel model = new ActivityModel();
        model.getActivityList(this);
    }

    private void getMasterList() {
        MasterModel model = new MasterModel();
        model.getMasterList(this);
    }

    private void getMatchList() {
        MatchModel model = new MatchModel();
        model.getMatchList(this);
    }
}
