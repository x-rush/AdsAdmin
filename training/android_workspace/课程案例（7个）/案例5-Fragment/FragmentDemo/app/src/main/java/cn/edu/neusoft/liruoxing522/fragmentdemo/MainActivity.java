package cn.edu.neusoft.liruoxing522.fragmentdemo;

import android.net.Uri;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;

public class MainActivity extends AppCompatActivity implements View.OnClickListener,
        FavorFragment.OnFragmentInteractionListener,
        ShouyeFragment.OnFragmentInteractionListener,
        SearchFragment.OnFragmentInteractionListener,
        MyFragment.OnFragmentInteractionListener{

    LinearLayout tab_favor;
    LinearLayout tab_shouye;
    LinearLayout tab_serach;
    LinearLayout tab_my;
    ImageView img_favor ;
    ImageView img_shouye;
    ImageView img_serach;
    ImageView img_my;
    Fragment fragment_favor;
    Fragment fragment_shouye;
    SearchFragment fragment_serach;
    MyFragment fragment_my;
    FragmentManager fragmentManager;
    FragmentTransaction fragmentTransaction;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        initView();
        initEvent();
        setSelect(0);
    }
    private void initView(){
        tab_favor=(LinearLayout)findViewById(R.id.tab_favor);
        tab_shouye=(LinearLayout)findViewById(R.id.tab_shouye);
        tab_serach=(LinearLayout)findViewById(R.id.tab_serach);
        tab_my=(LinearLayout)findViewById(R.id.tab_my);

        img_favor=(ImageView)findViewById(R.id.img_favor);
        img_shouye=(ImageView)findViewById(R.id.img_shouye);
        img_serach=(ImageView)findViewById(R.id.img_serach);
        img_my=(ImageView)findViewById(R.id.img_my);

    }
    private void initEvent(){
        tab_favor.setOnClickListener(this);
        tab_shouye.setOnClickListener(this);
        tab_serach.setOnClickListener(this);
        tab_my.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        //所有图片置成normal的那张
        resetImage();
        //选择哪个 哪个fragment显示出来 图片高亮
        switch (view.getId()){
            case R.id.tab_favor:setSelect(0);
                break;
            case R.id.tab_shouye:setSelect(1);
                break;
            case  R.id.tab_serach:
                setSelect(2);
                break;
            case  R.id.tab_my:
                setSelect(3);
                break;
                default:break;

        }
    }
    private void resetImage(){
        img_favor.setImageResource(R.drawable.ic_favor_nomal);
        img_shouye.setImageResource(R.drawable.ic_shouye_normal);
        img_serach.setImageResource(R.drawable.ic_serach_nomal);
        img_my.setImageResource(R.drawable.ic_my_nomal);
    }
    private void setSelect(int i){
        resetImage();
        fragmentManager=getSupportFragmentManager();
        fragmentTransaction=fragmentManager.beginTransaction();
        hideFragment(fragmentTransaction);
        switch (i){
            case 0:
                if (fragment_favor==null){
                    fragment_favor=new FavorFragment();
                    fragmentTransaction.add(R.id.content,fragment_favor);
                }
                else{
                    fragmentTransaction.show(fragment_favor);
                }
                img_favor.setImageResource(R.drawable.ic_favor_press);
                break;
            case 1:
                if (fragment_shouye==null){
                    fragment_shouye=new ShouyeFragment();
                    fragmentTransaction.add(R.id.content,fragment_shouye);
                }
                else{
                    fragmentTransaction.show(fragment_shouye);
                }
                img_shouye.setImageResource(R.drawable.ic_shouye_press);
                break;
            case 2:
                if (fragment_serach==null){
                    fragment_serach=new SearchFragment();
                    fragmentTransaction.add(R.id.content,fragment_serach);
                }
                else {
                    fragmentTransaction.show(fragment_serach);
                }
                img_serach.setImageResource(
                        R.drawable.ic_serach_press
                );
                break;
            case 3:
                if (fragment_my==null){
                    fragment_my=new MyFragment();
                    fragmentTransaction.add(R.id.content,fragment_my);
                }
                else {
                    fragmentTransaction.show(fragment_my);
                }
                img_my.setImageResource(
                        R.drawable.ic_my_press
                );
                break;
            default:
                break;
        }
        fragmentTransaction.commit();
    }

    @Override
    public void onFragmentInteraction(Uri uri) {

    }
    private void hideFragment(FragmentTransaction fragmentTransaction){
        if(fragment_favor!=null){
            fragmentTransaction.hide(fragment_favor);
        }
        if (fragment_shouye!=null){
            fragmentTransaction.hide(fragment_shouye);
        }
        if(fragment_serach !=null){
            fragmentTransaction.hide(fragment_serach);
        }
        if(fragment_my !=null){
            fragmentTransaction.hide(fragment_my);
        }
    }
}
