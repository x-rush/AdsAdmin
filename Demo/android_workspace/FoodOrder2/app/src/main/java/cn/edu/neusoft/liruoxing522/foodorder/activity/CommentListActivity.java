package cn.edu.neusoft.liruoxing522.foodorder.activity;

import android.content.Intent;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.adapter.CommentAdapter;
import cn.edu.neusoft.liruoxing522.foodorder.bean.OrderOrCommentBean;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.ListListener;
import cn.edu.neusoft.liruoxing522.foodorder.model.OrderOrCommentModel;
import cn.edu.neusoft.liruoxing522.foodorder.R;

import static cn.edu.neusoft.liruoxing522.foodorder.Server.comment_insert_update;
import static cn.edu.neusoft.liruoxing522.foodorder.Server.user_id_remember;

/**
 * Created by www44 on 2017/12/4.
 */

public class CommentListActivity extends BaseActivity {
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private List<OrderOrCommentBean> list=null;
    private CommentAdapter foodAdapter;
    private Button btn_back;
    private TextView tv_title;
    private static int lastVisibleItemPosition;

    ListListener<OrderOrCommentBean> listListener=new ListListener<OrderOrCommentBean>() {
        @Override
        public void onResponse(List<OrderOrCommentBean> listbean) {
            list=listbean;
            foodAdapter.setList(list);
        }

        @Override
        public void onFail(String msg) {
            list=null;
            foodAdapter.setList(list);
            foodAdapter.notifyDataSetChanged();
            Toast.makeText(CommentListActivity.this,"fail:"+"无数据",Toast.LENGTH_SHORT).show();
        }
    };

    @Override
    void initView() {
        setLayout_file(R.layout.activity_order);
        getSupportActionBar().hide();
        recyclerView= (RecyclerView) findViewById(R.id.rv_orderlist);
        tv_title= (TextView) findViewById(R.id.tv_title);
        tv_title.setText("我的评论");
        btn_back= (Button) findViewById(R.id.button_back);
        //创建默认的线性LayoutManager
        layoutManager =new LinearLayoutManager(CommentListActivity.this);
        //设置布局
        recyclerView.setLayoutManager(layoutManager);
        //创建适配器
        foodAdapter=new CommentAdapter(this,list,R.layout.item_order);

        CommentAdapter.OnItemClickListener onItemClickListener= new CommentAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position) {
                Intent intent=new Intent(CommentListActivity.this, CommentUpdtorInstActivity.class);
                intent.putExtra("order_id",list.get(position).getOrder_id());
                intent.putExtra("foodname",list.get(position).getFoodname().toString());
                comment_insert_update=1;
                startActivity(intent);
//                showToast(list.get(position).getOrder_id()+"");
            }
        };

        foodAdapter.setOnItemClickListener(onItemClickListener);
        foodAdapter.setList(list);
        recyclerView.setAdapter(foodAdapter);
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {

                super.onScrollStateChanged(recyclerView, newState);
                //判断是否滚到最后一行
                if (newState == RecyclerView.SCROLL_STATE_IDLE) {
                    new OrderOrCommentModel().getCommentMeg(user_id_remember,listListener);
                }
            }

            @Override
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);
            }
        });
    }

    @Override
    void initEvent() {
        OrderOrCommentModel orderModel = new OrderOrCommentModel();
        orderModel.getCommentMeg(user_id_remember,listListener);

        btn_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });


    }

    @Override
    void initData() {

    }
}
