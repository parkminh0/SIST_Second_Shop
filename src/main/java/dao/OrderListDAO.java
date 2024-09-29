package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.OptionVO;
import vo.OrderDetailVO;
import vo.OrderStatusVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.admin.statistic_mainVO;
import vo.admin.statistic_main_productVO;
import vo.admin.statistic_user_mileVO;

public class OrderListDAO {

	public static OrderVO[] getOlOd(String u_idx, String delivery_key, String start_date, String end_date) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("delivery_key", delivery_key);
		map.put("start_date", start_date);
		map.put("end_date", end_date);

		List<OrderVO> o_list = ss.selectList("orderdetail.olist_o", map);
		
		for(int i=0; i<o_list.size();i++) {
			OrderVO ovo = o_list.get(i);
			map.put("order_key" , ovo.getOrder_key());
			List<OrderDetailVO> od_list = ss.selectList("orderdetail.olist_od", map);
			o_list.remove(i);
			ovo.setOd_list(od_list);
			o_list.add(i, ovo);
		}
		
		OrderVO[] od_ar = null;
		
		
		if(o_list.size()>0) {
			od_ar = new OrderVO[o_list.size()];
			o_list.toArray(od_ar);
		}
		
		
		
		ss.close();

		return od_ar;
	}
	public static OrderVO[] getOlOs(String u_idx, String os_option, String start_date, String end_date) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("os_option", os_option);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		

		List<OrderVO> o_list = ss.selectList("orderstatus.olist_o", map);
		for(int i=0; i<o_list.size(); i++) {
			OrderVO ovo = o_list.get(i);
			map.put("order_key" , ovo.getOrder_key());
			List<OrderStatusVO> os_list = ss.selectList("orderstatus.olist_os", map);
			o_list.remove(i);
			ovo.setOs_list(os_list);
			o_list.add(i, ovo);
		}
		
		OrderVO[] os_ar = null;
		
		
		if(o_list.size()>0) {
			os_ar = new OrderVO[o_list.size()];
			o_list.toArray(os_ar);
		}
		
		ss.close();
		
		return os_ar;
	}

	
}
