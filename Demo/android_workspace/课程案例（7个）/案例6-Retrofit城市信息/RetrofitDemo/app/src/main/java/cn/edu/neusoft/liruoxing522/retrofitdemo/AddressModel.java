package cn.edu.neusoft.liruoxing522.retrofitdemo;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by Administrator on 2017/10/11.
 */

public class AddressModel implements AddressIface{
    private Service service;
    private Retrofit retrofit;
    private static final String BASE_URL ="http://gc.ditu.aliyun.com/";

    public AddressModel(){
        retrofit = new Retrofit.Builder().baseUrl(BASE_URL).addConverterFactory(GsonConverterFactory.create()).build();
    }

    @Override
    public void getAddressList(final String address, final AddressListener addressListener) {
        service=retrofit.create(Service.class);
        Call<Address>call=service.getAddress(address);
        call.enqueue(new Callback<Address>() {
            @Override
            public void onResponse(Call<Address> call, Response<Address> response) {
                if (response.isSuccessful()&&response.body()!=null){
                    addressListener.onResponse(response.body());
                }
                else {
                    addressListener.onFail("error");
                }
            }

            @Override
            public void onFailure(Call<Address> call, Throwable t) {

            }
        });
    }
}
