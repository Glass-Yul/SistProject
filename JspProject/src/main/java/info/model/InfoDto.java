package info.model;

import java.sql.Timestamp;
import java.util.Date;

public class InfoDto {
	private String id;
	private String name;
	private String addr;
	private Timestamp todate;
	
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Timestamp getTodate() {
		return todate;
	}
	public void setTodate(Timestamp todate) {
		this.todate = todate;
	}
	
	
}
