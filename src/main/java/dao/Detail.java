package dao;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.io.IOUtils;

import com.google.gson.Gson;

import model.ResultDetail;

public class Detail {
	public static ResultDetail getDetail(String appid) {
		String jsonTxt="";
		try {
			jsonTxt = IOUtils.toString(new URL("https://store.steampowered.com/api/appdetails/?appids="+appid),"utf-8");
			jsonTxt = jsonTxt.substring(jsonTxt.indexOf(":")+1, jsonTxt.length()-1);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return new Gson().fromJson(jsonTxt, ResultDetail.class);
	}
}

