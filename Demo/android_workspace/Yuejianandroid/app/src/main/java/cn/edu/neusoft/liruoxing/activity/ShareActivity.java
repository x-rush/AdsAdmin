package cn.edu.neusoft.liruoxing.activity;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.net.URI;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.bean.StatusBean;
import cn.edu.neusoft.liruoxing.model.ShareModel;
import cn.edu.neusoft.liruoxing.service.ShareService;
import okhttp3.MediaType;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ShareActivity extends AppCompatActivity {
    @BindView(R.id.picPath)
    TextView picPath;
    @BindView(R.id.comment)
    EditText comment;

    Context context = this;

    File selectFile;

    @OnClick({R.id.selectPic, R.id.share})
    public void click(Button view) {
        if (view.getId() == R.id.selectPic) {
            Intent intent = new Intent();
            intent.setAction(Intent.ACTION_GET_CONTENT);
            intent.setType("image/*");
            startActivityForResult(intent, 66);
        } else if (view.getId() == R.id.share) {
            File file = null;
            file = new File("/storage/emulated/0/DCIM/Camera/IMG_20181028_074708.jpg");
            Log.e("TAG", file.getAbsolutePath());
            Log.e("TAG", String.valueOf(file.getTotalSpace()));
            Log.e("TAG", file.getName());
            RequestBody requestBody = RequestBody.create(MediaType.parse("multipart/form-data"), file);

            ShareService service = new ShareModel().model().create(ShareService.class);
            Call<StatusBean> call = service.uploadPic("1", "a1", requestBody);

            call.enqueue(new Callback<StatusBean>() {
                @Override
                public void onResponse(Response<StatusBean> response) {
                    Toast.makeText(context, "上传成功", Toast.LENGTH_LONG).show();
                }

                @Override
                public void onFailure(Throwable t) {
                    Toast.makeText(context, "上传失败", Toast.LENGTH_LONG).show();
                }
            });
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_share);
        ButterKnife.bind(this);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {

        try {
            Uri imageUri = data.getData();
            picPath.setText("已选择图片: " + imageUri.toString());
            selectFile = new File(new URI(imageUri.toString()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
