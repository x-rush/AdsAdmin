package cn.edu.neusoft.liruoxing522.foodorder.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.View;

import com.squareup.picasso.Picasso;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.bean.ShopListBean;

/**
 * Created by Administrator on 2017/11/29.
 */

public class ShopAdapter extends BaseAdapter<ShopListBean> {
    private OnItemClickListener mOnItemClickListener=null;

    public ShopAdapter(Context context, List<ShopListBean> items, int layoutResource) {
        super(context, items, layoutResource);
    }
    public void setList(List<ShopListBean> l){
        items=l;
        notifyDataSetChanged();
    }
    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        final ShopListBean bean = items.get(position);
        if(bean==null) return;
        final ViewHolder viewHolder= (ViewHolder) holder;
        viewHolder.tv_name.setText(bean.getShopname());
//        Toast.makeText(context,viewHolder.tv_name.getText().toString(),Toast.LENGTH_SHORT).show();
        viewHolder.address.setText(bean.getAddress());
        viewHolder.price.setText("电话"+bean.getPhonenum());
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
