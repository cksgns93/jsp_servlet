package ajax.book;
import java.io.*;
import java.sql.*;
public class BookDTO implements Serializable {

	private String isbn;
	private String title;
	private String publish;
	private int price;
	private Timestamp published;
	private String bimage;
	
	public BookDTO(){}

	public BookDTO(String isbn, String title, 
			String publish, int price,
			Timestamp published, String bimage) {
		super();
		this.isbn = isbn;
		System.out.println("this.isbn="+this.isbn);
		this.title = title;
		this.publish = publish;
		this.price = price;
		this.published = published;
		this.bimage = bimage;
	}//���� ������---------

	//setter, getter----
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublish() {
		return publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Timestamp getPublished() {
		return published;
	}

	public void setPublished(Timestamp published) {
		this.published = published;
	}

	public String getBimage() {
		return bimage;
	}

	public void setBimage(String bimage) {
		this.bimage = bimage;
	}
	
}////////////////////////






