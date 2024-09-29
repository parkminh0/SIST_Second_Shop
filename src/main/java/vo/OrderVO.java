package vo;

import java.util.List;


public class OrderVO {
	private String 	rnum, order_key, u_idx, delivery_key, paymethod, delivery_msg, confirm,
					grade, ratio_mile, mile, usedmile, destination, receiver,
					zip_code, receiver_tel, is_allcancel, is_allrefund,
					order_dtm;

	private int delivery_price, d_price, b_discount, t_discount, total_cancel_price,
				total_refund_price, order_qty, order_changed_qty, primary_price, final_price;

	private int od_count;

	private String product_summ;

	private List<OrderDetailVO> od_list;
	private List<OrderStatusVO> os_list;
	
	private int od_true_size;

	private String d_status;

	public String getD_status() {
		return d_status;
	}

	public void setD_status(String d_status) {
		this.d_status = d_status;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		int r_num = (int) Double.parseDouble(rnum);
		rnum = String.valueOf(r_num);
		this.rnum = rnum;
	}

	public String getOrder_key() {
		return order_key;
	}

	public void setOrder_key(String order_key) {
		this.order_key = order_key;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getDelivery_key() {
		return delivery_key;
	}

	public void setDelivery_key(String delivery_key) {
		this.delivery_key = delivery_key;
	}

	public String getPaymethod() {
		return paymethod;
	}

	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}

	public String getDelivery_msg() {
		return delivery_msg;
	}

	public void setDelivery_msg(String delivery_msg) {
		this.delivery_msg = delivery_msg;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getRatio_mile() {
		return ratio_mile;
	}

	public void setRatio_mile(String ratio_mile) {
		this.ratio_mile = ratio_mile;
	}

	public String getMile() {
		return mile;
	}

	public void setMile(String mile) {
		this.mile = mile;
	}

	public String getUsedmile() {
		return usedmile;
	}

	public void setUsedmile(String usedmile) {
		this.usedmile = usedmile;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getReceiver_tel() {
		return receiver_tel;
	}

	public void setReceiver_tel(String receiver_tel) {
		this.receiver_tel = receiver_tel;
	}

	public String getIs_allcancel() {
		return is_allcancel;
	}

	public void setIs_allcancel(String is_allcancel) {
		this.is_allcancel = is_allcancel;
	}

	public String getIs_allrefund() {
		return is_allrefund;
	}

	public void setIs_allrefund(String is_allrefund) {
		this.is_allrefund = is_allrefund;
	}

	public String getOrder_dtm() {
		return order_dtm;
	}

	public void setOrder_dtm(String order_dtm) {
		this.order_dtm = order_dtm;
	}

	public int getDelivery_price() {
		return delivery_price;
	}

	public void setDelivery_price(int delivery_price) {
		this.delivery_price = delivery_price;
	}

	public int getD_price() {
		return d_price;
	}

	public void setD_price(int d_price) {
		this.d_price = d_price;
	}

	public int getB_discount() {
		return b_discount;
	}

	public void setB_discount(int b_discount) {
		this.b_discount = b_discount;
	}

	public int getT_discount() {
		return t_discount;
	}

	public void setT_discount(int t_discount) {
		this.t_discount = t_discount;
	}

	public int getTotal_cancel_price() {
		return total_cancel_price;
	}

	public void setTotal_cancel_price(int total_cancel_price) {
		this.total_cancel_price = total_cancel_price;
	}

	public int getTotal_refund_price() {
		return total_refund_price;
	}

	public void setTotal_refund_price(int total_refund_price) {
		this.total_refund_price = total_refund_price;
	}

	public int getOrder_qty() {
		return order_qty;
	}

	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}

	public int getOrder_changed_qty() {
		return order_changed_qty;
	}

	public void setOrder_changed_qty(int order_changed_qty) {
		this.order_changed_qty = order_changed_qty;
	}

	public int getPrimary_price() {
		return primary_price;
	}

	public void setPrimary_price(int primary_price) {
		this.primary_price = primary_price;
	}

	public int getFinal_price() {
		return final_price;
	}

	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}




	public int getOd_count() {
		return od_count;
	}

	public void setOd_count(int od_count) {
		this.od_count = od_count-1;
	}

	public String getProduct_summ() {
		return product_summ;
	}

	public void setProduct_summ(String product_summ) {
		this.product_summ = product_summ + " 외 "+ od_count+"개";
	}

	public List<OrderDetailVO> getOd_list() {
		return od_list;
	}

	public void setOd_list(List<OrderDetailVO> od_list) {
		this.od_list = od_list;
	}

	public int getOd_true_size() {
		int od_true_size = 0;
		for(OrderDetailVO odvo: od_list) {
			if(odvo.getOd_changed_qty()>0) {
				od_true_size++;
			}
		}
		
		return od_true_size;
	}

	public int getOds_confirm(String order_key) {
		int od_confirm = 0;
		for(OrderDetailVO odvo: od_list) {
			if(odvo.getOrder_key().equals(order_key)) {
				if(odvo.getOd_confirm() != null) {
					if(Integer.parseInt(odvo.getOd_confirm())>0) {
						od_confirm++;
					}
				}
			}
		}
		
		return od_confirm;
	}

	public List<OrderStatusVO> getOs_list() {
		return os_list;
	}

	public void setOs_list(List<OrderStatusVO> os_list) {
		this.os_list = os_list;
	}












}
