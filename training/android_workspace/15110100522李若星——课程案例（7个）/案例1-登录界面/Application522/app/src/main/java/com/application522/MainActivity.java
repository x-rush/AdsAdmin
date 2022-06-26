package com.application522;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    TextView textView;
    Button button2;
    EditText editText;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        textView = (TextView) findViewById(R.id.textView);
        button2 = (Button) findViewById(R.id.button2);
        editText=(EditText)findViewById(R.id.editText);

        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String message = textView.getText().toString();
                Intent intent = new Intent(MainActivity.this, LoginActivity.class);
                intent.putExtra("message", message);
                startActivityForResult(intent, 1);//1是requestcode
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
                    editText.setText(string);
                }
                break;
        }
    }

}
