package com.application522lrx.fragment;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;


import com.application522lrx.adapter.ArticleAdapter;
import com.application522lrx.bean.ArticleBean;
import com.application522lrx.iface.ArticleListerner;
import com.application522lrx.model.ArticleModel;
import com.application522lrx.R;

import java.util.List;

//import com.lee.recyclerview524lx.adapter.MyAdapter;


/**
 * Created by Administrator on 2017/5/23.
 */



public class VideoFragment extends android.support.v4.app.Fragment {
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private ArticleAdapter myAdapter;
    private List<ArticleBean> list=null;
    private View view=null;
    private Context context;
    private static int cur_page=1;
    private static int lastVisibleItemPosition;
    @android.support.annotation.Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @android.support.annotation.Nullable ViewGroup container, @android.support.annotation.Nullable Bundle savedInstanceState) {

        view=inflater.inflate(R.layout.fragment3,container,false);
        context=view.getContext();

        initRecyclerView();
        ArticleModel articleModel =new ArticleModel();
        articleModel.getResultList("video",2,"8soafn3tpaj0efuab5jvmpbhr4",articleListener);

        return view;
    }
    ArticleListerner articleListener =new ArticleListerner() {
        @Override
        public void onResponse(List<ArticleBean> listbean) {

            list=listbean;
            myAdapter.setList(list);

            if(cur_page==1){
                list=listbean;
                myAdapter.setList(list);

            }else{
                list.removeAll(listbean);

                list.addAll(0,listbean);
                myAdapter.setList(list);
            }

        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(context,"fail:"+msg,Toast.LENGTH_SHORT).show();
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
        //创建适配器
//        list=getData();
        myAdapter =new ArticleAdapter(context,list);

        myAdapter.setList(list);

        recyclerView.setAdapter(myAdapter);
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {

                super.onScrollStateChanged(recyclerView, newState);
                if (newState == RecyclerView.SCROLL_STATE_IDLE && lastVisibleItemPosition + 1 == list.size()) {
                    cur_page+=1;

                    new ArticleModel().getResultList("video",cur_page,"8soafn3tpaj0efuab5jvmpbhr4",articleListener);
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
