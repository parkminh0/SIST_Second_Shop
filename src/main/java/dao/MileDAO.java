package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.OrderVO;

public class MileDAO {

	public static int getCount(String u_idx, int tabType) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();


		map.put("u_idx", u_idx);
		map.put("tabType", String.valueOf(tabType));
		int cnt = ss.selectOne("order.count", map);
		ss.close();
		return cnt;
	}

	public static OrderVO[] getList(String u_idx, int begin, int end, int tabType) {
		OrderVO[] o_ar = null;

		SqlSession ss = FactoryService.getFactory().openSession();

		HashMap<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("tabType", String.valueOf(tabType));
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));

		List<OrderVO> list = ss.selectList("order.list", map);
		if(list != null && list.size() > 0) {
			o_ar = new OrderVO[list.size()];
			list.toArray(o_ar);//list가 가지는 모든 요소들을
						//ar이라는 배열에 복사한다.
		}


		ss.close();
		return o_ar;
	}

	public static OrderVO[] getWholeList(String u_idx) {
		OrderVO[] o_ar = null;

		SqlSession ss = FactoryService.getFactory().openSession();

		HashMap<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);

		List<OrderVO> list = ss.selectList("order.wlist", map);
		if(list != null && list.size() > 0) {
			o_ar = new OrderVO[list.size()];
			list.toArray(o_ar);//list가 가지는 모든 요소들을
						//ar이라는 배열에 복사한다.
		}


		ss.close();
		return o_ar;
	}

}
