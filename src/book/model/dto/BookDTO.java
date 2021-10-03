package book.model.dto;


import java.sql.Date;

public class BookDTO {
	
	private String book_id;
	private String title;
	private String author;
	private String publisher;
	private String book_rev;
	private Date publisher_date;
	private Date insert_date;
	private String con_del;
	
	public BookDTO() {

	}

	
	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Date getPublisher_date() {
		return publisher_date;
	}

	public void setPublisher_date(Date publisher_date) {
		this.publisher_date = publisher_date;
	}


	public String getBook_rev() {
		return book_rev;
	}


	public void setBook_rev(String book_rev) {
		this.book_rev = book_rev;
	}


	public Date getInsert_date() {
		return insert_date;
	}


	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}


	public String getCon_del() {
		return con_del;
	}


	public void setCon_del(String con_del) {
		this.con_del = con_del;
	}
	
	

}
