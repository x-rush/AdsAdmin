package cn.edu.neusoft.liruoxing.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import butterknife.BindView;
import butterknife.ButterKnife;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.bean.MasterDetailBean;

public class CommentAdapter extends RecyclerView.Adapter<CommentAdapter.ViewHolder> {

    private MasterDetailBean.DataBean mData;

    public CommentAdapter(MasterDetailBean.DataBean data) {
        this.mData = data;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        // 实例化展示的view
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_comment, parent, false);
        // 实例化viewholder
        ViewHolder viewHolder = new ViewHolder(v);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, final int position) {
        // 绑定数据
        holder.title.setText("评论: " + mData.getComments().get(position).getComment_content());
        holder.content.setText("时间: " + mData.getComments().get(position).getComment_time());

    }

    @Override
    public int getItemCount() {
        return mData == null ? 0 : mData.getComments().size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
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

