package cn.edu.neusoft.liruoxing.fragment;

import android.annotation.TargetApi;
import android.app.Fragment;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.edu.neusoft.liruoxing.R;
import cn.edu.neusoft.liruoxing.activity.ShareActivity;
import cn.edu.neusoft.liruoxing.adapter.ShareAdapter;
import cn.edu.neusoft.liruoxing.bean.OwnShowBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.model.ShareModel;

import static android.content.Context.MODE_PRIVATE;

@TargetApi(Build.VERSION_CODES.HONEYCOMB)
public class ShareFragment extends Fragment implements RetrofitListener<OwnShowBean> {

    @BindView(R.id.list_share)
    RecyclerView list_share;

    @OnClick(R.id.btn_share_pic)
    public void share(Button view) {
        view.getContext().startActivity(new Intent(view.getContext(), ShareActivity.class));
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_share, container, false);
        ButterKnife.bind(this, root);
        setView();
        initData();
        return root;
    }

    private void initData() {
        ShareModel model = new ShareModel();
        SharedPreferences sp = getContext().getSharedPreferences("yj", MODE_PRIVATE);
        String userId = sp.getString("id", "0");
        model.getOwnShowList(this, userId);
    }

    private void setView() {
        list_share.setLayoutManager(new LinearLayoutManager(this.getContext(), LinearLayoutManager.VERTICAL, false));

//        share_spinner.setOnItemSelectedListener(new Spinner.OnItemSelectedListener() {
//            @Override
//            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
//      String item = share_spinner.getSelectedItem().toString();
//        if (item.equals("晒图")) {
//                    adapter.updateData(getData1());
//                } else if (item.equals("今日晒图")) {
//                    adapter.updateData(getData2());
//                } else if (item.equals("最近三天")) {
//                    adapter.updateData(getData3());
//                } else if (item.equals("最多评论")) {
//                    adapter.updateData(getData4());
//                }
//            }

//            @Override
//            public void onNothingSelected(AdapterView<?> parent) {
//
//            }
//        });
//    }

//    @Override
//    public void onSuccess(OwnShowBean ownShowBean, int flag) {
//
//    }
//
//    @Override
//    public void onFail(String msg) {
//
//    }
    }

    @Override
    public void onSuccess(OwnShowBean ownShowBean, int flag) {
        list_share.setAdapter(new ShareAdapter(ownShowBean));
    }

    @Override
    public void onFail(String msg) {

    }
}
