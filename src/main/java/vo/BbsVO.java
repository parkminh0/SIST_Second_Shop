package vo;

import java.util.List;


public class BbsVO {
	private String rnum, b_idx, u_idx, bc_key, title, content, crt_dtm,upt_dtm, hit , up, status;

	private UserVO uvo;
	private List<CommVO> c_list;
	private List<BfileVO> b_list;



	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = String.valueOf((int)Double.parseDouble(rnum));
	}

	public String getB_idx() {
		return b_idx;
	}

	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getBc_key() {
		return bc_key;
	}

	public void setBc_key(String bc_key) {
		this.bc_key = bc_key;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCrt_dtm() {
		return crt_dtm;
	}

	public void setCrt_dtm(String crt_dtm) {
		this.crt_dtm = crt_dtm;
	}

	public String getUpt_dtm() {
		return upt_dtm;
	}

	public void setUpt_dtm(String upt_dtm) {
		this.upt_dtm = upt_dtm;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getUp() {
		return up;
	}

	public void setUp(String up) {
		this.up = up;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}





	public UserVO getUvo() {
		return uvo;
	}

	public void setUvo(UserVO uvo) {
		this.uvo = uvo;
	}

	public List<CommVO> getC_list() {
		return c_list;
	}

	public void setC_list(List<CommVO> c_list) {
		this.c_list = c_list;
	}

	public List<BfileVO> getB_list() {
		return b_list;
	}

	public void setB_list(List<BfileVO> b_list) {
		this.b_list = b_list;
	}


}
