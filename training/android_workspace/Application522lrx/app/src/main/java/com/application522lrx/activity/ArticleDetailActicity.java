package com.application522lrx.activity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.view.menu.ActionMenuItemView;
import android.view.Menu;
import android.view.MenuItem;
import android.webkit.WebView;
import android.widget.Toast;

import com.application522lrx.bean.Constants;
import com.application522lrx.iface.ACollectListener;
import com.application522lrx.model.ACollectModel;
import com.application522lrx.R;


/**
 * Created by Administrator on 2017/6/11.
 */

public class ArticleDetailActicity extends AppCompatActivity {
    private int resid;
    private int userid;
    private Context context;
    private WebView webview;

    private Boolean flagcollect=false;//收藏标志
    private Boolean flagfocus=false;//关注标志
    private ACollectModel collectmodel;//收藏model
    private SharedPreferences sp;//简单存储
    private String sessionID="";  //sessionid
    private SharedPreferences preferences;
    final static String PREF_NAME="loginPref";

    ACollectListener listener=new ACollectListener() {
        @Override
        public void onResponse(String msg) {
            //获取菜单视图
            ActionMenuItemView item=(ActionMenuItemView)findViewById(R.id.menucollect);
            //根据mode中response返回的字符串区分返回结果
            switch (msg)
            {
                case "2": System.out.println("----收藏成功");
                    flagcollect=true;
                    item.setTitle("取消收藏");
                    break;
                case "1":System.out.println("----收藏失败");
                    break;
                case "5":System.out.println("----取消收藏成功");
                    flagcollect=false;
                    item.setTitle("收藏");
                    break;
                case "4":System.out.println("----取消收藏失败");
                    break;
                case "7":System.out.println("----已收藏");
                    flagcollect=true;
                    item.setTitle("取消收藏");
                    break;
                case "8":System.out.println("----未收藏");
                    flagcollect=false;
                    item.setTitle("收藏");
                    break;
                default:
                    Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
            }
        }
        @Override
        public void onFail(String msg) {
            Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
        }
    };
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_article_detail);
        context=ArticleDetailActicity.this;
        Intent intent=getIntent();
        resid=intent.getIntExtra("resid",1);
        userid=intent.getIntExtra("userid",1);

        System.out.println("----=="+resid);

        init();

        webview.loadUrl(Constants.SERVERADDRESS+"article.php/show/index/id/"+resid);

    }

    private void init() {
        webview= (WebView) findViewById(R.id.webview_article);
        sp=context.getSharedPreferences(PREF_NAME,MODE_PRIVATE);
        readSP();//读取sessionid
    }

    private void readSP() {
        sessionID=sp.getString("SessionID","8soafn3tpaj0efuab5jvmpbhr4");
//        Toast.makeText(this,sessionID,Toast.LENGTH_SHORT).show();
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);//加载菜单布局
        collectmodel=new ACollectModel();//实例化对象
        collectmodel.exist("article",resid,sessionID,listener);//判断是否收藏
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId())
        {
            case R.id.menucollect:
                //Toast.makeText(this, "文章收藏", Toast.LENGTH_SHORT).show();
                if(flagcollect)//如果已收藏，则调用取消收藏
                {
                    System.out.println("----准备取消收藏");
                    collectmodel.uncollect("article",resid,sessionID,listener);
                }
                else//如果未收藏，则调用收藏
                {
                    System.out.println("----准备收藏");
                    collectmodel.collect("article",resid,sessionID,listener);
                }
                break;
            case R.id.menufocus:
                //Toast.makeText(this, "文章关注", Toast.LENGTH_SHORT).show();
                if(flagfocus)//如果已关注，则调用取消关注
                {
                    System.out.println("----准备关注");
                }
                else//如果未关注，则调用关注
                {
                    System.out.println("----准备取消关注");
                }
                break;
        }
        return super.onOptionsItemSelected(item);
    }
}
