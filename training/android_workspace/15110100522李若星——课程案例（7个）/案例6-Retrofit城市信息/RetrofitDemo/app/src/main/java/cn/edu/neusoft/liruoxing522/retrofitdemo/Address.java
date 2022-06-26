package cn.edu.neusoft.liruoxing522.retrofitdemo;

/**
 * Created by Administrator on 2017/10/11.
 * {"lon":116.40752,"level":-1,"address":"","cityName":"","alevel":4,"lat":39.90403}
 */

public class Address {
    String lon;
    String level;
    String address;
    String cityName;
    String alevel;
    String lat;

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getAlevel() {
        return alevel;
    }

    public void setAlevel(String alevel) {
        this.alevel = alevel;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }
}
