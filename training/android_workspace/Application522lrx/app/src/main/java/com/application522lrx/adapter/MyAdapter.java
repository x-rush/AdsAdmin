package com.application522lrx.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.application522lrx.bean.TwareBean;
import com.application522lrx.R;
import com.squareup.picasso.Picasso;

import java.util.List;

/**
 * Created by zci on 2017/5/11.
 */

public class MyAdapter extends RecyclerView.Adapter {
    private Context context;
    private LayoutInflater layoutInflater;//动态加载布局
    private List<TwareBean> list;//保存要显示的数据
    private LayoutInflater inflater;
    private OnItemClickListener mOnItemClickListener = null;
    //1.自定义：构造方法，传进上下文
    public MyAdapter(Context context,List<TwareBean> list) {
        this.inflater = LayoutInflater.from(context);
        this.context=context;
        layoutInflater=LayoutInflater.from(context);
    }

    //2.自定义：获取数据
    public void setList(List<TwareBean> list)
    {
        this.list=list;
        //更新数据
        notifyDataSetChanged();
    }
    //3.自定义：viewHolder子类
    public class ViewHolder extends RecyclerView.ViewHolder{
        private ImageView imageView;
        private TextView tv_title,tv_descript,tv_time;
        public ViewHolder(View itemView) {
            super(itemView);
            imageView = (ImageView) itemView.findViewById(R.id.imageView);
            tv_title = (TextView) itemView.findViewById(R.id.textView);
            tv_descript = (TextView) itemView.findViewById(R.id.textView2);
            tv_time = (TextView) itemView.findViewById(R.id.textView3);
        }
    }
    //4重写:生成item的View
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
    //inflate第一个参数要加载的布局id，第二个参数是指给该布局的外部再嵌套一层父布局，如果不需要就直接传null
        View v = layoutInflater.inflate(R.layout.item, parent, false);
        return new ViewHolder(v);
    }
    //5重写：给viewholder中的控件填充值,设置监听
    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        final TwareBean articleBean = list.get(position);
        if (articleBean == null)
            return;

        final ViewHolder viewholder = (ViewHolder) holder;
        viewholder.tv_title.setText(articleBean.getName());
        viewholder.tv_descript.setText(articleBean.getDescription());
        viewholder.tv_time.setText(articleBean.getUpdate_time());

        //条目点击监听事件
        viewholder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //获取当前条目id
//                String strid=String.valueOf(articleBean.getId());
//                Toast.makeText(context, strid, Toast.LENGTH_SHORT).show();
                int position = viewholder.getLayoutPosition();
                mOnItemClickListener.onItemClick(viewholder.itemView, position);
            }
        });

        Picasso.with(context).load("http://amicool.neusoft.edu.cn/Uploads/"+articleBean.getThumb())
                .placeholder(R.drawable.friend_normal)
                .into(viewholder.imageView);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }
    @Override
    public int getItemCount() {
        if(list == null) return 0;
        else return list.size();
    }
    private String getLimitLengthString(String str,int len, String symbol){
        if(str.length()<len)
            return str;
        else{
            return str.substring(0,len-1)+symbol;
        }
    }

    public interface OnItemClickListener{
        void onItemClick(View view, int position);
    }
    public void setOnItemClickListener(MyAdapter.OnItemClickListener listener){
        this.mOnItemClickListener=listener;
    }
}
