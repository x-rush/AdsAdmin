package cn.edu.neusoft.liruoxing.fragment;

import android.annotation.TargetApi;
import android.app.Fragment;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.bumptech.glide.Glide;
import com.donkingliang.banner.CustomBanner;

import java.util.ArrayList;

import butterknife.BindView;
import butterknife.ButterKnife;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.adapter.TrainAdapter;
import cn.edu.neusoft.liruoxing.myapplication.MyApplication;
import cn.edu.neusoft.liruoxing.bean.TrainBean;
import cn.edu.neusoft.liruoxing.model.TrainModel;
import cn.edu.neusoft.liruoxing.service.TrainService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

@TargetApi(Build.VERSION_CODES.HONEYCOMB)
public class TrainFragment extends Fragment {
    @BindView(R.id.banner_train)
    CustomBanner mBanner;
    @BindView(R.id.list_start)
    RecyclerView list_start;
    @BindView(R.id.list_rookie)
    RecyclerView list_rookie;
    @BindView(R.id.list_advance)
    RecyclerView list_advance;

    static final String START = "1";
    static final String ROOKIE = "2";
    static final String ADVANCE = "3";

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_train, container, false);
        ButterKnife.bind(this, root);
        setBannerData();
        initData();
        initView();
        return root;
    }

    private void initView() {
        list_start.setLayoutManager(new LinearLayoutManager(this.getContext(), LinearLayoutManager.VERTICAL, false));
        list_rookie.setLayoutManager(new LinearLayoutManager(this.getContext(), LinearLayoutManager.VERTICAL, false));
        list_advance.setLayoutManager(new LinearLayoutManager(this.getContext(), LinearLayoutManager.VERTICAL, false));
        mBanner.startTurning(3600);
        mBanner.setScrollDuration(500);
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

    private void initData() {
        getTrainList(START);
        getTrainList(ROOKIE);
        getTrainList(ADVANCE);
    }


    private void getTrainList(final String type) {
        TrainService service = new TrainModel().model().create(TrainService.class);
        Call<TrainBean> call = service.getTrainListByType(type);

        call.enqueue(new Callback<TrainBean>() {
            @Override
            public void onResponse(Response<TrainBean> response) {
                if (type.equals(START))
                    list_start.setAdapter(new TrainAdapter(response.body()));
                if (type.equals(ROOKIE))
                    list_rookie.setAdapter(new TrainAdapter(response.body()));
                if (type.equals(ADVANCE))
                    list_advance.setAdapter(new TrainAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

}