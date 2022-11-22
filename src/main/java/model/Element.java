package model;

public class Element {
	private int id;
	private String description;
	
	public int getId() {
		return id;
	}
	public String getDescription() {
		return description;
	}
	
	@Override
	public String toString() {
		return "Category [id=" + id + ", description=" + description + "]";
	}
}
