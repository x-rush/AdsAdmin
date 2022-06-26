package cn.edu.neusoft.liruoxing522.foodorder.Fragment;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.activity.FoodDetailActivity;
import cn.edu.neusoft.liruoxing522.foodorder.adapter.SearchAdapter;
import cn.edu.neusoft.liruoxing522.foodorder.bean.FoodListBean;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.ListListener;
import cn.edu.neusoft.liruoxing522.foodorder.model.SearchModel;
import cn.edu.neusoft.liruoxing522.foodorder.R;

/**
 * Created by www44 on 2017/11/20.
 */

public class SearchFragment extends BaseFragment {
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private List<FoodListBean> list=null;
    private SearchAdapter shopAdapter;
    private Context context;
    private static int cur_page=1;
    private int lastVisibleItemPosition;
    private EditText et_search;
    private ImageButton btn_search;

    ListListener<FoodListBean> listListener=new ListListener<FoodListBean>() {
        @Override
        public void onResponse(List<FoodListBean> listbean) {
            list=listbean;
            shopAdapter.setList(list);
        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(context,"fail:"+msg,Toast.LENGTH_SHORT).show();
        }
    };
    @Override
    void initLayout() {
        setLayout_file(R.layout.fragment_search);
    }

    @Override
    void initView() {
        context=view.getContext();
        btn_search=view.findViewById(R.id.btn_search);
        et_search=view.findViewById(R.id.et_search);
        recyclerView=view.findViewById(R.id.rv_search_list);

        //创建默认的线性LayoutManager
        layoutManager =new LinearLayoutManager(context);
        //设置布局
        recyclerView.setLayoutManager(layoutManager);
        //创建适配器
        shopAdapter=new SearchAdapter(getActivity(),list,R.layout.item);

        SearchAdapter.OnItemClickListener onItemClickListener= new SearchAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position) {
                Intent intent=new Intent(getActivity(), FoodDetailActivity.class);
                intent.putExtra("food_id",list.get(position).getFood_id());
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
                if (newState == RecyclerView.SCROLL_STATE_IDLE && lastVisibleItemPosition + 1 == list.size()) {
                    new SearchModel().getSearchMeg(et_search.getText().toString(),listListener);
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
        btn_search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SearchModel searchModel = new SearchModel();
                searchModel.getSearchMeg(et_search.getText().toString(),listListener);
            }
        });
    }

    @Override
    void initData() {

    }

    public SearchFragment(){

    }

    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        void onFragmentInteraction(Uri uri);
    }
}
