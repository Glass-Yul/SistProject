package day0115;

public class Board_01 {
	private String writer;
	private String subject;
	private String content;
	
	public Board_01() {
	}
	public Board_01(String writer, String subject, String content) {
		this.writer = writer;
		this.subject = subject;
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
