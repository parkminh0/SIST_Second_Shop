package vo;


public class CouponlistVO {
	String  rnum,cl_idx, u_idx, c_idx, c_qty, create_dtm;
	String status = "0";

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private CouponVO c_list;



	public CouponVO getC_list() {
		return c_list;
	}

	public void setC_list(CouponVO c_list) {
		this.c_list = c_list;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = String.valueOf((int)Double.parseDouble(rnum));
	}

	public String getCl_idx() {
		return cl_idx;
	}

	public void setCl_idx(String cl_idx) {
		this.cl_idx = cl_idx;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public String getC_qty() {
		return c_qty;
	}

	public void setC_qty(String c_qty) {
		this.c_qty = c_qty;
	}

	public String getCreate_dtm() {
		return create_dtm;
	}

	public void setCreate_dtm(String create_dtm) {
		this.create_dtm = create_dtm;
	}


}
