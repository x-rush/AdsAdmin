package cn.edu.neusoft.liruoxing522.retrofitdemo;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    EditText et_city;
    Button btn_search;
    TextView tv_jingdu;
    TextView tv_weidu;
    TextView tv_level;
    AddressListener addressListener=new AddressListener() {
        @Override
        public void onResponse(Address address) {
            String jingdu=address.getLon();
            String weidu=address.getLat();
            String level=address.getLevel();
            tv_jingdu.setText(jingdu);
            tv_weidu.setText(weidu);
            tv_level.setText(level);

        }

        @Override
        public void onFail(String msg) {

        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        et_city=(EditText)findViewById(R.id.et_city);
        btn_search=(Button)findViewById(R.id.btn_search);
        tv_jingdu=(TextView)findViewById(R.id.tv_jingdu);
        tv_weidu=(TextView)findViewById(R.id.tv_weidu);
        tv_level=(TextView)findViewById(R.id.tv_level);

        btn_search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String address=et_city.getText().toString();
                AddressModel addressModel=new AddressModel();
                addressModel.getAddressList(address,addressListener);
            }
        });
    }
}
