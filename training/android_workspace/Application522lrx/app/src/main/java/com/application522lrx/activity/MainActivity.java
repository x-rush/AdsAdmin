package com.application522lrx.activity;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ImageButton;
import android.widget.LinearLayout;

import com.application522lrx.fragment.ArticleFragment;
import com.application522lrx.fragment.CourseFragment;
import com.application522lrx.fragment.MyFragment;
import com.application522lrx.fragment.NewVideoFragment;
import com.application522lrx.R;

import java.util.ArrayList;
import java.util.List;

//import com.myrecyclerview.fragment.CourseFragment;
//import com.myrecyclerview.fragment.VideoFragment;

public class MainActivity extends AppCompatActivity {
    private LinearLayout layout1,layout2,layout3,layout4;
    private ImageButton ib1,ib2,ib3,ib4;
    private ViewPager vp;
    private List<Fragment> listfragment;
    private FragmentPagerAdapter fpadapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
//        getSupportActionBar().hide();
        init();
        initEvents();
        initFragment();

    }

    View.OnClickListener onClickListener= new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            resetImage();
            switch (v.getId())
            {
                case R.id.layout1:selectTab(0); break;
                case R.id.layout2:selectTab(1); break;
                case R.id.layout3:selectTab(2); break;
                case R.id.layout4:selectTab(3); break;
            }
        }
    };


    private void initFragment() {
        listfragment = new ArrayList<Fragment>();
        listfragment.add(new ArticleFragment());
        listfragment.add(new CourseFragment());
        listfragment.add(new NewVideoFragment());
        listfragment.add(new MyFragment());
        fpadapter= new  FragmentPagerAdapter(getSupportFragmentManager())  {

            @Override
            public int getCount() {
                return listfragment.size();
            }

            @Override
            public Fragment getItem(int position) {
                return listfragment.get(position);
            }
        };

        vp.setAdapter(fpadapter);

        vp.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

            }

            @Override
            public void onPageSelected(int position) {
                vp.setCurrentItem(position);
                resetImage();
                selectTab(position);
            }

            @Override
            public void onPageScrollStateChanged(int state) {

            }
        });

    }

    private  void resetImage()
    {
        ib1.setImageResource(R.drawable.weixin_normal);
        ib2.setImageResource(R.drawable.friend_normal);
        ib3.setImageResource(R.drawable.address_normal);
        ib4.setImageResource(R.drawable.settings_normal);
    }

    private void selectTab(int i)
    {
        switch (i)
        {
            case 0:
                ib1.setImageResource(R.drawable.weixin_pressed);
                break;
            case 1:ib2.setImageResource(R.drawable.friend_pressed);
                break;
            case 2:ib3.setImageResource(R.drawable.address_pressed);
                break;
            case 3:ib4.setImageResource(R.drawable.settings_pressed);
                break;
        }
        vp.setCurrentItem(i);
    }

    private void initEvents() {
        layout1.setOnClickListener(onClickListener);
        layout2.setOnClickListener(onClickListener);
        layout3.setOnClickListener(onClickListener);
        layout4.setOnClickListener(onClickListener);
    }

    private void init() {
        layout1=(LinearLayout) findViewById(R.id.layout1);
        layout2=(LinearLayout)findViewById(R.id.layout2);
        layout3=(LinearLayout)findViewById(R.id.layout3);
        layout4=(LinearLayout)findViewById(R.id.layout4);
        ib1=(ImageButton)findViewById(R.id.imageButton1);
        ib2=(ImageButton)findViewById(R.id.imageButton2);
        ib3=(ImageButton)findViewById(R.id.imageButton3);
        ib4=(ImageButton)findViewById(R.id.imageButton4);
        vp=(ViewPager)findViewById(R.id.viewPager);
    }
}

