package com.demo1;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class Main2Activity extends AppCompatActivity {
    TextView tvRecv;
    Button btnSend2;
    EditText etSend;
    Button btnSend22;
    private static String TAG="LIFRCYCLE_Main2Activity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        Log.i(TAG, "onCreate: ");
        tvRecv=(TextView)findViewById(R.id.tvRecv);
        btnSend2=(Button)findViewById(R.id.btnSend2);
        etSend=(EditText)findViewById(R.id.etSend);
        btnSend22 = (Button) findViewById(R.id.btnSend22);

        final Intent intent=getIntent();
        String recvmessage=intent.getStringExtra("message");
        tvRecv.setText(recvmessage);

        btnSend2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String message=etSend.getText().toString();
                Intent intent1=new Intent();
                intent1.putExtra("return",message);
                setResult(RESULT_OK,intent1);
                finish();
            }
        });
        btnSend22.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                Intent intent=new Intent(Main2Activity.this, Main3Activity.class);
                startActivity(intent);
                finish();
            }
        });
    }
    public Main2Activity() {
        super();
    }
    @Override
    protected void onStart() {
        super.onStart();
        Log.i(TAG,"onStart:");
    }

    @Override
    protected void onStop() {
        super.onStop();
        Log.i(TAG, "onStop: ");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.i(TAG, "onDestroy: ");
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.i(TAG, "onPause: ");
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.i(TAG, "onResume: ");
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        Log.i(TAG, "onRestart: ");
    }
}
