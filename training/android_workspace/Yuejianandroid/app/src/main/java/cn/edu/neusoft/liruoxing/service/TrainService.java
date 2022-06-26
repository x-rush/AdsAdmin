package cn.edu.neusoft.liruoxing.service;

import cn.edu.neusoft.liruoxing.bean.StatusBean;
import cn.edu.neusoft.liruoxing.bean.TrainBean;
import cn.edu.neusoft.liruoxing.bean.TrainDetailBean;
import cn.edu.neusoft.liruoxing.bean.TrainOrderBean;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;


public interface TrainService {
    @GET("train/trainList")
    Call<TrainBean> getTrainList();

    @GET("train/trainListByType/type/{type}")
    Call<TrainBean> getTrainListByType(@Path("type") String type);

    @GET("train/trainDetail/train_id/{train_id}")
    Call<TrainDetailBean> getTrainDetail(@Path("train_id") String trainId);

    @GET("Train/enroll/user_id/{user_id}/train_id/{train_id}/num/{num}")
    Call<StatusBean> enroll(@Path("user_id") String user_id, @Path("train_id") String trainId, @Path("num") String num);

    @GET("Train/trainOrder/user_id/{user_id}")
    Call<TrainOrderBean> trainOrder(@Path("user_id") String user_id);
}
