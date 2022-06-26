package cn.edu.neusoft.liruoxing522.foodorder.activity;

import android.app.Activity;
import android.os.Build;
import android.support.annotation.RequiresApi;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import cn.edu.neusoft.liruoxing522.foodorder.bean.RegisterBean;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.model.CommentUpdtorInstModel;
import cn.edu.neusoft.liruoxing522.foodorder.R;

import static cn.edu.neusoft.liruoxing522.foodorder.Server.comment_insert_update;

public class CommentUpdtorInstActivity extends BaseActivity {
    private EditText et_content;
    private Button btn_submit;
    private TextView tv_orderid;
    private int receive;
    private Button btn_back;
    private String foodname,content;

    TListener<RegisterBean> tListener=new TListener<RegisterBean>() {
        @Override
        public void onResponse(RegisterBean registerBean) {
            String success=registerBean.getSuccess().toString();
            if(success.equals("0")){
                showToast("操作失败");
            }else{
                showToast("操作成功");
                finish();
            }
        }

        @Override
        public void onFail(String msg) {
            Toast.makeText(CommentUpdtorInstActivity.this,"操作失败",Toast.LENGTH_SHORT).show();
        }
    };

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    public void initView(){
        getSupportActionBar().hide();
        setStatusBarColor(this, ContextCompat.getColor(this, R.color.colorPrimaryDark));
        setLayout_file(R.layout.activity_updateorinsert);
        btn_back= (Button) findViewById(R.id.button_back);
        et_content = (EditText)findViewById(R.id.et_content);
        tv_orderid = (TextView) findViewById(R.id.tv_orderid);
        btn_submit = (Button)findViewById(R.id.btn_change);
        //获取orderid和菜名
        foodname=getIntent().getStringExtra("foodname");
        showToast(foodname);
        receive = getIntent().getIntExtra("order_id",0);

        tv_orderid.setText(foodname+"");


    }

    @Override
    void initEvent() {
        btn_submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                CommentUpdtorInstModel c = new CommentUpdtorInstModel();
                content=et_content.getText().toString();
                if(comment_insert_update==1){
                    c.getupresultMeg(receive,content,tListener);
                }else if(comment_insert_update==0){
                    c.getinresultMeg(receive,content,tListener);
                }
            }
        });

        btn_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

    }

    @Override
    void initData() {

    }

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    static void setStatusBarColor(Activity activity, int statusColor) {
        Window window = activity.getWindow();
        //取消状态栏透明
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        //添加Flag把状态栏设为可绘制模式
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        //设置状态栏颜色
        window.setStatusBarColor(statusColor);
        //设置系统状态栏处于可见状态
        window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_VISIBLE);
        //让view不根据系统窗口来调整自己的布局
        ViewGroup mContentView = (ViewGroup) window.findViewById(Window.ID_ANDROID_CONTENT);
        View mChildView = mContentView.getChildAt(0);
        if (mChildView != null) {
            ViewCompat.setFitsSystemWindows(mChildView, false);
            ViewCompat.requestApplyInsets(mChildView);
        }
    }


}
