package cn.edu.neusoft.liruoxing522.foodorder.activity;

import android.content.Intent;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Toast;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.adapter.FoodAdapter;
import cn.edu.neusoft.liruoxing522.foodorder.bean.FoodListBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.IsCollectBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.RegisterBean;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.ListListener;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.model.CollectFoodorShopModel;
import cn.edu.neusoft.liruoxing522.foodorder.model.FoodModel;
import cn.edu.neusoft.liruoxing522.foodorder.model.IsCollectedModel;
import cn.edu.neusoft.liruoxing522.foodorder.R;

import static cn.edu.neusoft.liruoxing522.foodorder.Server.shop_flag;
import static cn.edu.neusoft.liruoxing522.foodorder.Server.user_id_remember;

/**
 * Created by www44 on 2017/12/4.
 */

public class FoodListActivity extends BaseActivity {
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private List<FoodListBean> list=null;
    private FoodAdapter foodAdapter;
    private Button btn_back;
    private ImageButton bnt_collect;
    private static int lastVisibleItemPosition;
    int collect_flag=0;
    int receive;

    ListListener<FoodListBean> listListener=new ListListener<FoodListBean>() {
        @Override
        public void onResponse(List<FoodListBean> listbean) {
            list=listbean;
            foodAdapter.setList(list);
//            if(cur_page==1){
//                list=listbean;
//                foodAdapter.setList(list);
//            }else{
//                list.removeAll(listbean);
//
//                list.addAll(0,listbean);
//                foodAdapter.setList(list);
//            }
        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(FoodListActivity.this,"fail:"+msg,Toast.LENGTH_SHORT).show();
        }
    };

    TListener<IsCollectBean> tListener=new TListener<IsCollectBean>() {
        @Override
        public void onResponse(IsCollectBean isCollectBean) {
            if(isCollectBean.getCollected().equals("1")){
                collect_flag=1;
                bnt_collect.setImageResource(R.drawable.ic_favor_press);
//                showToast("已收藏");
            }else{
                bnt_collect.setImageResource(R.drawable.ic_favor_nomal);
                collect_flag=0;
//                showToast("未收藏");
            }
        }

        @Override
        public void onFail(String msg) {
            showToast("判断收藏失败");
        }
    };

    TListener<RegisterBean> collectListener=new TListener<RegisterBean>() {
        @Override
        public void onResponse(RegisterBean registerBean) {
            if(collect_flag==1&&registerBean.getSuccess().equals("1")){
                bnt_collect.setImageResource(R.drawable.ic_favor_nomal);
                showToast("取消成功");
            }else if(collect_flag==0&&registerBean.getSuccess().equals("1")){
                bnt_collect.setImageResource(R.drawable.ic_favor_press);
                showToast("收藏成功");
            }
            else{
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
        setLayout_file(R.layout.fragment_food);
        getSupportActionBar().hide();
        recyclerView= (RecyclerView) findViewById(R.id.rv_foodlist);
        bnt_collect= (ImageButton) findViewById(R.id.btn_collect);
        btn_back= (Button) findViewById(R.id.button_back);
        //创建默认的线性LayoutManager
        layoutManager =new LinearLayoutManager(FoodListActivity.this);
        //设置布局
        recyclerView.setLayoutManager(layoutManager);
        //创建适配器
        foodAdapter=new FoodAdapter(this,list,R.layout.item_food);

        FoodAdapter.OnItemClickListener onItemClickListener= new FoodAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position) {
                Intent intent=new Intent(FoodListActivity.this, FoodDetailActivity.class);
                intent.putExtra("food_id",list.get(position).getFood_id());
                intent.putExtra("food_name",list.get(position).getFoodname());
                intent.putExtra("food_price",list.get(position).getPrice());
                intent.putExtra("food_intro",list.get(position).getIntro());
                startActivity(intent);
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
                if (newState == RecyclerView.SCROLL_STATE_IDLE && lastVisibleItemPosition + 1 == list.size()) {
                    new FoodModel().getFoodMeg(receive,listListener);
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
        btn_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        receive = getIntent().getIntExtra("shop_id",2);
        FoodModel foodModel =new FoodModel();
        foodModel.getFoodMeg(receive,listListener);

        final IsCollectedModel isCollectedModel=new IsCollectedModel();
        isCollectedModel.getcollectedMsg(user_id_remember,receive,shop_flag,tListener);

        bnt_collect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                isCollectedModel.getcollectedMsg(user_id_remember,receive,shop_flag,tListener);

                CollectFoodorShopModel modul = new CollectFoodorShopModel();
                modul.getshopcollectedMsg(user_id_remember,receive,collectListener);
            }
        });
    }

    @Override
    void initData() {

    }
}
