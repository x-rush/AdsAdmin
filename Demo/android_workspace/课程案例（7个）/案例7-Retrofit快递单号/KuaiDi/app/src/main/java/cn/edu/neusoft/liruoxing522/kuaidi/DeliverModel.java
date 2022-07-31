package cn.edu.neusoft.liruoxing522.kuaidi;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by Thinkpad on 2017/10/11.
 */

public class DeliverModel implements DeliverIface{
      private Service service;
      private Retrofit retrofit;
      private static final String BASE_URL="http://www.kuaidi100.com/";
      public DeliverModel(){
            retrofit=new Retrofit.Builder().baseUrl(BASE_URL)
                    .addConverterFactory(GsonConverterFactory.create()).build();
      }
      public  void getDeliverlist(final String type, final String postid,
                                  final DeliverListener deliverListener){
            service=retrofit.create(Service.class);
            Call<Deliver> call=service.getAddress(type,postid);
            call.enqueue(new Callback<Deliver>() {
                  @Override
                  public void onResponse(Call<Deliver> call, Response<Deliver> response) {
                        if ( response.isSuccessful()&&response.body()!=null ){
                              deliverListener.onResponse(response.body());
                        }
                        else
                        {
                              deliverListener.onFail("error");
                        }
                  }

                  @Override
                  public void onFailure(Call<Deliver> call, Throwable t) {
                           deliverListener.onFail("error");
                  }
            });


      }


}
