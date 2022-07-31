package com.application522lrx.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.application522lrx.bean.ArticleBean;
import com.application522lrx.bean.CollectBean;
import com.application522lrx.R;
import com.squareup.picasso.Picasso;

import java.util.List;

/**
 * Created by Administrator on 2017/6/8.
 */

public class CArticleAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private Context context;
    private LayoutInflater layoutInflater;
    private List<CollectBean<ArticleBean>> list;
    private CArticleAdapter.OnItemClickListener mOnItemClickListener = null;

    public CArticleAdapter(Context context,List<CollectBean<ArticleBean>> list){
        this.context=context;
        layoutInflater=LayoutInflater.from(context);
        this.list=list;
    }

    public void setList(List<CollectBean<ArticleBean>>list){
        this.list=list;
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

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        final ArticleBean articleBean=list.get(position).getBean();
        if(articleBean==null) return;
        final ViewHolder viewHolder=(ViewHolder)holder;
        viewHolder.tv_title.setText(articleBean.getName());
        viewHolder.tv_descreption.setText("描述"+articleBean.getDescription());
        viewHolder.tv_time.setText(articleBean.getUpdate_time());

        if (mOnItemClickListener!=null) {
            viewHolder.itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    int position = viewHolder.getLayoutPosition();
                    //通过articleBean.getId()得到文章id
                    mOnItemClickListener.onItemClick(viewHolder.itemView, articleBean);//这里需要传articleBean而不是position
//                String strid=String.valueOf(articleBean.getId());
//                Toast.makeText(context, "您打开了第"+strid+"项", Toast.LENGTH_SHORT).show();
                }
            });
        }
        Picasso.with(context)
                .load("http://amicool.neusoft.edu.cn/Uploads/"+articleBean.getThumb())
                .placeholder(R.drawable.address_normal)
                .into(viewHolder.imageView);
    }

    @Override
    public int getItemCount() {
        if(list==null)return 0;
        else return list.size();
    }
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view= layoutInflater.inflate(R.layout.item, parent,false);

        CArticleAdapter.ViewHolder holder=new CArticleAdapter.ViewHolder(view);
        return holder;
    }
    public void setOnItemClickListener(CArticleAdapter.OnItemClickListener listener) {
        this.mOnItemClickListener = listener;
    }
    public interface OnItemClickListener{
        void onItemClick(View view, ArticleBean position);
    }
}
