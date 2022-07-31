package cn.edu.neusoft.liruoxing.activity;

import android.app.FragmentTransaction;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ImageView;
import android.widget.TextView;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.fragment.ClubFragment;
import cn.edu.neusoft.liruoxing.fragment.HomeFragment;
import cn.edu.neusoft.liruoxing.fragment.ShareFragment;
import cn.edu.neusoft.liruoxing.fragment.MineFragment;
import cn.edu.neusoft.liruoxing.fragment.TrainFragment;

public class MainActivity extends AppCompatActivity {
    @BindView(R.id.lianmen)
    ImageView lianmen;
    @BindView(R.id.train)
    ImageView train;
    @BindView(R.id.club)
    ImageView club;
    @BindView(R.id.shaitu)
    ImageView shaitu;
    @BindView(R.id.mine)
    ImageView mine;

    @BindView(R.id.tv_lianmen)
    TextView tv_lianmen;
    @BindView(R.id.tv_train)
    TextView tv_train;
    @BindView(R.id.tv_club)
    TextView tv_club;
    @BindView(R.id.tv_shaitu)
    TextView tv_shaitu;
    @BindView(R.id.tv_mine)
    TextView tv_mine;
    private FragmentTransaction fragmentTransaction;

    @OnClick({R.id.lianmen, R.id.train, R.id.club, R.id.shaitu, R.id.mine})
    public void click(ImageView view) {
        switch (view.getId()) {
            case R.id.lianmen:
                resetStatus();
                lianmen.setBackground(getResources().getDrawable(R.drawable.lianmen1));
                tv_lianmen.setTextColor(Color.parseColor("#EEEE00"));

                fragmentTransaction = getFragmentManager().beginTransaction();
                fragmentTransaction.replace(R.id.fragment_container, new HomeFragment());
                fragmentTransaction.commit();
                break;
            case R.id.train:
                resetStatus();
                train.setBackground(getResources().getDrawable(R.drawable.train1));
                tv_train.setTextColor(Color.parseColor("#EEEE00"));

                fragmentTransaction = getFragmentManager().beginTransaction();
                fragmentTransaction.replace(R.id.fragment_container, new TrainFragment());
                fragmentTransaction.commit();
                break;
            case R.id.club:
                resetStatus();
                club.setBackground(getResources().getDrawable(R.drawable.club1));
                tv_club.setTextColor(Color.parseColor("#EEEE00"));

                fragmentTransaction = getFragmentManager().beginTransaction();
                fragmentTransaction.replace(R.id.fragment_container, new ClubFragment());
                fragmentTransaction.commit();
                break;
            case R.id.shaitu:
                resetStatus();
                shaitu.setBackground(getResources().getDrawable(R.drawable.shaitu1));
                tv_shaitu.setTextColor(Color.parseColor("#EEEE00"));

                fragmentTransaction = getFragmentManager().beginTransaction();
                fragmentTransaction.replace(R.id.fragment_container, new ShareFragment());
                fragmentTransaction.commit();
                break;
            case R.id.mine:
                resetStatus();
                mine.setBackground(getResources().getDrawable(R.drawable.mine1));
                tv_mine.setTextColor(Color.parseColor("#EEEE00"));

                fragmentTransaction = getFragmentManager().beginTransaction();
                fragmentTransaction.replace(R.id.fragment_container, new MineFragment());
                fragmentTransaction.commit();
                break;
        }
    }

    private void resetStatus() {
        lianmen.setBackground(getResources().getDrawable(R.drawable.lianmen));
        train.setBackground(getResources().getDrawable(R.drawable.train));
        club.setBackground(getResources().getDrawable(R.drawable.club));
        shaitu.setBackground(getResources().getDrawable(R.drawable.shaitu));
        mine.setBackground(getResources().getDrawable(R.drawable.mine));

        tv_lianmen.setTextColor(Color.parseColor("#8a8a8a"));
        tv_train.setTextColor(Color.parseColor("#8a8a8a"));
        tv_club.setTextColor(Color.parseColor("#8a8a8a"));
        tv_shaitu.setTextColor(Color.parseColor("#8a8a8a"));
        tv_mine.setTextColor(Color.parseColor("#8a8a8a"));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        ButterKnife.bind(this);

        initStatus();
    }

    private void initStatus() {
        resetStatus();
        lianmen.setBackground(getResources().getDrawable(R.drawable.lianmen1));
        tv_lianmen.setTextColor(Color.parseColor("#EEEE00"));

        fragmentTransaction = getFragmentManager().beginTransaction();
        fragmentTransaction.replace(R.id.fragment_container, new HomeFragment());
        fragmentTransaction.commit();
    }

}