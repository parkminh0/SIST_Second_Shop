package vo;

import java.util.List;

public class CategoryVO {
	String category_key, brand_key, up_category_key, category_name;
	List<CategoryVO> category_list;


	public List<CategoryVO> getCategory_list() {
		return category_list;
	}

	public void setCategory_list(List<CategoryVO> category_list) {
		this.category_list = category_list;
	}

	public String getCategory_key() {
		return category_key;
	}

	public void setCategory_key(String category_key) {
		this.category_key = category_key;
	}

	public String getBrand_key() {
		return brand_key;
	}

	public void setBrand_key(String brand_key) {
		this.brand_key = brand_key;
	}

	public String getUp_category_key() {
		return up_category_key;
	}

	public void setUp_category_key(String up_category_key) {
		this.up_category_key = up_category_key;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
}
