package cn.edu.neusoft.liruoxing522.foodorder.Fragment;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.Toast;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.activity.FoodListActivity;
import cn.edu.neusoft.liruoxing522.foodorder.adapter.ShopAdapter;
import cn.edu.neusoft.liruoxing522.foodorder.bean.ShopListBean;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.ListListener;
import cn.edu.neusoft.liruoxing522.foodorder.model.ShopModel;
import cn.edu.neusoft.liruoxing522.foodorder.R;

/**
 * Created by www44 on 2017/11/20.
 */

public class ShopFragment extends BaseFragment {
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private List<ShopListBean> list=null;
    private static int lastVisibleItemPosition;
    private ShopAdapter shopAdapter;
    private Context context;
    private static int cur_page=1;
    ListListener<ShopListBean> listListener=new ListListener<ShopListBean>() {
        @Override
        public void onResponse(List<ShopListBean> listbean) {
            list=listbean;
            shopAdapter.setList(list);
//            if(cur_page==1){
//                list=listbean;
//                shopAdapter.setList(list);
//            }else{
//                list.removeAll(listbean);
//
//                list.addAll(0,listbean);
//                shopAdapter.setList(list);
//            }
        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(context,"fail:"+msg,Toast.LENGTH_SHORT).show();
        }
    };


    @Override
    void initLayout() {
        setLayout_file(R.layout.fragment_shop);
    }

    @Override
    void initView() {
        context=this.getActivity();
        recyclerView=view.findViewById(R.id.rv_shoplist);

        //创建默认的线性LayoutManager
        layoutManager =new LinearLayoutManager(context);
        //设置布局
        recyclerView.setLayoutManager(layoutManager);
        //创建适配器
        shopAdapter=new ShopAdapter(getActivity(),list,R.layout.item);

        ShopAdapter.OnItemClickListener onItemClickListener= new ShopAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position) {
                Intent intent=new Intent(getActivity(), FoodListActivity.class);
                intent.putExtra("shop_id",list.get(position).getShop_id());
                startActivity(intent);
//                Toast.makeText(context,position,Toast.LENGTH_SHORT).show();
            }
        };


        shopAdapter.setOnItemClickListener(onItemClickListener);

        shopAdapter.setList(list);
        recyclerView.setAdapter(shopAdapter);
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {

                super.onScrollStateChanged(recyclerView, newState);
                if (newState == RecyclerView.SCROLL_STATE_IDLE&& lastVisibleItemPosition + 1 == list.size()) {
                    cur_page+=1;
                    new ShopModel().getShopMeg(listListener);
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

    }

    @Override
    void initData() {
        ShopModel shopModel =new ShopModel();
        shopModel.getShopMeg(listListener);
    }

    public ShopFragment(){

    }
    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        void onFragmentInteraction(Uri uri);
    }
}
