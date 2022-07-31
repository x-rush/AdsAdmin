package com.application522lrx.activity;

import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.os.Environment;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

import com.joanzapata.pdfview.PDFView;
import com.joanzapata.pdfview.listener.OnPageChangeListener;
import com.application522lrx.iface.HttpCallBack;
import com.application522lrx.service.DownloadService;
import com.application522lrx.R;

import java.io.File;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;
import retrofit2.converter.scalars.ScalarsConverterFactory;

public class ViewTwareActivity extends AppCompatActivity implements OnPageChangeListener {

    private String name="";
    private String attach="";
    private PDFView pdfView;
    private TextView tvinfo,tvpage;

    private String BASEURL ="http://amicool.neusoft.edu.cn/";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_tware);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);//设置屏幕方向为横向
        System.out.println("----查看课件详情");

        init();

        attach=getIntent().getStringExtra("pdfattach");
        name=getIntent().getStringExtra("name");
        System.out.println("----pdf地址："+attach);
        System.out.println("----pdf完整地址："+BASEURL+"/Uploads/"+attach);

        downloadfile();//下载文件

    }

    private void init() {
        tvinfo=(TextView)findViewById(R.id.textView10);
        tvpage=(TextView)findViewById(R.id.textView11);
        pdfView=(PDFView)findViewById(R.id.pdfview);
    }

    private void downloadfile() {
        String downloadUrl = "/Uploads/"+attach;    //补全pdf文件相对地址
        //定义Retrofit
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASEURL)
                .addConverterFactory(ScalarsConverterFactory.create())
                .addConverterFactory(GsonConverterFactory.create())
                .build();
//定义service
        DownloadService downloadService = retrofit.create(DownloadService.class);
//定义call
        Call<ResponseBody> responseBodyCall = downloadService.downloadFile(downloadUrl);
        responseBodyCall.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, final Response<ResponseBody> response) {
                System.out.println("----"+response.message()+" length "+response.body().contentLength()+" type "+response.body().contentType());
                //建立一个文件
                final File file = FileUtils4download.createFile(ViewTwareActivity.this,name);
                //下载文件放在子线程
                new Thread(){
                    @Override
                    public void run() {
                        super.run();
                        //保存到本地
                        FileUtils4download.writeFile2Disk(response, file, new HttpCallBack() {
                            @Override
                            public void onLoading(final long current, final long total) {
                                /**更新进度条*/
                                runOnUiThread(new Runnable() {
                                    @Override
                                    public void run() {

                                        tvinfo.setText(current+"");//当前进度
                                        System.out.println("----"+current+"--totale:"+total);

                                        if(current==total)  //如果达到最大值
                                        {
                                            tvinfo.setText("下载完成");
                                            tvinfo.setVisibility(View.GONE);//不可见
                                            String state = Environment.getExternalStorageState();
                                            String pdfName="";
                                            if(state.equals(Environment.MEDIA_MOUNTED)){
                                                pdfName=Environment.getExternalStorageDirectory().getAbsolutePath()+"/zyfypt-temp/"+name+".pdf";
                                            }
                                            else pdfName=getCacheDir().getAbsolutePath()+"/zyfypt-temp/"+name+".pdf";

                                            display(pdfName, false);
                                        }
                                    }
                                });
                            }
                        });
                    }
                }.start();
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                t.printStackTrace();
            }
        });
    }

    @Override
    public void onPageChanged(int page, int pageCount) {
        tvpage.setText(page + "/" + pageCount);
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
    }

    private void display(String assetFileName, boolean jumpToFirstPage) {
        if (jumpToFirstPage)
            setTitle(assetFileName);
        File file = new File(assetFileName);
        pdfView.fromFile(file)
                //.pages(0, 0, 0, 0, 0, 0) // 默认全部显示，pages属性可以过滤性显示
                .defaultPage(1)//默认展示第一页
                .onPageChange(this)//监听页面切换
                .load();
    }
}


