package cn.edu.neusoft.liruoxing522.foodorder.activity;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import cn.edu.neusoft.liruoxing522.foodorder.bean.PurchaseBean;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.model.PurchaseModel;
import cn.edu.neusoft.liruoxing522.foodorder.R;

import static cn.edu.neusoft.liruoxing522.foodorder.Server.user_id_remember;

/**
 * Created by www44 on 2017/12/10.
 */

public class PurchaseActivity extends BaseActivity{

    int user_id;
    int food_id,foodnum;
    double food_price;
    String foodname;
    Button but_purchase,btn_back;
    EditText et_suggestion,et_address,et_phone;
    TextView tv_sum,tv_sums,user_name,food_name,tv_food_price,tv_num;

    @Override
    void initView() {
        setLayout_file(R.layout.activity_purchase);
        getSupportActionBar().hide();
        try {
            foodnum= Integer.valueOf(getIntent().getStringExtra("food_num")).intValue();
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        food_id=getIntent().getIntExtra("food_id",0);
        food_price=getIntent().getDoubleExtra("food_price",0);
        foodname=getIntent().getStringExtra("food_name");
        but_purchase= (Button) findViewById(R.id.btn_purchaseY);
        btn_back= (Button) findViewById(R.id.button_back);
        et_suggestion= (EditText) findViewById(R.id.et_suggestion);
        tv_sum= (TextView) findViewById(R.id.tv_sum);
        tv_sums= (TextView) findViewById(R.id.tv_sums);
        food_name= (TextView) findViewById(R.id.tv_goodname);
        tv_food_price= (TextView) findViewById(R.id.tv_goodprice);
        user_name= (TextView) findViewById(R.id.tv_purchaseuser);
        tv_num= (TextView) findViewById(R.id.tv_num);
        et_address= (EditText) findViewById(R.id.et_address);
        et_phone= (EditText) findViewById(R.id.et_phone);
//        showToast(user_id_remember+"");
        tv_num.setText("×"+getIntent().getStringExtra("food_num"));
        user_name.setText(getUser_name()+"");
        food_name.setText(foodname.toString());
        tv_food_price.setText(""+food_price);
        tv_sum.setText("￥"+(food_price*foodnum+4));
        tv_sums.setText("￥"+(food_price*foodnum+4));

    }

    @Override
    void initEvent() {
        final TListener<PurchaseBean> tListener = new TListener<PurchaseBean>() {
            @Override
            public void onResponse(PurchaseBean purchaseBean) {
                if(purchaseBean.getSuccess()==1) {
                    Toast.makeText(PurchaseActivity.this, "购买成功"+purchaseBean.getSuccess(), Toast.LENGTH_SHORT).show();
                    finish();
                }else
                    Toast.makeText(PurchaseActivity.this, "购买失败", Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onFail(String msg) {
                Toast.makeText(PurchaseActivity.this, "购买失败", Toast.LENGTH_SHORT).show();
            }
        };
        btn_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        but_purchase.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(et_phone.getText().toString().equals("")||et_address.getText().toString().equals("")){
                    showToast("信息填写不全");
                }else {
                    new AlertDialog.Builder(PurchaseActivity.this)
                            .setIcon(R.drawable.agree)//这里是显示提示框的图片信息，我这里使用的默认androidApp的图标
                            .setTitle("确认付款")
                            .setMessage("您确认购买吗？")
                            .setPositiveButton("取消",null)
                            .setNegativeButton("确认", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialog, int which) {
                                    PurchaseModel purchaseModel = new PurchaseModel();
                                    purchaseModel.getPurchaseMsg(user_id_remember, food_id, foodnum, food_price, et_suggestion.getText().toString(), tListener);
                                }
                            }).show();
                }
            }
        });
    }

    @Override
    void initData() {

    }
}
