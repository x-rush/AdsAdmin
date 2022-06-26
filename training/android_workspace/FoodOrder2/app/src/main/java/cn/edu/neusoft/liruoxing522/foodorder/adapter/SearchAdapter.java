package cn.edu.neusoft.liruoxing522.foodorder.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.View;

import com.squareup.picasso.Picasso;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.bean.FoodListBean;

/**
 * Created by www44 on 2017/9/25.
 */

public class SearchAdapter extends BaseAdapter<FoodListBean>{
    private OnItemClickListener mOnItemClickListener=null;
    private Context context;
    public SearchAdapter(Context context, List<FoodListBean> items, int layoutResource) {
        super(context, items, layoutResource);
        this.context=context;
    }

    public void setList(List<FoodListBean> l){
        items=l;
        notifyDataSetChanged();
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        final FoodListBean bean = items.get(position);
        if(bean==null) return;
        final ViewHolder viewHolder= (ViewHolder) holder;
        viewHolder.tv_name.setText(bean.getFoodname());
//        Toast.makeText(context,viewHolder.tv_name.getText().toString(),Toast.LENGTH_SHORT).show();
        viewHolder.address.setText(bean.getIntro());
        viewHolder.price.setText("价格:￥"+bean.getPrice());
        Picasso.with(context).load(items.get(position).getPic()).into(viewHolder.img);
        if (mOnItemClickListener!=null){
            viewHolder.itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    String strid=String.valueOf(bean.getShop_id());
//                Toast.makeText(context, "您打开了第"+strid+"项", Toast.LENGTH_SHORT).show();
                    int position = viewHolder.getLayoutPosition();
                    mOnItemClickListener.onItemClick(viewHolder.itemView,position);
                }
            });
        }

    }
    public interface OnItemClickListener{
        void onItemClick(View view, int position);
    }

    public void setOnItemClickListener(OnItemClickListener listener){
        this.mOnItemClickListener=listener;
    }
}
