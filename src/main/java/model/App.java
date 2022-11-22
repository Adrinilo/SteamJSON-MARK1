package model;

public class App {
	private String appid;
	private String name;
	
	public String getAppid() {
		return appid;
	}
	public String getName() {
		return name;
	}
	
	@Override
	public String toString() {
		return "App [appid=" + appid + ", name=" + name + "]";
	}
}
