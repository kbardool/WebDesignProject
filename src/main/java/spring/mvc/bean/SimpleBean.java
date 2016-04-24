package spring.mvc.bean;

public class SimpleBean {

	private int simpleId;
	private String simpleText;
	
	public SimpleBean(){}
	
	public SimpleBean(int simpleId, String simpleText){
		this.simpleId = simpleId;
		this.simpleText = simpleText;
	}
	
	public int getSimpleId() {
		return simpleId;
	}
	public void setSimpleId(int simpleId) {
		this.simpleId = simpleId;
	}
	public String getSimpleText() {
		return simpleText;
	}
	public void setSimpleText(String simpleText) {
		this.simpleText = simpleText;
	}
	
	
}
