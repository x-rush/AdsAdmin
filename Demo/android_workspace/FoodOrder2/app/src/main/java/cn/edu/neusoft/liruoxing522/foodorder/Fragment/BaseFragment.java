package cn.edu.neusoft.liruoxing522.foodorder.Fragment;


import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import cn.edu.neusoft.liruoxing522.foodorder.R;

/**
 * A simple {@link Fragment} subclass.
 */
public abstract class BaseFragment extends Fragment {

    protected int layout_file=R.layout.fragment_shop;
    public View view;
    abstract void initLayout();
    abstract void initView();
    abstract void initEvent();
    abstract void initData();

    public void setLayout_file(int layout_file){
        this.layout_file=layout_file;
    }

    public int getLayout_file() {
        return layout_file;
    }

    public BaseFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        initLayout();
        view = inflater.inflate(getLayout_file(),container,false);//解析布局文件
        initView();
        initEvent();
        initData();
        return view;
    }

    //获取保存的用户名
    public String getUser_name(){
        SharedPreferences sp;
        sp = getActivity().getSharedPreferences("userInfo", Context.MODE_PRIVATE);
        return sp.getString("username","");
    }
    public String getUser_id(){
        SharedPreferences sp;
        sp = getActivity().getSharedPreferences("userInfo", Context.MODE_PRIVATE);
        return sp.getString("id","");
    }
}
