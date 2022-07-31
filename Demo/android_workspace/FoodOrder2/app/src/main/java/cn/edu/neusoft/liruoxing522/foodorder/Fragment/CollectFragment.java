package cn.edu.neusoft.liruoxing522.foodorder.Fragment;

import android.content.Context;
import android.graphics.Color;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.widget.TextView;

import cn.edu.neusoft.liruoxing522.foodorder.R;

/**
 * Created by www44 on 2017/11/20.
 */

public class CollectFragment extends BaseFragment {

    private TextView tvinfo;
    //    private View view=null;
    private Context context;

    private PagerSlidingTabStrip pagersliding;
    private ViewPager viewpager;

    private Collect_one_Fragment fragment31=null;
    private Collect_two_Fragment fragment32=null;

    //获取当前屏幕的密度
    private DisplayMetrics dm;

    @Nullable
    @Override
    void initLayout() {
        setLayout_file(R.layout.fragment_collect);
    }

    @Override
    void initView() {
        dm = getResources().getDisplayMetrics();//获取屏幕密度

        viewpager=(ViewPager)view.findViewById(R.id.viewPager);
        /*需要管理相互独立的并且隶属于Activity的Fragment使用FragmentManager（），
        而在Fragment中动态的添加Fragment要使用getChildFragmetManager（）来管理。*/
        viewpager.setAdapter(new CollectPageAdapter(getChildFragmentManager()));

        pagersliding=(PagerSlidingTabStrip) view.findViewById(R.id.pagerslidingtabstrip);
        pagersliding.setViewPager(viewpager);
        setpagerstyle();//设置PagerSlidingTabStrip显示效果
    }

    @Override
    void initEvent() {

    }
    @Override
    void initData() {

    }
    public CollectFragment(){

    }
    private void setpagerstyle() {
        // 设置Tab是自动填充满屏幕的
        pagersliding.setShouldExpand(true);
        // 设置Tab的分割线是透明的
        pagersliding.setDividerColor(Color.TRANSPARENT);
        // 设置Tab底部线的高度
        pagersliding.setUnderlineHeight((int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 1, dm));
        // 设置Tab Indicator的高度
        pagersliding.setIndicatorHeight((int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 4, dm));
        // 设置Tab标题文字的大小
        pagersliding.setTextSize((int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_SP, 16, dm));
        // 设置Tab Indicator的颜色
        pagersliding.setIndicatorColor(Color.parseColor("#45c01a"));
        // 设置选中Tab文字的颜色 (这是自定义的一个方法)
        pagersliding.setSelectedTextColor(Color.parseColor("#45c01a"));
        // 取消点击Tab时的背景色
        pagersliding.setTabBackground(0);
    }

    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        void onFragmentInteraction(Uri uri);
    }

    private class CollectPageAdapter extends FragmentPagerAdapter {
        private String[] titles={"店铺","菜品"};//显示在二级导航上的标题文字
        public CollectPageAdapter(FragmentManager fm)
        {
            super(fm);
        }

        @Override
        public CharSequence getPageTitle(int position) {
            return titles[position];//确定选择当页导航上文字
        }
        @Override
        public int getCount() {
            return titles.length;//二级导航个数
        }

        @Override
        public Fragment getItem(int position) {
            //根据位置返回具体某个导航上对应的Fragment
            switch (position)
            {
                case 0:
                    if(fragment31==null)
                    {
                        fragment31=new Collect_one_Fragment();
                    }
                    return fragment31;
                case 1:
                    if(fragment32==null)
                    {
                        fragment32=new Collect_two_Fragment();
                    }
                    return fragment32;
                default:
                    return null;
            }
        }
    }
}
