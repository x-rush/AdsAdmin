package cn.edu.neusoft.liruoxing522.foodorder.activity;

import android.content.Intent;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.adapter.FoodCommentAdapter;
import cn.edu.neusoft.liruoxing522.foodorder.bean.FoodDetailBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.IsCollectBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.OrderOrCommentBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.RegisterBean;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.ListListener;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.model.CollectFoodorShopModel;
import cn.edu.neusoft.liruoxing522.foodorder.model.FoodCommentModel;
import cn.edu.neusoft.liruoxing522.foodorder.model.FoodDetailModel;
import cn.edu.neusoft.liruoxing522.foodorder.model.IsCollectedModel;
import cn.edu.neusoft.liruoxing522.foodorder.R;

import static cn.edu.neusoft.liruoxing522.foodorder.Server.food_flag;
import static cn.edu.neusoft.liruoxing522.foodorder.Server.user_id_remember;

/**
 * Created by www44 on 2017/12/6.
 */

public class FoodDetailActivity extends BaseActivity {
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private List<OrderOrCommentBean> list=null;
    private FoodCommentAdapter foodAdapter;
    private static int cur_page=1;
    private ImageButton bnt_collect;
    private static int lastVisibleItemPosition;
    private ImageView imageView;
    private TextView tv_foodname,tv_foodprice,tv_foodintro;
    private Button btn_buy,btn_back;
    private double foodprice;
    private String food_name;
    private EditText et_num;
    private int collect_flag,id;
    //获得菜品评论列表
    ListListener<OrderOrCommentBean> listListener=new ListListener<OrderOrCommentBean>() {
        @Override
        public void onResponse(List<OrderOrCommentBean> listbean) {
            list=listbean;
            foodAdapter.setList(list);
//            if(cur_page==1){
//            list=listbean;
//            foodAdapter.setList(list);
//            }else{
////                list.removeAll(list);
//                //在最开始的位置即0插入数据
//                list.addAll(0,listbean);
//                foodAdapter.setList(list);
//            }
        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(FoodDetailActivity.this,"fail:"+msg,Toast.LENGTH_SHORT).show();
        }
    };
    //判断是否收藏
    TListener<IsCollectBean> ttListener=new TListener<IsCollectBean>() {
        @Override
        public void onResponse(IsCollectBean isCollectBean) {
            if(isCollectBean.getCollected().equals("1")){
                collect_flag=1;
                bnt_collect.setImageResource(R.drawable.ic_favor_press);
//                showToast("已收藏");
            }else{
                collect_flag=0;
                bnt_collect.setImageResource(R.drawable.ic_favor_nomal);
//                showToast("未收藏");
            }
        }

        @Override
        public void onFail(String msg) {
            showToast("判断收藏失败");
        }
    };
    //取消收藏或收藏
    TListener<RegisterBean> collectListener=new TListener<RegisterBean>() {
        @Override
        public void onResponse(RegisterBean registerBean) {
            if(collect_flag==1&&registerBean.getSuccess().equals("1")){
                bnt_collect.setImageResource(R.drawable.ic_favor_nomal);
                showToast("取消成功");
            }else if(collect_flag==0&&registerBean.getSuccess().equals("1")){
                bnt_collect.setImageResource(R.drawable.ic_favor_press);
                showToast("收藏成功");
            }else{
                showToast("操作失败");
            }
        }

        @Override
        public void onFail(String msg) {
            showToast("操作失败");
        }
    };
    @Override
    void initView() {
        setLayout_file(R.layout.activity_foodinfo);
        getSupportActionBar().hide();
        id=getIntent().getIntExtra("food_id",0);
        imageView= (ImageView) findViewById(R.id.image_Food);
        tv_foodname = (TextView) findViewById(R.id.tv_foodname);
        tv_foodprice = (TextView) findViewById(R.id.tv_foodprice);
        tv_foodintro = (TextView) findViewById(R.id.tv_foodintro);
        btn_buy = (Button) findViewById(R.id.btn_buy);
        btn_back= (Button) findViewById(R.id.button_back);
        et_num= (EditText) findViewById(R.id.et_num);
        bnt_collect= (ImageButton) findViewById(R.id.btn_collectf);
        recyclerView= (RecyclerView) findViewById(R.id.rv_foodcommentlist);

        //创建默认的线性LayoutManager
        layoutManager =new LinearLayoutManager(FoodDetailActivity.this);
        //设置布局
        recyclerView.setLayoutManager(layoutManager);
        //创建适配器
        foodAdapter=new FoodCommentAdapter(this,list,R.layout.item_order);

        foodAdapter.setList(list);
        recyclerView.setAdapter(foodAdapter);
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                super.onScrollStateChanged(recyclerView, newState);
                //判断是否滚到最后一行
                if (newState == RecyclerView.SCROLL_STATE_IDLE &&lastVisibleItemPosition + 1 == list.size()) {
//                    cur_page++;
//                    showToast(""+list.size());
                    new FoodCommentModel().getFoodCommentMeg(id,listListener);
                }
            }
            @Override
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);
                lastVisibleItemPosition=list.size()-1;
            }
        });
    }

    @Override
    void initEvent() {
        //获得菜品详情
        TListener<FoodDetailBean> tListener = new TListener<FoodDetailBean>() {
            @Override
            public void onResponse(FoodDetailBean foodDetailBean) {
                foodprice=foodDetailBean.getPrice();
                tv_foodname.setText("菜名:"+foodDetailBean.getFoodname());
                food_name=foodDetailBean.getFoodname().toString();
                tv_foodprice.setText("价格:￥"+foodDetailBean.getPrice());
                tv_foodintro.setText("简介:"+foodDetailBean.getIntro());
                Picasso.with(FoodDetailActivity.this).load(foodDetailBean.getPic()).into(imageView);
            }

            @Override
            public void onFail(String msg) {
                Toast.makeText(FoodDetailActivity.this,"获取店铺详情失败",Toast.LENGTH_SHORT).show();
            }
        };

        //加载菜品详情

        FoodDetailModel foodDetailModel = new FoodDetailModel();
        foodDetailModel.getFoodMeg(id,tListener);

        //返回上一级
        btn_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        //点击购买
        btn_buy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(FoodDetailActivity.this,PurchaseActivity.class);
                intent.putExtra("food_id",id);
                intent.putExtra("food_price",foodprice);
                intent.putExtra("food_name",food_name);
                intent.putExtra("food_num",et_num.getText().toString());
                startActivity(intent);
            }
        });

        //判断是否收藏过当前栏目
        final IsCollectedModel isCollectedModel=new IsCollectedModel();
        isCollectedModel.getcollectedMsg(user_id_remember,id,food_flag,ttListener);

        //点击收藏或取消收藏
        bnt_collect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                isCollectedModel.getcollectedMsg(user_id_remember,id,food_flag,ttListener);
                CollectFoodorShopModel modul = new CollectFoodorShopModel();
                modul.getfoodcollectedMsg(user_id_remember,id,collectListener);
            }
        });

        FoodCommentModel foodCommentModel = new FoodCommentModel();
        foodCommentModel.getFoodCommentMeg(id,listListener);
    }

    @Override
    void initData() {

    }
}
