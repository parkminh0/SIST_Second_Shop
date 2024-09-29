package dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.CategoryVO;
import vo.CouponVO;
import vo.ProductVO;

public class CouponDAO {
	public static List<CouponVO> CouponSearch(String c_name, String d_type, String issue_sort, String category_key, String issue_at ) {
		CouponVO[] c_ar = null;


		Map<String, String> map = new HashMap();


        map.put("c_name", c_name);
        map.put("d_type", d_type);
        map.put("issue_sort", issue_sort);
        map.put("category_key", category_key);
        map.put("issue_at", issue_at);
//        map.put("due_date", due_date);
        SqlSession ss = FactoryService.getFactory().openSession();

        List<CouponVO> c_list = ss.selectList("coupon.searchCoupons",map);




		ss.close();


		return c_list;
	}
	
	// 관리자 - 쿠폰 등록
	public static int addCoupon(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int res = ss.insert("coupon.addCoupon", map);
		if (res>0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		ss.close();
		
		return res;
	}
	
	// 관리자 - 쿠폰 수정
		public static int editCoupon(Map<String, String> map) {
			SqlSession ss = FactoryService.getFactory().openSession();
			
			int res = ss.update("coupon.editCoupon", map);
			if(res > 0) {
				ss.commit();
			} else {
				ss.rollback();
			}
			ss.close();
			
			return res;
		}
		
		public static CouponVO getCouponByKey(String c_idx) {
			SqlSession ss = FactoryService.getFactory().openSession();
			CouponVO cvo = ss.selectOne("coupon.getCouponByKey", c_idx);
			ss.close();
			return cvo;
		}

	
	// 관리자 - 쿠폰 목록 페이징
	public static int searchForAdminPaging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("coupon.searchForAdminPaging", map);

		ss.close();
		
		return res;
	}
	
	public static CouponVO[] searchCoupon(String c_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<CouponVO> c_list = ss.selectList("coupon.search", c_idx);

		CouponVO[] ar = null;
		if (c_list != null && c_list.size() > 0) {
			ar = new CouponVO[c_list.size()];
			c_list.toArray(ar);
		}
		
		ss.close();
		return ar;
	}
	
	public static int deleteCoupon(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int res = ss.delete("coupon.deleteCoupon", map);
		if(res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		
		deleteCouponList(map);
		return res;
	}
	
	public static int deleteCouponList(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int res = ss.delete("couponlist.deleteCouponList", map);
		if(res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		
		return res;
	}
}
