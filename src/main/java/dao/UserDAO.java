package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.CouponVO;
import vo.CouponlistVO;
import vo.UserVO;
import vo.admin.UserCountVO;
import vo.admin.statistic_user_activityVO;

public class UserDAO {

	public static UserVO login(String id, String pw) {
		Map<String,String> map = new HashMap();
		map.put("id",id);
		map.put("pw",pw);

		SqlSession ss = FactoryService.getFactory().openSession();
		UserVO vo = ss.selectOne("user.login",map);

		ss.close();

		return vo;
	}

	public static UserVO adminLogin(String id, String pw) {
		Map<String,String> map = new HashMap();
		map.put("id",id);
		map.put("pw",pw);

		SqlSession ss = FactoryService.getFactory().openSession();
		UserVO vo = ss.selectOne("user.adminLogin",map);

		ss.close();

		return vo;
	}

	public static int signUp(String id, String pw, String email, String phone, String name,String addr1,String addr2,String sex,String btd,String zip_code) {
		int cnt = 0;

		UserVO uvo = new UserVO();
		uvo.setId(id);
		uvo.setPw(pw);
		uvo.setName(name);
		uvo.setEmail(email);
		uvo.setPhone(phone);
		uvo.setZip_code(zip_code);
		uvo.setAddr(addr1);
		uvo.setAddr_detail(addr2);
		uvo.setBtd(btd);
		uvo.setSex(sex);
		SqlSession ss = FactoryService.getFactory().openSession();
		cnt = ss.insert("user.add",uvo);
		if(cnt>0) {
			ss.commit();
		}else {
			ss.rollback();
		}

		ss.close();
		return cnt;
	}

	public static UserVO modify(String u_idx, String user_id, String user_pw, String name, String zip_code, String addr1, String addr2, String phone, String email, String sex, String btd) {
		int cnt = 0;

		UserVO uvo = new UserVO();
		uvo.setU_idx(u_idx);
		uvo.setId(user_id);
		uvo.setPw(user_pw);
		uvo.setName(name);
		uvo.setZip_code(zip_code);
		uvo.setAddr(addr1);
		uvo.setAddr_detail(addr2);
		uvo.setPhone(phone);
		uvo.setEmail(email);
		uvo.setSex(sex);
		uvo.setBtd(btd);

		SqlSession ss = FactoryService.getFactory().openSession();
		cnt = ss.insert("user.modify", uvo);
		if(cnt>0) {
			ss.commit();
			ss.close();
			return uvo;
		}else {
			ss.rollback();
			ss.close();
		}

		return null;
	}

	public static String findInfo(String name, String email) {
		HashMap<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);

		SqlSession ss = FactoryService.getFactory().openSession();
		String id = ss.selectOne("user.find_info", map);

