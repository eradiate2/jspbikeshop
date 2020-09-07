package product;

/*DTO								DAO
 -Data Transfer Object			-Data Access Object
 -MVC 데이터전달					-Database에 입력,수정,삭제처리
 M:Model(프로그램소스)
 V:View(화면처리)
 C:Controller(model view 
 사이에서 control)
 */

import java.io.Serializable;

public class Product implements Serializable{

	private static final long serialVersionUID = -4274700572038677000L;
	//멤버변수
	private String productId; //상품아이디
	private String pname; //상품명
	private Integer price; //상품가격
	private String description;//상품설명
	private String category;//장소
	private String manufacturer;//제조사
	private long unitsInStock;//재고 수 
	private String condition;//신상품 or 중고품 or 재생품
	
	private String filename; //이미지 파일명
	
	/* 2020-06-16 장바구니 관련 멤버변수 선언 */
	private int quantity;//수량
	
	//기본생성자
	public Product() {
		
	}
	//생성자
	public Product(String productId,String pname,Integer price) {
		this.productId=productId;
		this.pname=pname;
		this.price=price;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category= category;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
}
