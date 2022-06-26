package cn.edu.neusoft.liruoxing522.foodorder.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.List;

/**
 * Created by www44 on 2017/11/29.
 */

public abstract class BaseAdapter<T> extends RecyclerView.Adapter {

    Context context;
    List<T> items;
    int layoutResource;

    public BaseAdapter(Context context, List<T> items, int layoutResource) {
        this.context = context;
        this.items = items;
        this.layoutResource = layoutResource;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemview = LayoutInflater.from(context).inflate(layoutResource,parent,false);
        ViewHolder myviewholder = new ViewHolder(itemview);
        return myviewholder;
    }

    public void setList(List<T> l){
        items=l;
        notifyDataSetChanged();
    }

    @Override
    public int getItemCount() {
        if (items!=null)
            return items.size();
        else
            return 0;
    }
}
