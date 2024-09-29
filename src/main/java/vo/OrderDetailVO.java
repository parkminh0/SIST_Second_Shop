package vo;

import java.util.List;


public class OrderDetailVO {
	private String 	rnum, od_key, order_key, option_key, delivery_key, c_idx,
					od_delivery_start, od_delivery_end, od_waybill,
					od_confirm, od_iscoupon, isexchanged;

	private int od_mile, d_price, od_usedmile,cancel_qty, refund_qty, cancel_price,
				refund_price, od_qty, od_changed_qty, od_totalprice, od_changed_price,
				od_price, cell_price;


	private List<OrderStatusVO> os_list;
	private OptionVO opvo;
	private String d_status;

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		int r_num = (int) Double.parseDouble(rnum);
		rnum = String.valueOf(r_num);
		this.rnum = rnum;
	}

	public String getOd_key() {
		return od_key;
	}

	public void setOd_key(String od_key) {
		this.od_key = od_key;
	}

	public String getOrder_key() {
		return order_key;
	}

	public void setOrder_key(String order_key) {
		this.order_key = order_key;
	}

	public String getOption_key() {
		return option_key;
	}

	public void setOption_key(String option_key) {
		this.option_key = option_key;
	}

	public String getDelivery_key() {
		return delivery_key;
	}

	public void setDelivery_key(String delivery_key) {
		this.delivery_key = delivery_key;
	}

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public String getOd_delivery_start() {
		return od_delivery_start;
	}

	public void setOd_delivery_start(String od_delivery_start) {
		this.od_delivery_start = od_delivery_start;
	}

	public String getOd_delivery_end() {
		return od_delivery_end;
	}

	public void setOd_delivery_end(String od_delivery_end) {
		this.od_delivery_end = od_delivery_end;
	}

	public String getOd_waybill() {
		return od_waybill;
	}

	public void setOd_waybill(String od_waybill) {
		this.od_waybill = od_waybill;
	}

	public String getOd_confirm() {
		return od_confirm;
	}

	public void setOd_confirm(String od_confirm) {
		this.od_confirm = od_confirm;
	}

	public String getOd_iscoupon() {
		return od_iscoupon;
	}

	public void setOd_iscoupon(String od_iscoupon) {
		this.od_iscoupon = od_iscoupon;
	}

	public int getOd_mile() {
		return od_mile;
	}

	public void setOd_mile(int od_mile) {
		this.od_mile = od_mile;
	}

	public int getD_price() {
		return d_price;
	}

	public void setD_price(int d_price) {
		this.d_price = d_price;
	}

	public int getOd_usedmile() {
		return od_usedmile;
	}

	public void setOd_usedmile(int od_usedmile) {
		this.od_usedmile = od_usedmile;
	}

	public int getCancel_qty() {
		return cancel_qty;
	}

	public void setCancel_qty(int cancel_qty) {
		this.cancel_qty = cancel_qty;
	}

	public int getRefund_qty() {
		return refund_qty;
	}

	public void setRefund_qty(int refund_qty) {
		this.refund_qty = refund_qty;
	}

	public int getCancel_price() {
		return cancel_price;
	}

	public void setCancel_price(int cancel_price) {
		this.cancel_price = cancel_price;
	}

	public int getRefund_price() {
		return refund_price;
	}

	public void setRefund_price(int refund_price) {
		this.refund_price = refund_price;
	}

	public int getOd_qty() {
		return od_qty;
	}

	public void setOd_qty(int od_qty) {
		this.od_qty = od_qty;
	}

	public int getOd_changed_qty() {
		return od_changed_qty;
	}

	public void setOd_changed_qty(int od_changed_qty) {
		this.od_changed_qty = od_changed_qty;
	}

	public int getOd_totalprice() {
		return od_totalprice;
	}

	public void setOd_totalprice(int od_totalprice) {
		this.od_totalprice = od_totalprice;
	}

	public int getOd_changed_price() {
		return od_changed_price;
	}

	public void setOd_changed_price(int od_changed_price) {
		this.od_changed_price = od_changed_price;
	}

	public List<OrderStatusVO> getOs_list() {
		return os_list;
	}

	public void setOs_list(List<OrderStatusVO> os_list) {
		this.os_list = os_list;
	}

	public OptionVO getOpvo() {
		return opvo;
	}

	public void setOpvo(OptionVO opvo) {
		this.opvo = opvo;
	}

	public String getD_status() {
		return d_status;
	}

	public void setD_status(String d_status) {
		this.d_status = d_status;
	}

	public String getIsexchanged() {
		return isexchanged;
	}

	public void setIsexchanged(String isexchanged) {
		this.isexchanged = isexchanged;
	}

	public int getOd_price() {
		return od_price;
	}

	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}

	public int getCell_price() {
		return cell_price;
	}

	public void setCell_price(int cell_price) {
		this.cell_price = cell_price;
	}












}
