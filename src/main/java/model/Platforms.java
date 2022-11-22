package model;


public class Platforms {
	private boolean windows;
	private boolean mac;
	private boolean linux;
	
	public boolean isWindows() {
		return windows;
	}
	public boolean isMac() {
		return mac;
	}
	public boolean isLinux() {
		return linux;
	}
		
	@Override
	public String toString() {
		return "Platforms [windows=" + windows + ", mac=" + mac + ", linux=" + linux + "]";
	}
}
