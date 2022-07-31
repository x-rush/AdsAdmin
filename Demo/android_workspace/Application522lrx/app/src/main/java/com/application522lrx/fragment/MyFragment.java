package com.application522lrx.fragment;

import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.RecyclerView;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.application522lrx.R;


/**
 * Created by Administrator on 2017/5/23.
 */


public class MyFragment extends Fragment {
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private View view=null;
    private Context context;
    private ViewPager viewpager;
    private PagerSlidingTabStrip pagersliding;
    private CollectArticleFragment collectArticleFragment=null;
    private CollectVideoFragment collectVideoFragment=null;
    //获取当前屏幕的密度
    private DisplayMetrics dm;
    @android.support.annotation.Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @android.support.annotation.Nullable ViewGroup container, @android.support.annotation.Nullable Bundle savedInstanceState) {

        view=inflater.inflate(R.layout.myfragment,container,false);
        context=getActivity();

        initRecyclerView();
        return view;
    }

    private void initRecyclerView() {
        dm = getResources().getDisplayMetrics();//获取屏幕密度
        viewpager=(ViewPager)view.findViewById(R.id.viewPager);
        viewpager.setAdapter(new MyPagerAdapter(getChildFragmentManager()));
        pagersliding=(PagerSlidingTabStrip) view.findViewById(R.id.pagerslidingtabstrip);
        pagersliding.setViewPager(viewpager);
        setpagerstyle();//设置PagerSlidingTabStrip显示效果
    }
    private void setpagerstyle() {
        pagersliding.setShouldExpand(true); // 设置Tab是自动填充满屏幕的
        pagersliding.setDividerColor(Color.TRANSPARENT); // 设置Tab的分割线是透明的
        // 设置Tab底部线的高度
        pagersliding.setUnderlineHeight((int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 1, dm));
        // 设置Tab Indicator的高度
        pagersliding.setIndicatorHeight((int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 4, dm));
        // 设置Tab标题文字的大小
        pagersliding.setTextSize((int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_SP, 16, dm));
        pagersliding.setIndicatorColor(Color.parseColor("#45c01a"));// 设置Tab Indicator的颜色
        // 设置选中Tab文字的颜色 (这是自定义的一个方法)
        pagersliding.setSelectedTextColor(Color.parseColor("#45c01a"));
        pagersliding.setTabBackground(0); // 取消点击Tab时的背景色
    }


    private class MyPagerAdapter extends FragmentPagerAdapter {
        private String[] titles={"文章","视频"};//显示在二级导航上的标题文字

        public MyPagerAdapter(android.support.v4.app.FragmentManager fm) {
            super(fm);
        }

        @Override
        public CharSequence getPageTitle(int position) {
            return titles[position];//确定当页导航上文字
        }

        @Override
        public Fragment getItem(int position) { //根据位置返回具体某个导航上对应的Fragment
            switch (position)
            {   case 0:
                if(collectArticleFragment==null)  { collectArticleFragment=new CollectArticleFragment();}
                return collectArticleFragment;
                case 1:
                if(collectVideoFragment==null)  { collectVideoFragment=new CollectVideoFragment();}
                return collectVideoFragment;

                default: return null;
            }
        }

        @Override
        public int getCount() {
            return titles.length;//二级导航个数
        }
    }
}
