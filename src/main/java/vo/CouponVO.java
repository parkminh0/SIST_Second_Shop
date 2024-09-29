package vo;

import java.util.List;

public class CouponVO {
 private String rnum, c_idx, issue_sort, issue_at, c_name, d_type, d_price, max_discount, min_order_price, due_date, category_key, c_img;

 private List<CouponlistVO> cl_list;

public List<CouponlistVO> getCl_list() {
	return cl_list;
}

public void setCl_list(List<CouponlistVO> cl_list) {
	this.cl_list = cl_list;
}

public String getRnum() {
	return rnum;
}

public void setRnum(String rnum) {
	this.rnum = rnum;
}

public String getC_idx() {
	return c_idx;
}

public void setC_idx(String c_idx) {
	this.c_idx = c_idx;
}

public String getIssue_sort() {
	return issue_sort;
}

public void setIssue_sort(String issue_sort) {
	this.issue_sort = issue_sort;
}

public String getIssue_at() {
	return issue_at;
}

public void setIssue_at(String issue_at) {
	this.issue_at = issue_at;
}

public String getC_name() {
	return c_name;
}

public void setC_name(String c_name) {
	this.c_name = c_name;
}

public String getD_type() {
	return d_type;
}

public void setD_type(String d_type) {
	this.d_type = d_type;
}

public String getD_price() {
	return d_price;
}

public void setD_price(String d_price) {
	this.d_price = d_price;
}

public String getMax_discount() {
	return max_discount;
}

public void setMax_discount(String max_discount) {
	this.max_discount = max_discount;
}

public String getMin_order_price() {
	return min_order_price;
}

public void setMin_order_price(String min_order_price) {
	this.min_order_price = min_order_price;
}

public String getDue_date() {
	return due_date;
}

public void setDue_date(String due_date) {
	this.due_date = due_date;
}

public String getCategory_key() {
	return category_key;
}

public void setCategory_key(String category_key) {
	this.category_key = category_key;
}

public String getC_img() {
	return c_img;
}

public void setC_img(String c_img) {
	this.c_img = c_img;
}

}
