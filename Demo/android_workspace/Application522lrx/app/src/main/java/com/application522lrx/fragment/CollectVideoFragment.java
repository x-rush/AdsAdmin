package com.application522lrx.fragment;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.application522lrx.bean.ArticleBean;
import com.application522lrx.R;

import java.util.List;

/**
 * Created by Administrator on 2017/5/23.
 */

public class CollectVideoFragment extends Fragment {

    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private  View view=null;
    private Context context;
    private List<ArticleBean> list=null;
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        view=inflater.inflate(R.layout.collect_video_fragment,container,false);
        context=view.getContext();
        initRecycleView();
        return view;
    }

    private void initRecycleView() {
    }
}
