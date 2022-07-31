package cn.edu.neusoft.liruoxing522.foodorder.Service;


import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.bean.FoodDetailBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.FoodListBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.GetCollectBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.IsCollectBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.LoginBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.OrderOrCommentBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.PurchaseBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.RegisterBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.ShopListBean;
import cn.edu.neusoft.liruoxing522.foodorder.bean.UserBean;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

/**
 * Created by MSI on 2017/11/1.
 */

public interface Service {
    @GET("userLogin.do")
    Call<LoginBean> getAddress(@Query("username") String username, @Query("userpass") String userpass);
    @GET("userRegister.do")
    Call<RegisterBean>
    getRegmessage(@Query("username") String username,
             @Query("userpass") String userpass,
             @Query("mobilenum") String mobilenum,
             @Query("address") String address,
             @Query("comment") String comment);
    @GET("getAllShops.do")
    Call<List<ShopListBean>> getShoplist();

    @GET("getFoodByShop.do")
    Call<List<FoodListBean>> getFoodlist(@Query("shop_id") int shop_id);

    @GET("getFoodById.do")
    Call<FoodDetailBean> getFooddetail(@Query("food_id") int food_id);

    @GET("insertOrder.do")
    Call<PurchaseBean> getPurchase(@Query("user_id") int user_id, @Query("food_id") int food_id,
                                   @Query("num") int num, @Query("sum") double sum, @Query("suggesttime") String suggesttime);

    @GET("isCollected.do")
    Call<IsCollectBean> getIscollected(@Query("user_id") int user_id, @Query("shop_food_id") int shop_food_id, @Query("flag") int flag);

    @GET("userCollectShop.do")
    Call<RegisterBean> getShopcollect(@Query("user_id") int user_id,@Query("shop_id") int shop_id);

    @GET("userCollectFood.do")
    Call<RegisterBean> getFoodcollect(@Query("user_id") int user_id,@Query("food_id") int food_id);

    @GET("getAllUserCollection.do")
    Call<List<GetCollectBean>> getCollect(@Query("user_id") int user_id, @Query("flag") int flag);

    @GET("getFoodBySearch.do")
    Call<List<FoodListBean>> getSearchMsg(@Query("search") String  search);

    @GET("getUserById.do")
    Call<UserBean> getUserMeg(@Query("user_id") int user_id);

    @GET("getAllUserOrder.do")
    Call<List<OrderOrCommentBean>> getOrderMeg(@Query("user_id") int user_id);

    @GET("getAllUserComment.do")
    Call<List<OrderOrCommentBean>> getCommentMeg(@Query("user_id") int user_id);

    @GET("getAllUserFoodOrder.do")
    Call<List<OrderOrCommentBean>> getfoodCommentMeg(@Query("food_id") int food_id);

    @GET("updateUserById.do")
    Call<RegisterBean> getchangeMeg(@Query("user_id") int user_id,@Query("username") String username, @Query("userpass") String userpass,
                                    @Query("mobilenum") String mobilenum,@Query("address") String address);

    @GET("deleteComment.do")
    Call<RegisterBean> getdelCommentMeg(@Query("order_id") int order_id);

    @GET("insertComment.do")
    Call<RegisterBean> getinCommentMeg(@Query("order_id") int order_id,@Query("content") String content );

    @GET("updateComment.do")
    Call<RegisterBean> getupdtCommentMeg(@Query("order_id") int order_id,@Query("content") String content );

}
