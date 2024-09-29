package vo;


public class OrderStatusVO {
	private String 	os_key, od_key, os_option, os_msg, os_create_dtm, os_confirm;

	private int os_qty, os_price;
	
	private OrderDetailVO odvo;

	public String getOs_key() {
		return os_key;
	}

	public void setOs_key(String os_key) {
		this.os_key = os_key;
	}

	public String getOd_key() {
		return od_key;
	}

	public void setOd_key(String od_key) {
		this.od_key = od_key;
	}

	public String getOs_option() {
		return os_option;
	}

	public void setOs_option(String os_option) {
		this.os_option = os_option;
	}

	public String getOs_msg() {
		return os_msg;
	}

	public void setOs_msg(String os_msg) {
		this.os_msg = os_msg;
	}

	public String getOs_create_dtm() {
		return os_create_dtm;
	}

	public void setOs_create_dtm(String os_create_dtm) {
		this.os_create_dtm = os_create_dtm;
	}

	public String getOs_confirm() {
		return os_confirm;
	}

	public void setOs_confirm(String os_confirm) {
		this.os_confirm = os_confirm;
	}

	public int getOs_qty() {
		return os_qty;
	}

	public void setOs_qty(int os_qty) {
		this.os_qty = os_qty;
	}

	public int getOs_price() {
		return os_price;
	}

	public void setOs_price(int os_price) {
		this.os_price = os_price;
	}

	public OrderDetailVO getOdvo() {
		return odvo;
	}

	public void setOdvo(OrderDetailVO odvo) {
		this.odvo = odvo;
	}











}
