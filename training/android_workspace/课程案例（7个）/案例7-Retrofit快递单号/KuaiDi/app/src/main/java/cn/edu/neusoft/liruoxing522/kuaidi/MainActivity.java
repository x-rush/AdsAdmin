package cn.edu.neusoft.liruoxing522.kuaidi;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.List;

public class MainActivity extends AppCompatActivity {
    EditText et_type;
    EditText et_num;
    TextView tv_type;
    TextView tv_context;
    TextView tv_message;
    Button btn_search;
    DeliverListener deliverListener=new DeliverListener() {
        @Override
        public void onResponse(Deliver deliver) {
            String xinxi=deliver.getMessage();
            String laiziyu=deliver.getCom();
            String context=deliver.getData().get(0).getContext();
            tv_message.setText(xinxi);
            tv_type.setText(laiziyu);
            tv_context.setText(context);
        }

        @Override
        public void onFail(String msg) {

        }
    };
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        et_type=(EditText)findViewById(R.id.et_type);
        et_num=(EditText)findViewById(R.id.et_num);
        tv_context=(TextView)findViewById(R.id.tv_context);
        tv_type=(TextView)findViewById(R.id.tv_type);
        tv_message=(TextView)findViewById(R.id.tv_message);
        btn_search=(Button)findViewById(R.id.btn_search);

        btn_search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String type=et_type.getText().toString();
                String number=et_num.getText().toString();
                DeliverModel deliverModel=new DeliverModel();
                deliverModel.getDeliverlist(type,number,deliverListener);
            }
        });
    }
}