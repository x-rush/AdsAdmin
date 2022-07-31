package com.application522lrx.fragment;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.application522lrx.activity.ArticleDetailActicity;
import com.application522lrx.adapter.ArticleAdapter;
import com.application522lrx.bean.ArticleBean;
import com.application522lrx.iface.ArticleListerner;
import com.application522lrx.model.ArticleModel;
import com.application522lrx.R;

import java.util.List;


/**
 * Created by Administrator on 2017/5/23.
 */



public class ArticleFragment extends Fragment {
    SharedPreferences preferences;
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private ArticleAdapter articleAdapter;
    private List<ArticleBean> list=null;
    private View view=null;
    private Context context;
    private static int cur_page=1;
    private int lastVisibleItemPosition;
    @android.support.annotation.Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @android.support.annotation.Nullable ViewGroup container, @android.support.annotation.Nullable Bundle savedInstanceState) {

        view=inflater.inflate(R.layout.fragment1,container,false);
        context=view.getContext();

        initRecyclerView();
        ArticleModel articleModel =new ArticleModel();
        articleModel.getResultList("article",2,"8soafn3tpaj0efuab5jvmpbhr4",articleListener);

        return view;
    }
    ArticleListerner articleListener =new ArticleListerner() {
        @Override
        public void onResponse(List<ArticleBean> listbean) {
          if(cur_page==1){
              list=listbean;
              articleAdapter.setList(list);

          }else{
              list.removeAll(listbean);

              list.addAll(0,listbean);
              articleAdapter.setList(list);
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
        articleAdapter=new ArticleAdapter(context,list);
        ArticleAdapter.OnItemClickListener onItemClickListener= new ArticleAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position) {
                Intent intent=new Intent(getActivity(), ArticleDetailActicity.class);
                intent.putExtra("resid",list.get(position).getId());
                System.out.println(list.get(position).getId());
                intent.putExtra("userid",list.get(position).getUserid());
                System.out.println(list.get(position).getUserid());
                startActivity(intent);
//                Toast.makeText(context,position,Toast.LENGTH_SHORT).show();
            }
        };


        articleAdapter.setOnItemClickListener(onItemClickListener);
        articleAdapter.setList(list);
        recyclerView.setAdapter(articleAdapter);
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
           public void onScrollStateChanged(RecyclerView recyclerView, int newState) {

               super.onScrollStateChanged(recyclerView, newState);
               if (newState == RecyclerView.SCROLL_STATE_IDLE && lastVisibleItemPosition + 1 == list.size()) {
                   cur_page+=1;

                   new ArticleModel().getResultList("article",cur_page,"8soafn3tpaj0efuab5jvmpbhr4",articleListener);
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
