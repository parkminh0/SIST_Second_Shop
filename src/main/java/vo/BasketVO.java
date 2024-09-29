package vo;

public class BasketVO {
	String basket_key, u_idx, option_key, b_qty;

	private OptionVO ovo;
	private ProductVO pvo;

	private boolean interested;


	public String getBasket_key() {
		return basket_key;
	}

	public void setBasket_key(String basket_key) {
		this.basket_key = basket_key;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getOption_key() {
		return option_key;
	}

	public void setOption_key(String option_key) {
		this.option_key = option_key;
	}

	public String getB_qty() {
		return b_qty;
	}

	public void setB_qty(String b_qty) {
		this.b_qty = b_qty;
	}

	public OptionVO getOvo() {
		return ovo;
	}

	public void setOvo(OptionVO ovo) {
		this.ovo = ovo;
	}

	public ProductVO getPvo() {
		return pvo;
	}

	public void setPvo(ProductVO pvo) {
		this.pvo = pvo;
	}

	public boolean isInterested() {
		return interested;
	}

	public void setInterested(boolean interested) {
		this.interested = interested;
	}
}
