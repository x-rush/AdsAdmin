package cn.edu.neusoft.liruoxing.model;

import cn.edu.neusoft.liruoxing.bean.RegisterBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.service.RegisterService;
import retrofit2.Call;
import retrofit2.GsonConverterFactory;
import retrofit2.Retrofit;

public class RegisterModel {
    private Retrofit retrofit1;

    public RegisterModel() {
        retrofit1 = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    public void register(final RetrofitListener listener,String phone,String password,String username) {
        RegisterService service = retrofit1.create(RegisterService.class);
        Call<RegisterBean> call = service.register(phone,password,username);
        call.enqueue(new retrofit2.Callback<RegisterBean>() {
            @Override
            public void onResponse(retrofit2.Response<RegisterBean> response) {
                listener.onSuccess(response.body(), 1);
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }

}
