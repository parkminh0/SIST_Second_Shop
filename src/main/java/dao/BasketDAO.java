package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.BasketVO;

public class BasketDAO {

	public static List<BasketVO> getList(String u_idx) {
		BasketVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<BasketVO> bs_list = ss.selectList("basket.search", u_idx);

    ss.close();
		return bs_list;
	}

	public static void deletebasket(String basket_key) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.delete("basket.delete",basket_key);
		if(cnt > 0) {
			ss.commit();
		}
		ss.close();
	}

	public static void descbasket(String basket_key, String b_qty) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("basket_key", basket_key);
		map.put("change", b_qty );
		int result = ss.update("basket.changeBasketCount",map);

		if (result > 0) {
			ss.commit();
		}
	}

}
