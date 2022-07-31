package com.application522lrx.fragment;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.application522lrx.activity.ViewTwareActivity;
import com.application522lrx.adapter.MyAdapter;
import com.application522lrx.bean.TwareBean;
import com.application522lrx.iface.CourseListener;
import com.application522lrx.model.CourseModel;
import com.application522lrx.R;

import org.jetbrains.annotations.Nullable;

import java.util.List;

public class CourseFragment extends Fragment {
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private MyAdapter myAdapter;
    private List<TwareBean> list=null;
    private View view=null;
    private Context context;
    private static int cur_page=1;
    private int lastVisibleItemPosition;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        view=inflater.inflate(R.layout.articlefragment,container,false);
        context=view.getContext();

        initRecyclerView();
        CourseModel articleModel =new CourseModel();
        articleModel.getResultList("tware",2,"8soafn3tpaj0efuab5jvmpbhr4",articleListener);

        return view;
    }
    CourseListener articleListener =new CourseListener() {
        @Override
        public void onResponse(List<TwareBean> listbean) {

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
        myAdapter =new MyAdapter(context,list);

        MyAdapter.OnItemClickListener onItemClickListener = new MyAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position) {
                Intent intent=new Intent(context, ViewTwareActivity.class);
                intent.putExtra("pdfattach",list.get(position).getPdfattach());//
                intent.putExtra("name",list.get(position).getName());
                context.startActivity(intent);
            }
        };

        myAdapter.setOnItemClickListener(onItemClickListener);
        myAdapter.setList(list);

        recyclerView.setAdapter(myAdapter);
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {

                super.onScrollStateChanged(recyclerView, newState);
                if (newState == RecyclerView.SCROLL_STATE_IDLE && lastVisibleItemPosition + 1 == list.size()) {
                    cur_page+=1;

                    new CourseModel().getResultList("tware",cur_page,"8soafn3tpaj0efuab5jvmpbhr4",articleListener);
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
