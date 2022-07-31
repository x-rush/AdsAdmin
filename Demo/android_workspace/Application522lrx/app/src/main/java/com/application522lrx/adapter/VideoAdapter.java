package com.application522lrx.adapter;

import android.content.Context;
import android.graphics.BitmapFactory;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.application522lrx.bean.VideoBean;
import com.application522lrx.R;
import com.squareup.picasso.Picasso;

import java.util.List;

public class VideoAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder>{

	private LayoutInflater inflater;
	private List<VideoBean> list;
	private Context context;
	private OnItemClickListener mOnItemClickListener = null;
	
	public VideoAdapter(Context context, List<VideoBean> list)
	{		
		this.inflater = LayoutInflater.from(context);
		this.list=list;
		this.context=context;		
	}

	public interface OnItemClickListener {
		void onItemClick(View view, int position);

		void onItemLongClick(View view, int position);
	}
	

	public void setList(List<VideoBean> l){
		list=l;
        notifyDataSetChanged();
	}

	@Override
	public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {

			View view =inflater.inflate(R.layout.item_video, parent,false);
			return new ViewHolder(view);

	}

	@Override
	public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
		VideoBean bean = list.get(position);
		if(bean==null) return;
		final ViewHolder viewHolder= (ViewHolder) holder;
		viewHolder.thumb.setImageBitmap(BitmapFactory.decodeResource(
				context.getResources(), R.drawable.address_normal));
		viewHolder.name.setText(bean.getName());
		viewHolder.insert_time.setText(bean.getUpdate_time());
		viewHolder.description.setText(getLimitLengthString(bean.getDescription(),58,"..."));
		//viewHolder.itemView.setTag(bean);
		if (mOnItemClickListener != null) {
			viewHolder.itemView.setOnClickListener(new View.OnClickListener() {
				@Override
				public void onClick(View v) {
					int position = viewHolder.getLayoutPosition();
					mOnItemClickListener.onItemClick(viewHolder.itemView, position);
				}
			});

			viewHolder.itemView.setOnLongClickListener(new View.OnLongClickListener() {
				@Override
				public boolean onLongClick(View v) {
					int position = viewHolder.getLayoutPosition();
					mOnItemClickListener.onItemLongClick(viewHolder.itemView, position);
					return false;
				}
			});
		}
		//使用同样开发团队的Picasso支持包进行图片加载，由于接口中返回的img路径不是全的，所以需要加上网站前缀
		Picasso.with(context)
				.load("http://amicool.neusoft.edu.cn/Uploads/"+bean.getThumb())
				.placeholder(R.drawable.address_normal)
				.into(viewHolder.thumb);
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



	public void setOnItemClickListener(OnItemClickListener listener) {
		this.mOnItemClickListener = listener;
	}

	/*@Override
	public void onClick(View v) {
		if (mOnItemClickListener != null) {
			//注意这里使用getTag方法获取数据
			mOnItemClickListener.onItemClick(v,(VideoBean)v.getTag());
		}
	}*/

	static class ViewHolder extends RecyclerView.ViewHolder{
		TextView name;
		TextView insert_time;
		TextView description;
		ImageView thumb;

		public ViewHolder(View itemView) {
			super(itemView);
			thumb = (ImageView) itemView
					.findViewById(R.id.video_thumb);
			name = (TextView) itemView
					.findViewById(R.id.video_name);
			insert_time = (TextView) itemView
					.findViewById(R.id.video_insert_time);
			description = (TextView) itemView
					.findViewById(R.id.video_description);

		}
	}
	private String getLimitLengthString(String str,int len, String symbol){
		if(str.length()<len)
			return str;
		else{
			return str.substring(0,len-1)+symbol;
		}
	}

}
