package vo;

import com.fasterxml.jackson.annotation.JsonBackReference;

public class OptionVO {
	String option_key, product_key, size, color, prod_stock;

	@JsonBackReference
	private ProductVO pvo;

	private String product_name, img_url;


	public ProductVO getPvo() {
		return pvo;
	}

	public void setPvo(ProductVO pvo) {
		this.pvo = pvo;
	}

	public String getOption_key() {
		return option_key;
	}

	public void setOption_key(String option_key) {
		this.option_key = option_key;
	}

	public String getProduct_key() {
		return product_key;
	}

	public void setProduct_key(String product_key) {
		this.product_key = product_key;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getProd_stock() {
		return prod_stock;
	}

	public void setProd_stock(String prod_stock) {
		this.prod_stock = prod_stock;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

}
