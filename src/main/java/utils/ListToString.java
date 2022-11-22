package utils;

import java.util.List;

public class ListToString {
	public static String listToString(List<String> devs) {
		if (devs.size() == 0) return "";
		StringBuilder result = new StringBuilder("");
		for (String dev : devs) {
			result.append(dev);
			result.append(", ");
		}
		return result.substring(0, result.length()-2).toString();
	}
}
