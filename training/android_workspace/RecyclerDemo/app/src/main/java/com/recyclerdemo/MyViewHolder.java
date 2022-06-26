package com.recyclerdemo;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * Created by Administrator on 2017/9/25.
 */

public class MyViewHolder extends RecyclerView.ViewHolder{
    public ImageView img;
    public TextView tv;
    public MyViewHolder(View itemView) {
        super(itemView);

        img=(ImageView)itemView.findViewById(R.id.img_card);
        tv=(TextView)itemView.findViewById(R.id.tv_card);
    }
}
