package cn.edu.neusoft.liruoxing522.foodorder.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.View;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.bean.OrderOrCommentBean;

/**
 * Created by www44 on 2017/9/25.
 */

public class FoodCommentAdapter extends BaseAdapter<OrderOrCommentBean>{
    private OnItemClickListener mOnItemClickListener=null;
    private Context context;

    public FoodCommentAdapter(Context context, List<OrderOrCommentBean> items, int layoutResource) {
        super(context, items, layoutResource);
        this.context=context;
    }

    public void setList(List<OrderOrCommentBean> l){
        items=l;
        notifyDataSetChanged();
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        final OrderOrCommentBean bean = items.get(position);
        if(bean==null) return;
        final ViewHolder viewHolder= (ViewHolder) holder;
        viewHolder.tv_name.setText(bean.getUsername());
//        if(bean.getContent().toString().trim().equals("")){
//            viewHolder.address.setText("此用户没有填写评论");
//        }else
        viewHolder.address.setText(bean.getContent());
        viewHolder.price.setText(bean.getComment_time());
    }
    public interface OnItemClickListener{
        void onItemClick(View view, int position);
    }

    public void setOnItemClickListener(OnItemClickListener listener){
        this.mOnItemClickListener=listener;
    }
//    @Override
//    public int getItemCount() {
//        if (items!=null)
//            return 3;
//        else
//            return 0;
//    }
}