		ss.close();
		return id;

	}

	public static int changePw(String id, String pw) {
		int cnt = 0;
		HashMap<String, String> map = new HashMap<>();
		map.put("pw", pw);
		map.put("id", id);

		SqlSession ss = FactoryService.getFactory().openSession();
		cnt = ss.update("user.change_pw", map);
		if(cnt>0) {
			ss.commit();
			ss.close();
			return cnt;
		}else {
			ss.rollback();
			ss.close();
		}

		return 0;
	}


	public static  CouponlistVO[] mycoupon(String u_idx, int begin, int end) {
		CouponlistVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));

		List<CouponlistVO> list = ss.selectList("couponlist.search", map);
		if(list != null && list.size()>0) {
			ar = new CouponlistVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}

	public static  CouponlistVO[] mycouponorder(String u_idx, String category_key, int begin, int end) {
		CouponlistVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("category_key", category_key);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));

		List<CouponlistVO> list = ss.selectList("couponlist.search_mycouponorder", map);
		if(list != null && list.size()>0) {
			ar = new CouponlistVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}

	public static String mycouponcatename(String category_key) {
		SqlSession ss = FactoryService.getFactory().openSession();


		String category_name = ss.selectOne("category.search_category", category_key);
		ss.close();

		return category_name;
	}

	public static int couponcount(String u_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("couponlist.count",u_idx);
		ss.close();
		return cnt;
	}

	public static int mycouponcount(String u_idx, String category_key) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("category_key", category_key);
		int cnt = ss.selectOne("couponlist.mycouponcount",map);
		ss.close();
		return cnt;
	}

	public static CouponVO[] mycouponlist(String c_idx) {
		SqlSession ss =FactoryService.getFactory().openSession();
		CouponVO[] ar = null;
		List<CouponVO> list = ss.selectList("coupon.mycouponlist", c_idx);
		if(list != null && list.size()> 0) {
			ar = new CouponVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}

	public static void mycouponupdate(String u_idx ,String c_idx, String isApply) {
		SqlSession ss =FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("c_idx", c_idx);
		map.put("u_idx", u_idx);
		map.put("isApply", isApply);
		int cnt = ss.update("couponlist.update", map);
		ss.commit();

		ss.close();
	}

	public static void del(String u_idx, String del_reason) {

		Map<String,String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("del_reason", del_reason);

		SqlSession ss = FactoryService.getFactory().openSession();
		ss.update("user.del",map);
		ss.commit();
		ss.close();
	}

	public static UserVO[] userinfo(String u_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<UserVO> list = ss.selectList("user.user_info", u_idx);
		UserVO[] ar = null;
		if(list != null && list.size()> 0) {
			ar = new UserVO[list.size()];
			list.toArray(ar);
		}
		ss.close();

		return ar;
	}

	public static UserVO[] usermile(String u_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<UserVO> list = ss.selectList("user.check_idx", u_idx);
		UserVO[] ar = null;
		if(list != null && list.size()> 0) {
			ar = new UserVO[list.size()];
			list.toArray(ar);
		}
		ss.close();

		return ar;
	}
	


	public static UserCountVO countForAdmin() {
		SqlSession ss = FactoryService.getFactory().openSession();
		UserCountVO ucvo = ss.selectOne("user.countForAdmin");
		ss.close();
		return ucvo;
	}

	public static UserVO[] searchForAdmin(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<UserVO> list = ss.selectList("user.searchForAdmin", map);
		UserVO[] ar = null;

		if (list != null && list.size() > 0) {
			ar = new UserVO[list.size()];
			list.toArray(ar);
		}

		ss.close();
		return ar;
	}

	public static int searchForAdminPaging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("user.searchForAdminPaging", map);

		ss.close();

		return res;
	}

	// 관리자 - 통계 - 가입/접속 분석
	public static statistic_user_activityVO[] statistic_user_activity(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<statistic_user_activityVO> list = ss.selectList("");
		statistic_user_activityVO[] ar = null;

		if (list != null && list.size() > 0) {
			ar = new statistic_user_activityVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
	// 유저등급 변경
	public static void changeGrade(String u_idx, String ug_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<>();
        map.put("u_idx", u_idx);
        map.put("ug_idx", ug_idx);
		
		
		int cnt = ss.update("user.changeGrade",map);
		
		
		if(cnt>0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		
		
		ss.close();
		
	}
	//유저 정보 가져오기
	public static UserVO user(String u_idx) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		UserVO uvo = ss.selectOne("user.check_idx", u_idx);
	
		
		ss.close();

		return uvo;
	}
	
	//관리자 - 유저 정보 수정
	public static void editUser(String u_idx, String ug_idx, String admin , String id, String pw ,
								String name , String addr, String addr_detail, String zip_code, String sex, String btd,
								String email, String phone,String total_mile, String total_spend, String avail_mile, String reg_dtm,
								String del, String del_dtm, String del_reason) {
		SqlSession ss = FactoryService.getFactory().openSession();
		UserVO u_vo = new UserVO();
		u_vo.setU_idx(u_idx);
		u_vo.setUg_idx(ug_idx);
		u_vo.setAdmin(admin);
		u_vo.setId(id);
		u_vo.setPw(pw);
		u_vo.setName(name);
		u_vo.setAddr(addr);
		u_vo.setAddr_detail(addr_detail);
		u_vo.setZip_code(zip_code);
		u_vo.setSex(sex);
		u_vo.setBtd(btd);
		u_vo.setEmail(email);
		u_vo.setPhone(phone);
		u_vo.setTotal_mile(total_mile);
		u_vo.setTotal_spend(total_spend);
		u_vo.setAvail_mile(avail_mile);
		u_vo.setReg_dtm(reg_dtm);
		u_vo.setDel(del);
		u_vo.setDel_dtm(del_dtm);
		u_vo.setDel_reason(del_reason);
		
		
		int cnt = ss.update("user.editUser",u_vo);
		
		if(cnt>0) {
			ss.commit();
		}else {
			ss.rollback();		
		}
		
		
	}
	
	
	
}
