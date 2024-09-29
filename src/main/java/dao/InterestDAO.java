package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.InterestVO;
import vo.OptionVO;
import vo.ProductVO;

public class InterestDAO {
	public static List<ProductVO> search(String u_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
        List<ProductVO> p_list = ss.selectList("interest.search_p", u_idx);
        ss.close();

        return p_list;

	}

	public static List<ProductVO> search2(String u_idx, int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		List<ProductVO> p_list = ss.selectList("interest.search_p2", map);
		ss.close();

		return p_list;

	}

	public static List<OptionVO> getOption(String product_key) {

		SqlSession ss = FactoryService.getFactory().openSession();


		List<OptionVO> o_list = ss.selectList("option.getOptionByProduct",product_key);
		ss.close();
		System.out.println("o_list: " + o_list);
		return o_list;
	}

	public static List<InterestVO> getInterKey(String u_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<InterestVO> ivo = ss.selectList("interest.search",u_idx);
		ss.close();

		return ivo;
	}

}
