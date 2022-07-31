package cn.edu.neusoft.liruoxing.activity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.Toast;

import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;

public class MineSettingActivity extends AppCompatActivity {
    @OnClick({R.id.btn_clean, R.id.btn_share_social, R.id.btn_feedback, R.id.btn_login_out})
    public void click(Button view) {
        if (view.getId() == R.id.btn_clean) {
            Toast.makeText(this, "清理缓存成功", Toast.LENGTH_LONG).show();
        } else if (view.getId() == R.id.btn_share_social) {

        } else if (view.getId() == R.id.btn_feedback) {
            startActivity(new Intent(this, FeedBackActivity.class));
        } else if (view.getId() == R.id.btn_login_out) {
            startActivity(new Intent(this, LoginActivity.class));
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mine_setting);
        ButterKnife.bind(this);
    }
}
