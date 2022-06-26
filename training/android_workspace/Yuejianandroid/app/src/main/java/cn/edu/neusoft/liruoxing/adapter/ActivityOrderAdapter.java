package cn.edu.neusoft.liruoxing.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;

import butterknife.BindView;
import butterknife.ButterKnife;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.myapplication.MyApplication;
import cn.edu.neusoft.liruoxing.bean.ActivityOrderBean;

public class ActivityOrderAdapter extends RecyclerView.Adapter<ActivityOrderAdapter.ViewHolder> {

    private ActivityOrderBean mData;

    public ActivityOrderAdapter(ActivityOrderBean data) {
        this.mData = data;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        // 实例化展示的view
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_master, parent, false);
        // 实例化viewholder
        ViewHolder viewHolder = new ViewHolder(v);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, final int position) {
        // 绑定数据
        holder.title.setText(mData.getData().get(position).getActivity_name());

        Glide.with(MyApplication.getAppContext())
                .load(MyApplication.getImagePath() + mData.getData().get(position).getActivity_pic())
                .into(holder.image);

    }

    @Override
    public int getItemCount() {
        return mData == null ? 0 : mData.getData().size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        @BindView(R.id.image)
        ImageView image;
        @BindView(R.id.title)
        TextView title;
        @BindView(R.id.content)
        TextView content;

        public ViewHolder(View itemView) {
            super(itemView);
            ButterKnife.bind(this, itemView);
        }
    }
}

