package vo;

import java.util.List;

public class UserVO {
	private String u_idx, ug_idx, admin, id, pw, name,
	addr, addr_detail, zip_code, sex, btd,
	email, phone, total_spend, total_mile, avail_mile, reg_dtm,
	del, del_dtm, del_reason;

	UgradeVO ugvo;
	List<BasketVO> basket_list;
	List<CouponlistVO> coupon_list;
	List<InterestVO> interest_list;
	List<OrderVO> order_list;

	public UgradeVO getUgvo() {
		return ugvo;
	}

	public void setUgvo(UgradeVO ugvo) {
		this.ugvo = ugvo;
	}

	public List<OrderVO> getOrder_list() {
		return order_list;
	}

	public void setOrder_list(List<OrderVO> order_list) {
		this.order_list = order_list;
	}

	private int used_mile, unavail_mile;

	public int getUsed_mile() {
		return used_mile;
	}

	public void setUsed_mile(int used_mile) {
		this.used_mile = used_mile;
	}

	public int getUnavail_mile() {
		return unavail_mile;
	}

	public void setUnavail_mile(int unavail_mile) {
		this.unavail_mile = unavail_mile;
	}

	public List<CouponlistVO> getCoupon_list() {
		return coupon_list;
	}

	public void setCoupon_list(List<CouponlistVO> coupon_list) {
		this.coupon_list = coupon_list;
	}

	public List<InterestVO> getInterest_list() {
		return interest_list;
	}

	public void setInterest_list(List<InterestVO> interest_list) {
		this.interest_list = interest_list;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr_detail() {
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public List<BasketVO> getBasket_list() {
		return basket_list;
	}

	public void setBasket_list(List<BasketVO> basket_list) {
		this.basket_list = basket_list;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getUg_idx() {
		return ug_idx;
	}

	public void setUg_idx(String ug_idx) {
		(this.ug_idx) = ug_idx;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBtd() {
		return btd;
	}

	public void setBtd(String btd) {
		this.btd = btd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTotal_spend() {
		return total_spend;
	}

	public void setTotal_spend(String total_spend) {
		this.total_spend = total_spend;
	}

	public String getTotal_mile() {
		return total_mile;
	}

	public void setTotal_mile(String total_mile) {
		this.total_mile = total_mile;
	}

	public String getAvail_mile() {
		return avail_mile;
	}

	public void setAvail_mile(String avail_mile) {
		this.avail_mile = avail_mile;
	}

	public String getReg_dtm() {
		return reg_dtm;
	}

	public void setReg_dtm(String reg_dtm) {
		this.reg_dtm = reg_dtm;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getDel_dtm() {
		return del_dtm;
	}

	public void setDel_dtm(String del_dtm) {
		this.del_dtm = del_dtm;
	}

	public String getDel_reason() {
		return del_reason;
	}

	public void setDel_reason(String del_reason) {
		this.del_reason = del_reason;
	}


}
