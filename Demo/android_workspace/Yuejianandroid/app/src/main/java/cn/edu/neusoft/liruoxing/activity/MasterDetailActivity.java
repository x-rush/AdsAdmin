package cn.edu.neusoft.liruoxing.activity;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.bumptech.glide.Glide;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.adapter.CommentAdapter;
import cn.edu.neusoft.liruoxing.myapplication.MyApplication;
import cn.edu.neusoft.liruoxing.bean.CommentBean;
import cn.edu.neusoft.liruoxing.bean.MasterBean;
import cn.edu.neusoft.liruoxing.bean.MasterDetailBean;
import cn.edu.neusoft.liruoxing.bean.StatusBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.model.MasterModel;
import cn.edu.neusoft.liruoxing.service.MasterService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MasterDetailActivity extends AppCompatActivity implements RetrofitListener<MasterDetailBean> {
    @BindView(R.id.title)
    TextView title;
    @BindView(R.id.btn_care)
    Button btn_care;
    @BindView(R.id.detail_image)
    ImageView detail_image;
    @BindView(R.id.content)
    TextView content;
    @BindView(R.id.list_comment)
    RecyclerView list_comment;

    Context context = this;

    @OnClick({R.id.btn_care})
    public void care() {
        String user_id = getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0");
        String master_id = String.valueOf(getIntent().getIntExtra("id", 0));

        if (btn_care.getText().toString().equals("取消关注")) {
            cancelCareMaster(user_id, master_id);
        } else if (btn_care.getText().toString().equals("点击关注")) {
            careMaster(user_id, master_id);
        }

    }

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
                        String user_id = getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0");
                        String master_id = String.valueOf(getIntent().getIntExtra("id", 0));
                        comment(et.getText().toString(), master_id, user_id);
                    }
                }).setNegativeButton("取消", null).show();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_master);
        getSupportActionBar().hide();
        ButterKnife.bind(this);
        initView();
        initData();
        String user_id = getSharedPreferences("yj", MODE_PRIVATE).getString("id", "0");
        String master_id = String.valueOf(getIntent().getIntExtra("id", 0));
        isFocus(user_id, master_id);
    }

    private void initView() {
        list_comment.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
    }

    private void initData() {
        Intent intent = getIntent();
        String id = intent.getIntExtra("id", 0) + "";
        MasterModel model = new MasterModel();
        model.getMasterDetail(id, this);
    }

    @Override
    public void onSuccess(MasterDetailBean masterDetailBean, int flag) {
        title.setText("权威大师姓名: " + masterDetailBean.getData().getMaster_name());
        Glide.with(MyApplication.getAppContext())
                .load(MyApplication.getImagePath() + masterDetailBean.getData().getMaster_avatar())
                .into(detail_image);
        content.setText("介绍: " + masterDetailBean.getData().getIntro() +
                "\n地址: " + masterDetailBean.getData().getAddress() +
                "\n收藏数: " + masterDetailBean.getData().getZans());

        list_comment.setAdapter(new CommentAdapter(masterDetailBean.getData()));
    }

    @Override
    public void onFail(String msg) {

    }

    private void comment(String comment_content, String masterId, String userId) {
        MasterService masterService = new MasterModel().model().create(MasterService.class);
        Call<CommentBean> call = masterService.comment(comment_content, masterId, userId);

        call.enqueue(new Callback<CommentBean>() {
            @Override
            public void onResponse(Response<CommentBean> response) {
                if (response.body().getStatus() == 1)
                    Toast.makeText(getApplicationContext(), response.body().getMessage(), Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Throwable t) {
            }
        });
    }

    private void careMaster(String userId, String masterId) {
        MasterService masterService = new MasterModel().model().create(MasterService.class);
        Call<StatusBean> call = masterService.careMaster(userId, masterId);

        call.enqueue(new Callback<StatusBean>() {
            @Override
            public void onResponse(Response<StatusBean> response) {
                btn_care.setText("取消关注");
                Toast.makeText(context, "关注成功", Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

    private void cancelCareMaster(String userId, String masterId) {
        MasterService masterService = new MasterModel().model().create(MasterService.class);
        Call<StatusBean> call = masterService.cancelCareMaster(userId, masterId);

        call.enqueue(new Callback<StatusBean>() {
            @Override
            public void onResponse(Response<StatusBean> response) {
                btn_care.setText("点击关注");
                Toast.makeText(context, "取消成功", Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

    private void isFocus(String userId, final String masterId) {
        MasterService masterService = new MasterModel().model().create(MasterService.class);
        Call<MasterBean> call = masterService.careMasterList(userId);

        call.enqueue(new Callback<MasterBean>() {
            @Override
            public void onResponse(Response<MasterBean> response) {
                for (int i = 0; i < response.body().getData().size(); i++) {
                    if (masterId.equals(response.body().getData().get(i).getId() + "")) {
                        btn_care.setText("取消关注");
                    }
                }
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });
    }

}
