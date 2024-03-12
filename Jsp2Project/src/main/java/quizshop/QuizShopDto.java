package quizshop;

import java.sql.Timestamp;

public class QuizShopDto {
	private String id;
	private String name;
	private String img;
	private String price;
	private String startday;
	private Timestamp finishday;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public Timestamp getFinishday() {
		return finishday;
	}
	public void setFinishday(Timestamp finishday) {
		this.finishday = finishday;
	}
	
}
