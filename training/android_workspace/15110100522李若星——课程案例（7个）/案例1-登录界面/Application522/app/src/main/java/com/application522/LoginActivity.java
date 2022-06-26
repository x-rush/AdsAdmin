package com.application522;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class LoginActivity extends AppCompatActivity {
    TextView textView2;
    Button button2;
    EditText editText;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        textView2=(TextView)findViewById(R.id.textView2);
        button2=(Button)findViewById(R.id.button2);
        editText=(EditText)findViewById(R.id.editText);

        final Intent intent=getIntent();
        String recvmessage=intent.getStringExtra("message");
        textView2.setText(recvmessage);
        Toast.makeText(LoginActivity.this, recvmessage, Toast.LENGTH_SHORT).show();

        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String message=editText.getText().toString();
                Intent intent1=new Intent();
                intent1.putExtra("return",message);
                setResult(RESULT_OK,intent1);
                finish();
            }
        });
    }
}
