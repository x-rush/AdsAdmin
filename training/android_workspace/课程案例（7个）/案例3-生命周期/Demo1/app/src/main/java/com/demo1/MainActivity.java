package com.demo1;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    TextView tvSend;
    Button btnSend1;
    private static String TAG="LIFRCYCLE_MainActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Log.i(TAG, "onCreate: ");
        tvSend = (TextView) findViewById(R.id.tvSend);
        btnSend1 = (Button) findViewById(R.id.btnSend1);

        btnSend1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String message = tvSend.getText().toString();
                Intent intent = new Intent(MainActivity.this, Main2Activity.class);
                intent.putExtra("message", message);
                startActivityForResult(intent,1);//1是requestcode
            }
        });
    }
    @Override
    protected  void onActivityResult(int requestCode,int resultCode,Intent data){
    super.onActivityResult(requestCode,resultCode,data);
    switch(requestCode) {
        case 1:
            if (resultCode == RESULT_OK) {
                String string = data.getStringExtra("return");
                Toast.makeText(MainActivity.this, string, Toast.LENGTH_SHORT).show();
            }
            break;
    }
    }

    public MainActivity() {
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
