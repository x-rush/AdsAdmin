package cn.edu.neusoft.liruoxing.fragment;

import android.annotation.TargetApi;
import android.app.Fragment;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import butterknife.BindView;
import butterknife.ButterKnife;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.adapter.ClubAdapter;
import cn.edu.neusoft.liruoxing.bean.ClubBean;
import cn.edu.neusoft.liruoxing.model.ClubModel;


@TargetApi(Build.VERSION_CODES.HONEYCOMB)
public class ClubFragment extends Fragment implements RetrofitListener<ClubBean> {
    @BindView(R.id.list_club)
    RecyclerView list_club;

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_club, container, false);
        ButterKnife.bind(this, root);
        list_club.setLayoutManager(new LinearLayoutManager(this.getContext(), LinearLayoutManager.VERTICAL, false));
        initData();
        return root;
    }

    private void initData() {
        ClubModel model = new ClubModel();
        model.getClubList(this);
    }

    @Override
    public void onFail(String msg) {

    }

    @Override
    public void onSuccess(ClubBean clubBeans, int flag) {
        list_club.setAdapter(new ClubAdapter(clubBeans));
    }

}