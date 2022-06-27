package com.recyclerdemo;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.List;

/**
 * Created by Administrator on 2017/9/25.
 */

public class MyAdapter extends RecyclerView.Adapter{
    private Context context;
    private List<String> items;

    public MyAdapter(Context context, List<String> items) {
        this.context = context;
        this.items = items;
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemViem = LayoutInflater.from(context).inflate(R.layout.card,parent,false);
        MyViewHolder myViewHolder = new MyViewHolder(itemViem);
        return myViewHolder;
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
    MyViewHolder myViewHolder=(MyViewHolder)holder;
        String text=items.get(position);
        myViewHolder.tv.setText(text);
        myViewHolder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.i("TEST", "onClick: ");
            }
        });
    }

    @Override
    public int getItemCount() {
        return items.size();
    }
}
