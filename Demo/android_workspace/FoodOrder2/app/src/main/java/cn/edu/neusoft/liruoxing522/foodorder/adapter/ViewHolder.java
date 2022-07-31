package cn.edu.neusoft.liruoxing522.foodorder.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import cn.edu.neusoft.liruoxing522.foodorder.R;

/**
 * Created by www44 on 2017/12/3.
 */

public class ViewHolder extends RecyclerView.ViewHolder{

    ImageView img;
    TextView tv_name;
    TextView address;
    TextView price;
    Button remove;

    public ViewHolder(View itemView) {
        super(itemView);

        img=itemView.findViewById(R.id.imageView_card);
        tv_name=itemView.findViewById(R.id.tv_shopname);
        address=itemView.findViewById(R.id.tv_address);
        price=itemView.findViewById(R.id.tv_price);
        remove=itemView.findViewById(R.id.btn_remove);
    }
}
