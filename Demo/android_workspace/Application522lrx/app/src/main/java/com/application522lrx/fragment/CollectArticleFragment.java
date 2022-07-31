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
import android.widget.TextView;
import android.widget.Toast;

import com.application522lrx.activity.ArticleDetailActicity;
import com.application522lrx.adapter.CArticleAdapter;
import com.application522lrx.bean.ArticleBean;
import com.application522lrx.bean.CollectBean;
import com.application522lrx.iface.CollectListener;
import com.application522lrx.model.CollectModel;
import com.application522lrx.R;

import java.util.List;

/**
 * Created by Administrator on 2017/5/23.
 */

public class CollectArticleFragment extends Fragment {
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private  View view=null;
    private Context context;
    private List<CollectBean<ArticleBean>>list=null;
    private CArticleAdapter adapter;
    private TextView tvinfo;

    private SharedPreferences sp;
    private String sessionID="";

    private static int cur_page=1;
    private int lastVisibleItemPosition;

    CollectListener<ArticleBean> listListerner=new CollectListener<ArticleBean>() {
        @Override
        public void onResponse(List<CollectBean<ArticleBean>> beanlist) {
            if(cur_page==1){
                list=beanlist;
            }
            else {
                list.removeAll(beanlist);
            }
            adapter.setList(list);
            adapter.notifyDataSetChanged();
        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(context,msg,Toast.LENGTH_SHORT).show();
        }
    };

    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        view=inflater.inflate(R.layout.collect_article_fragment,container,false);
        context=getActivity();
        sp=context.getSharedPreferences("loginPref",Context.MODE_PRIVATE);

        initRecycleView();
        readSP();
        System.out.println("----onCreateView page="+cur_page);

        CollectModel collectModel=new CollectModel();
        collectModel.getResultList("article",1,"8soafn3tpaj0efuab5jvmpbhr4",listListerner);
        return view;
    }
    private void readSP() {
        sessionID=sp.getString("sessionID","8soafn3tpaj0efuab5jvmpbhr4");
    }

    private void initRecycleView() {
        recyclerView=(RecyclerView)view.findViewById(R.id.collect_recyclerview);

        //创建默认的线性LayoutManager
        layoutManager =new LinearLayoutManager(context);
        //设置布局
        recyclerView.setLayoutManager(layoutManager);
        //设置item的高度
        recyclerView.setHasFixedSize(true);
        //创建适配器
//        list=getData();
        adapter =new CArticleAdapter(context,list);

        CArticleAdapter.OnItemClickListener onItemClickListener = new CArticleAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, ArticleBean position) {
                Intent intent = new Intent(getActivity(), ArticleDetailActicity.class);
                intent.putExtra("resid",position.getId());
                intent.putExtra("userid",position.getUserid());
//                System.out.println(position.getId());
//                System.out.println(position.getUserid());
                startActivity(intent);
            }
        };

        adapter.setOnItemClickListener(onItemClickListener);
        adapter.setList(list);

        recyclerView.setAdapter(adapter);
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {

                super.onScrollStateChanged(recyclerView, newState);
                if (newState == RecyclerView.SCROLL_STATE_IDLE && lastVisibleItemPosition + 1 == list.size()) {
                    cur_page+=1;

                    new CollectModel().getResultList("article",cur_page,"8soafn3tpaj0efuab5jvmpbhr4",listListerner);
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
