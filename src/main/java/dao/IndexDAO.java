package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.ProductVO;

public class IndexDAO {

	public static List<ProductVO> getNR_list() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ProductVO> nr_list = ss.selectList("index.newrec");

		ss.close();
		return nr_list;
	}
	public static List<ProductVO> getN_list() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ProductVO> n_list = ss.selectList("index.new");
		ss.close();
		return n_list;
	}
	public static List<ProductVO> getR_list() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ProductVO> r_list = ss.selectList("index.rec");
		ss.close();
		return r_list;
	}
	public static List<ProductVO> getBS_list(String u_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ProductVO> bs_list = ss.selectList("index.basket", u_idx);
		ss.close();
		return bs_list;
	}
	public static List<ProductVO> getIN_list(String u_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ProductVO> in_list = ss.selectList("index.interest", u_idx);
		ss.close();
		return in_list;
	}
}
