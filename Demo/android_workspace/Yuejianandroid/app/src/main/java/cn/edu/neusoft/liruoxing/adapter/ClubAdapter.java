package cn.edu.neusoft.liruoxing.adapter;

import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;

import butterknife.BindView;
import butterknife.ButterKnife;
import cn.edu.neusoft.liruoxing.activity.ClubDetailActivity;
import cn.edu.neusoft.liruoxing.myapplication.MyApplication;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.bean.ClubBean;

public class ClubAdapter extends RecyclerView.Adapter<ClubAdapter.ViewHolder> {

    private ClubBean mData;

    public ClubAdapter(ClubBean data) {
        this.mData = data;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        // 绑定布局文件
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_club, parent, false);
        // 实例化viewholder
        ViewHolder viewHolder = new ViewHolder(v);
        return viewHolder;
    }

    @Override
    //将数据绑定到布局控件当中
    public void onBindViewHolder(ViewHolder holder, final int position) {

        holder.title.setText(mData.getData().get(position).getClub_name());

        Glide.with(MyApplication.getAppContext())
                .load(MyApplication.getImagePath() + mData.getData().get(position).getClub_pic())
                .into(holder.image);
        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(v.getContext(), ClubDetailActivity.class);
                intent.putExtra("id", mData.getData().get(position).getId());
                v.getContext().startActivity(intent);
            }
        });
    }

    @Override
    public int getItemCount() {
        return mData == null ? 0 : mData.getData().size();
    }
    //声明Item的布局，并且绑定相关控件

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
