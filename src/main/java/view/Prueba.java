package view;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.io.IOUtils;

import dao.Detail;
import model.ResultDetail;

public class Prueba {
	public static void main(String[] args) {
		ResultDetail r = Detail.getDetail("520510");
		System.out.println(r.getData().getShort_description());
		
		System.out.println("\n");
		
		String jsonTxt="";

		try {
			jsonTxt = IOUtils.toString(new URL("https://store.steampowered.com/api/appdetails/?appids="+520510),"utf-8");
			jsonTxt = jsonTxt.substring(jsonTxt.indexOf(":")+1, jsonTxt.length()-1);
			System.out.println(jsonTxt);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			
		}
	}
}
