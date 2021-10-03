package product.model.dto;

import java.sql.Date;

/**
 * @author solaw
 *
 */
public class ProductDTO {

	int product_code;
	String product_name;
	int product_price;
	String maker;
	Date regi_date;
	
	//생성자
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	
	//get set
	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public Date getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}
	
	
	
	
}
