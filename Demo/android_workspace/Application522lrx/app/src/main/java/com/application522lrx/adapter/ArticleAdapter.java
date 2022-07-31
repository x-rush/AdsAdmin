package com.application522lrx.adapter;

import android.content.Context;
import android.graphics.BitmapFactory;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.application522lrx.bean.ArticleBean;
import com.application522lrx.R;
import com.squareup.picasso.Picasso;

import java.util.List;

/**
 * Created by Neusoft on 2017/4/18.
 */

public class ArticleAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder>{
    private Context context;
    private List<ArticleBean> list;
    private LayoutInflater layoutInflater;//动态加载布局
    private OnItemClickListener mOnItemClickListener=null;

    public ArticleAdapter(Context context, List<ArticleBean> list){
        layoutInflater=LayoutInflater.from(context);
        this.context=context;
        this.list=list;
    }

    public void setList(List<ArticleBean> l){
        list=l;
        notifyDataSetChanged();
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view= layoutInflater.inflate(R.layout.item, parent,false);

        ViewHolder holder=new ViewHolder(view);
        return holder;
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        final ArticleBean bean=list.get(position);
        if(bean==null) return;
        final ViewHolder viewHolder= (ViewHolder) holder;
        viewHolder.imageView.setImageBitmap(BitmapFactory.decodeResource(
                context.getResources(), R.drawable.weixin_normal));
        viewHolder.tv_title.setText(bean.getName());
        viewHolder.tv_descreption.setText(bean.getDescription());
        viewHolder.tv_time.setText(bean.getUpdate_time());

        if (mOnItemClickListener!=null){
            viewHolder.itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
//                    String strid=String.valueOf(bean.getId());
//                Toast.makeText(context, "您打开了第"+strid+"项", Toast.LENGTH_SHORT).show();
                    int position = viewHolder.getLayoutPosition();
                    mOnItemClickListener.onItemClick(viewHolder.itemView,position);
                }
            });
        }
        Picasso.with(context)
                .load("http://amicool.neusoft.edu.cn/Uploads/"+bean.getThumb())
                .placeholder(R.drawable.address_normal)
                .into(viewHolder.imageView);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public int getItemCount() {
        if (list!=null)
                return list.size();
        else
                return 0;
    }

    public  class ViewHolder extends RecyclerView.ViewHolder{
        TextView tv_title, tv_descreption, tv_time;
        ImageView imageView;

        public ViewHolder(View itemView) {
            super(itemView);
            tv_title=(TextView)itemView.findViewById(R.id.textView);
            tv_descreption=(TextView)itemView.findViewById(R.id.textView2);
            tv_time=(TextView)itemView.findViewById(R.id.textView3);
            imageView=(ImageView)itemView.findViewById(R.id.imageView);

        }
    }

    public interface OnItemClickListener{
        void onItemClick(View view, int position);
    }

    public void setOnItemClickListener(OnItemClickListener listener){
        this.mOnItemClickListener=listener;
    }
}
