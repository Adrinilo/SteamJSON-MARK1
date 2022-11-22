package model;

import java.util.List;
import utils.ListToString;

public class Data {
	private String name;
	private String steam_appid;
	private String required_age;
	private Boolean is_free;
	private String detailed_description;
	private String short_description;
	private String header_image;
	private String website;
	private PC_Requirements pc_requirements;
	private List<String> developers;
	private List<String> publishers;
	private Price price_overview;
	private Platforms platforms;
	private List<Element> categories;
	private List<Element> genres;
	private List<Screenshot> screenshots;
	
	public String getName() {
		return name;
	}
	public String getSteam_appid() {
		return steam_appid;
	}
	public String getRequired_age() {
		return required_age;
	}
	public Boolean getIs_free() {
		return is_free;
	}
	public String getDetailed_description() {
		return detailed_description;
	}
	public String getShort_description() {
		return short_description;
	}
	public String getHeader_image() {
		return header_image;
	}
	public String getWebsite() {
		return website;
	}
	public PC_Requirements getPc_requirements() {
		return pc_requirements;
	}
	public List<String> getDevelopers() {
		return developers;
	}
	public String getDevelopersString(List<String> lista) {
		String st = ListToString.listToString(lista);
		return st;
	}
	public List<String> getPublishers() {
		return publishers;
	}
	public String getPublishersString(List<String> lista) {
		String st = ListToString.listToString(lista);
		return st;
	}
	public Price getPrice_overview() {
		return price_overview;
	}
	public Platforms getPlatforms() {
		return platforms;
	}
	public List<Element> getCategories() {
		return categories;
	}
	public List<Element> getGenres() {
		return genres;
	}
	public List<Screenshot> getScreenshots() {
		return screenshots;
	}
}
