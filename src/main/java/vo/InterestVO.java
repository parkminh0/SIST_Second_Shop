package vo;

public class InterestVO {
	private String u_idx, interest_key, create_dtm,option_key, product_key;

	private ProductVO pvo;

	public String getProduct_key() {
		return product_key;
	}

	public void setProduct_key(String product_key) {
		this.product_key = product_key;
	}

	public String getInterest_key() {
		return interest_key;
	}

	public void setInterest_key(String interest_key) {
		this.interest_key = interest_key;
	}

	public String getOption_key() {
		return option_key;
	}

	public void setOption_key(String option_key) {
		this.option_key = option_key;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}



	public String getCreate_dtm() {
		return create_dtm;
	}

	public void setCreate_dtm(String create_dtm) {
		this.create_dtm = create_dtm;
	}
}
