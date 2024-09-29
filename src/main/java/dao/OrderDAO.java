package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.OptionVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.admin.admin_index_cellVO;
import vo.admin.admin_index_statusVO;
import vo.admin.admin_order_totalorderVO;
import vo.admin.statistic_cell_dayVO;
import vo.admin.statistic_mainVO;
import vo.admin.statistic_main_productVO;
import vo.admin.statistic_user_dayVO;
import vo.admin.statistic_user_gradeVO;
import vo.admin.statistic_user_mileVO;

public class OrderDAO {

	public static int saveOrder(String u_idx,String delivery_key ,String delivery_price, String delivery_msg,
			String grade, String ratio_mile,String mile, String usedmile, String d_price, String t_discount, String destination, String receiver,
			String zip_code, String receiver_tel, String order_qty, String primary_price, String final_price) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("delivery_key", delivery_key);
		map.put("delivery_price", delivery_price);
		map.put("delivery_msg", delivery_msg);
		map.put("grade", grade);
		map.put("ratio_mile", ratio_mile);
		map.put("mile", mile);
		map.put("usedmile", usedmile);
		map.put("d_price", d_price);
		map.put("t_discount", t_discount);
		map.put("destination", destination);
		map.put("receiver", receiver);
		map.put("zip_code", zip_code);
		map.put("receiver_tel", receiver_tel);
		map.put("order_qty", order_qty);
		map.put("primary_price", primary_price);
		map.put("final_price", final_price);

		int cnt = ss.insert("order.save", map);
		ss.commit();
		ss.close();

		return cnt;
	}

	public static int saveOrderdetail(String order_key, String option_key, String delivery_key, String c_idx,
            String od_mile, String d_price, String od_qty, String od_price, String cell_price) {
			SqlSession ss = FactoryService.getFactory().openSession();

			HashMap<String, Object> map = new HashMap<>();
			map.put("order_key", order_key);
            map.put("option_key", option_key);
            map.put("delivery_key", delivery_key);
            map.put("c_idx", c_idx);
            map.put("od_mile", od_mile);
            map.put("d_price", d_price);
            map.put("od_qty", od_qty);
            map.put("od_price", od_price);
            map.put("cell_price", cell_price);

			int cnt = ss.insert("orderdetail.save", map);
			ss.commit();
			ss.close();

		return cnt;
	}

	public static int searchorderkey(int count) {
			SqlSession ss = FactoryService.getFactory().openSession();
			int cnt = ss.selectOne("order.search_orderkey", count);
			ss.commit();
			ss.close();

		return cnt;
	}

	public static ProductVO[] searchprodinfo(String option_key) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("product.getproductinfo", option_key);
        ProductVO[] ar = null;
        if(list != null) {
	        ar = new ProductVO[list.size()];
	        list.toArray(ar);
        }
		ss.close();


		return ar;
	}



	public static OptionVO[] getOrderList(String option_key) {
		OptionVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<OptionVO> list = ss.selectList("option.getOrderList",option_key);
		if(list != null && list.size() > 0) {
			ar = new OptionVO[list.size()];
			list.toArray(ar);
		}

		ss.close();
		return ar;
	}
	
	public static statistic_mainVO statistic_main() {
		SqlSession ss = FactoryService.getFactory().openSession();
		statistic_mainVO vo = ss.selectOne("order.statistic_main");

		ss.close();
		return vo;
	}

	public static statistic_main_productVO[] statistic_main_product() {
		statistic_main_productVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<statistic_main_productVO> list = ss.selectList("order.statistic_main_product");
		if(list != null && list.size() > 0) {
			ar = new statistic_main_productVO[list.size()];
			list.toArray(ar);
		}

		ss.close();
		return ar;
	}

	public static statistic_user_mileVO[] statistic_user_mile(Map<String, String> map) {
		statistic_user_mileVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<statistic_user_mileVO> list = ss.selectList("order.statistic_user_mile", map);
		if(list != null && list.size() > 0) {
			ar = new statistic_user_mileVO[list.size()];
			list.toArray(ar);
		}

		ss.close();
		return ar;
	}

	public static int statistic_user_mile_paging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("order.statistic_user_mile_paging", map);

		ss.close();
		return res;
	}
	
	public static OrderVO[] searchDeli(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		System.out.println("DAO Map: " + map);  // 디버깅 로그 추가
		List<OrderVO> list = ss.selectList("order.searchDeli", map);
		OrderVO[] ar = null;
		System.out.println("list"+list);
		if (list != null && list.size() > 0) {
			ar = new OrderVO[list.size()];
			System.out.println("ar"+ar);
			list.toArray(ar);
		}
		
		ss.close();
		return ar;
	}

	public static statistic_user_gradeVO[] statistic_user_grade(Map<String, String> map) {
		statistic_user_gradeVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<statistic_user_gradeVO> list = ss.selectList("order.statistic_user_grade", map);
		if(list != null && list.size() > 0) {
			ar = new statistic_user_gradeVO[list.size()];
			list.toArray(ar);
		}

		ss.close();
		return ar;
	}

	public static statistic_user_dayVO[] statistic_user_day(Map<String, String> map) {
		statistic_user_dayVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<statistic_user_dayVO> list = ss.selectList("order.statistic_user_day", map);
		if(list != null && list.size() > 0) {
			ar = new statistic_user_dayVO[list.size()];
			list.toArray(ar);
		}

		ss.close();
		return ar;
	}

	public static statistic_cell_dayVO[] statistic_cell_day(Map<String, String> map) {
		statistic_cell_dayVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<statistic_cell_dayVO> list = ss.selectList("order.statistic_cell_day", map);
		if(list != null && list.size() > 0) {
			ar = new statistic_cell_dayVO[list.size()];
			list.toArray(ar);
		}

		ss.close();
		return ar;
	}
	
	public static int statistic_cell_day_paging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("order.statistic_cell_day_paging", map);

		ss.close();
		return res;
	}
	
	public static statistic_cell_dayVO[] statistic_cell_month(Map<String, String> map) {
		statistic_cell_dayVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<statistic_cell_dayVO> list = ss.selectList("order.statistic_cell_month", map);
		if(list != null && list.size() > 0) {
			ar = new statistic_cell_dayVO[list.size()];
			list.toArray(ar);
		}

		ss.close();
		return ar;
	}
	
	public static int statistic_cell_month_paging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("order.statistic_cell_month_paging", map);

		ss.close();
		return res;
	}
	
	public static admin_index_cellVO[] admin_index_cell() {
		admin_index_cellVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<admin_index_cellVO> list = ss.selectList("order.admin_index_cell");
		if(list != null && list.size() > 0) {
			ar = new admin_index_cellVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
	
	public static admin_index_statusVO admin_index_status() {
		SqlSession ss = FactoryService.getFactory().openSession();
		admin_index_statusVO vo = ss.selectOne("order.admin_index_status");

		ss.close();
		return  vo;
	}
	
	public static admin_order_totalorderVO[] admin_order_totalorder(Map<String, String> map) {
		admin_order_totalorderVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<admin_order_totalorderVO> list = ss.selectList("order.admin_order_totalorder", map);
		if(list != null && list.size() > 0) {
			ar = new admin_order_totalorderVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
	
	public static int admin_order_totalorder_paging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("order.admin_order_totalorder_paging", map);

		ss.close();
		return res;
	}
}
