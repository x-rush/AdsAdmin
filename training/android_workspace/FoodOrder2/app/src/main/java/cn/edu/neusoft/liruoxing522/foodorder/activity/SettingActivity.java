package cn.edu.neusoft.liruoxing522.foodorder.activity;

import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.widget.Button;

import cn.edu.neusoft.liruoxing522.foodorder.R;

/**
 * Created by www44 on 2017/12/4.
 */

public class SettingActivity extends BaseActivity {
    private Button btn_back,btn_logout,btn_userchange,btn_feedback;

    @Override
    void initView() {
        setLayout_file(R.layout.activity_setting);
        getSupportActionBar().hide();
        btn_back= (Button) findViewById(R.id.button_back);
        btn_feedback= (Button) findViewById(R.id.btn_feedback);
        btn_logout= (Button) findViewById(R.id.btn_logout);
        btn_userchange= (Button) findViewById(R.id.btn_userchange);

    }

    @Override
    void initEvent() {

        btn_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        btn_feedback.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                Intent data=new Intent(Intent.ACTION_SENDTO);
//                data.setType("text/plain"); //模拟器请使用这行
//                data.setData(Uri.parse("mailto:446634431@qq.com"));
//                startActivity(Intent.createChooser(data,
//                        "Select email application."));
                Intent intent = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:18041162110"));
                startActivity(intent);
            }
        });

        btn_logout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
                restartApplication();

            }
        });
        btn_userchange.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent1=new Intent(SettingActivity.this,ChangeInfoActivity.class);
                startActivity(intent1);
            }
        });
    }

    @Override
    void initData() {

    }
    private void restartApplication() {
        final Intent intent1 = getPackageManager().getLaunchIntentForPackage(getPackageName());
        intent1.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(intent1);
    }
}
