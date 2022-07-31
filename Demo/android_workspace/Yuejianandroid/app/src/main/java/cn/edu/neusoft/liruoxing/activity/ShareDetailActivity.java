package cn.edu.neusoft.liruoxing.activity;

import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.bumptech.glide.Glide;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.adapter.SlideCommentAdapter;
import cn.edu.neusoft.liruoxing.myapplication.MyApplication;
import cn.edu.neusoft.liruoxing.bean.CommentStatusBean;
import cn.edu.neusoft.liruoxing.bean.SlideCommentBean;
import cn.edu.neusoft.liruoxing.bean.UserBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.model.ShareModel;
import cn.edu.neusoft.liruoxing.model.UserMsgModel;
import cn.edu.neusoft.liruoxing.service.ShareService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class ShareDetailActivity extends AppCompatActivity implements RetrofitListener<UserBean> {
    @BindView(R.id.title)
    TextView title;
    @BindView(R.id.detail_image)
    ImageView detail_image;
    @BindView(R.id.content)
    TextView content;
    @BindView(R.id.list_comment)
    RecyclerView list_comment;

    Context context = this;

    @OnClick({R.id.btn_comment})
    public void btnComment() {
        final EditText et = new EditText(this);
        new AlertDialog.Builder(this).setTitle("请输入评论")
                .setIcon(android.R.drawable.sym_def_app_icon)
                .setView(et)
                .setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        //按下确定键后的事件
                        comment(et.getText().toString());
                    }
                }).setNegativeButton("取消", null).show();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_share_detail);
        getSupportActionBar().hide();
        ButterKnife.bind(this);
        initView();
        initData();
        initComment();
    }

    private void initView() {
        title.setText(getIntent().getStringExtra("comment"));
        Glide.with(MyApplication.getAppContext())
                .load(MyApplication.getImagePath() + getIntent().getStringExtra("pic"))
                .into(detail_image);
        content.setText("发布时间: " + getIntent().getStringExtra("time"));

        list_comment.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
    }

    private void initData() {
        UserMsgModel model = new UserMsgModel();
        SharedPreferences sp = getSharedPreferences("yj", MODE_PRIVATE);
        String userId = sp.getString("id", "0");
        model.getUserMessage(this, userId);
    }

    @Override
    public void onSuccess(UserBean userBean, int flag) {
        content.setText("发布人: " + userBean.getData().getUsername()
                + "\n发布时间: " + getIntent().getStringExtra("time"));
    }

    @Override
    public void onFail(String msg) {

    }

    private void initComment() {
        ShareService service = new ShareModel().model().create(ShareService.class);
        String showId = getIntent().getStringExtra("show_id");
        Call<List<SlideCommentBean>> call = service.commentList(showId);//getIntent().getStringExtra("slide_id")

        call.enqueue(new Callback<List<SlideCommentBean>>() {

            @Override
            public void onResponse(Response<List<SlideCommentBean>> response) {
                list_comment.setAdapter(new SlideCommentAdapter(response.body()));
                for (SlideCommentBean item : response.body()) {
                    Log.d("yj-daniel", item.getComment() + "-" + item.getTime() + "-" + item.getShow_id());
                }
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

    private void comment(String comment) {
        ShareService service = new ShareModel().model().create(ShareService.class);
        String showId = getIntent().getStringExtra("show_id");
        String userId = getIntent().getStringExtra("user_id");
        Call<CommentStatusBean> call = service.comment(showId, userId, comment);

        call.enqueue(new Callback<CommentStatusBean>() {
            @Override
            public void onResponse(Response<CommentStatusBean> response) {
                Toast.makeText(context, "评论成功", Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

}
