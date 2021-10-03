package memo.model.dto;

import java.sql.Date;

public class MemoDTO {
	
	//필드
	private int no;
	private String writer;
	private String content;
	private Date regi_date;

	
	
	//생성자
	public MemoDTO() {
		
	}



	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getRegi_date() {
		return regi_date;
	}



	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}
	
	
}
