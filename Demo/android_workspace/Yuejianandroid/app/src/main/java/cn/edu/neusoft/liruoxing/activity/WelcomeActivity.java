package cn.edu.neusoft.liruoxing.activity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.support.v7.app.AppCompatActivity;
import android.widget.Button;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;

public class WelcomeActivity extends AppCompatActivity {
    @BindView(R.id.skip)
    Button skipBtn;

    @OnClick(R.id.skip)
    public void skip() {
        startActivity(new Intent(this, LoginActivity.class));
    }

    Context context = this;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_welcome);
        ButterKnife.bind(this);

        new CountDownTimer(5000, 1000) {

            public void onTick(long millisUntilFinished) {
                skipBtn.setText("还有" + millisUntilFinished / 1000 + "秒");
            }

            public void onFinish() {
                skipBtn.setText("还有0秒");
                startActivity(new Intent(context, LoginActivity.class));
            }
        }.start();

    }
}
