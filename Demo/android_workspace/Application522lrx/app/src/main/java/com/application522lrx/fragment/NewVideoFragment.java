package com.application522lrx.fragment;


import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.application522lrx.activity.ViewVideoActivity;
import com.application522lrx.adapter.VideoAdapter;
import com.application522lrx.bean.VideoBean;
import com.application522lrx.iface.NewVideoListener;
import com.application522lrx.model.NewVideosModel;
import com.application522lrx.R;

import java.util.List;

/**
 * Created by zci on 2017/5/23.
 */

public class NewVideoFragment extends Fragment {
   private RecyclerView recyclerView;
    private LinearLayoutManager layoutManager;
    private VideoAdapter videoAdapter;
    private List<VideoBean> list=null;

    private View view=null;
    private static int cur_page=1;
    private int lastVisibleItemPosition;
    private static String mod;
    private String SessionID;
    private SharedPreferences sp;
    private Context context;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        view=inflater.inflate(R.layout.fragment3,container,false);
        context=view.getContext();
        initRecyclerView();
        NewVideosModel newVideosModel =new NewVideosModel();
        newVideosModel.getResultList("video",cur_page,"8soafn3tpaj0efuab5jvmpbhr4",newVideoListener);

        return view;
    }
    NewVideoListener newVideoListener =new NewVideoListener() {
     @Override
     public void onResponse(List<VideoBean> listbean) {
         if(cur_page==1){
             list=listbean;
             videoAdapter.setList(list);

         }else{
             list.removeAll(listbean);

             list.addAll(0,listbean);
             videoAdapter.setList(list);
         }
     }

     @Override
     public void onFail(String msg) {

     }
 };
    private void initRecyclerView() {
        recyclerView=(RecyclerView)view.findViewById(R.id.rv_article);

        //创建默认的线性LayoutManager
        layoutManager =new LinearLayoutManager(context);
        //设置布局
        recyclerView.setLayoutManager(layoutManager);
        //设置item的高度
        recyclerView.setHasFixedSize(true);
        videoAdapter =new VideoAdapter(context,list);
        VideoAdapter.OnItemClickListener onItemClickListener = new VideoAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position) {
                Intent intent=new Intent(context, ViewVideoActivity.class);
                intent.putExtra("videopath",list.get(position).getVideopath());
                context.startActivity(intent);
            }

            @Override
            public void onItemLongClick(View view, int position) {

            }
        };
        videoAdapter.setOnItemClickListener(onItemClickListener);
        videoAdapter.setList(list);
        recyclerView.setAdapter(videoAdapter);
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                if (newState == RecyclerView.SCROLL_STATE_IDLE && lastVisibleItemPosition + 1 == list.size()) {
                    cur_page += 1;

                    new NewVideosModel().getResultList("video", cur_page, "8soafn3tpaj0efuab5jvmpbhr4", newVideoListener);

                }
            }
            @Override
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);
                lastVisibleItemPosition=list.size()-1;
            }
        });

    }

}
