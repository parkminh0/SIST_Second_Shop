package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.ProductVO;
import vo.UserVO;
import vo.admin.ProductCountVO;
import vo.admin.statistic_product_basketVO;
import vo.admin.statistic_product_cellVO;
import vo.admin.statistic_product_interestVO;

public class ProductDAO {
	public static ProductVO[] getProdctByCategory(String category_key, String orderby, String depth, int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap();
		map.put("category_key", category_key);
		map.put("orderby", orderby);
		map.put("depth", depth);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		List<ProductVO> p_list = ss.selectList("product.getProductByCategory", map);
		ProductVO[] ar = null;

		if(p_list != null && p_list.size() > 0) {
			ar = new ProductVO[p_list.size()];
			p_list.toArray(ar);
		}
		ss.close();
		return ar;
	}

	public static ProductVO getProdctByKey(String productKey) {
		SqlSession ss = FactoryService.getFactory().openSession();
		ProductVO pvo = ss.selectOne("product.getProductByKey", productKey);
		ss.close();
		return pvo;
	}


	public static int getProductCount(String category_key, String depth) {
		SqlSession ss = FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap();
		map.put("category_key", category_key);
		map.put("depth", depth);
		int cnt = ss.selectOne("product.getProductCount", map);
		
		ss.close();
		return cnt;
	}


	public static ProductVO[] getProdctByKeyword(String keyword, int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap();
		map.put("keyword", keyword);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));

		List<ProductVO> p_list = ss.selectList("product.getProductByKeyword", map);
		ProductVO[] ar = null;

		if(p_list != null && p_list.size() > 0) {
			ar = new ProductVO[p_list.size()];
			p_list.toArray(ar);
		}
		ss.close();
		return ar;
	}


	public static int getSearchProductCount(String keyword) {
		SqlSession ss = FactoryService.getFactory().openSession();

		int cnt = ss.selectOne("product.getSearchProductCount", keyword);

		ss.close();
		return cnt;

	}

	public static ProductCountVO countForAdmin() {
		SqlSession ss = FactoryService.getFactory().openSession();

		ProductCountVO pcvo = ss.selectOne("product.countForAdmin");
		ss.close();
		return pcvo;
	}
	
	public static ProductVO[] searchForAdmin(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("product.searchForAdmin", map);
		ProductVO[] ar = null;
		
		if (list != null && list.size() > 0) {
			ar = new ProductVO[list.size()];
			list.toArray(ar);
		}
		
		ss.close();
		return ar;
	}

	// 관리자 - 상품 목록 페이징
	public static int searchForAdminPaging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("product.searchForAdminPaging", map);

		ss.close();
		
		return res;
	}
	
	// 관리자 - 상품 완전 삭제
	public static int deleteProduct(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.delete("product.deleteProduct", map);
		if (res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		
		return res;
	}
	
	// 관리자 - 상품 판매 상태 
	public static int updateDel(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.update("product.updateDel", map);
		if (res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		
		return res;
	}
	
	public static void ViewQtyUp(String product_key) {

		SqlSession ss = FactoryService.getFactory().openSession();
		
		int chk = ss.update("product.viewQtyUp",product_key);

		if(chk > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}

		ss.close();

	}
	
	// 관리자 - 상품 추가
	public static int addProduct(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		ss.insert("product.addProduct", map);
		int product_key = Integer.parseInt(map.get("product_key"));
		if(product_key > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}

		ss.close();
		
		return product_key;
	}
	
	// 관리자 - 상품 수정
	public static int editProduct(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int res = ss.update("product.editProduct", map);

		if(res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}

		ss.close();
		
		return res;
	}
	
	// 관리자 - 통계 - 장바구니 Top 10
		public static statistic_product_basketVO[] statistic_product_basket_top() {
			SqlSession ss = FactoryService.getFactory().openSession();
			List<statistic_product_basketVO> list = ss.selectList("product.statistic_product_basket_top");
			statistic_product_basketVO[] ar = null;
			
			if (list != null && list.size() > 0) {
				ar = new statistic_product_basketVO[list.size()];
				list.toArray(ar);
			}
			
			ss.close();
			return ar;
		}
	
	// 관리자 - 통계 - 취소/반품 순위
	public static ProductVO[] admin_search_by_2(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("product.searchForAdmin", map);
		ProductVO[] ar = null;
		
		if (list != null && list.size() > 0) {
			ar = new ProductVO[list.size()];
			list.toArray(ar);
		}
		
		ss.close();
		return ar;
	}
	
	// 관리자 - 통계 - 장바구니 상품 순위
	public static statistic_product_basketVO[] statistic_product_basket(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<statistic_product_basketVO> list = ss.selectList("product.statistic_product_basket", map);
		statistic_product_basketVO[] ar = null;
		
		if (list != null && list.size() > 0) {
			ar = new statistic_product_basketVO[list.size()];
			list.toArray(ar);
		}
		
		ss.close();
		return ar;
	}
	
	// 관리자 - 통계 - 장바구니 상품 순위 페이징
	public static int statistic_product_basket_paging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("product.statistic_product_basket_paging", map);
		ss.close();
		return res;
	}
	
	// 관리자 - 통계 - 관심 상품 순위
	public static statistic_product_interestVO[] statistic_product_interest(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<statistic_product_interestVO> list = ss.selectList("product.statistic_product_interest", map);
		statistic_product_interestVO[] ar = null;
		
		if (list != null && list.size() > 0) {
			ar = new statistic_product_interestVO[list.size()];
			list.toArray(ar);
		}
		
		ss.close();
		return ar;
	}
	
	// 관리자 - 통계 - 관심 상품 순위 페이징
	public static int statistic_product_interest_paging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("product.statistic_product_interest_paging", map);
		ss.close();
		return res;
	}
	
	// 관리자 - 통계 - 판매 상품 순위
	public static statistic_product_cellVO[] statistic_product_cell(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<statistic_product_cellVO> list = ss.selectList("product.statistic_product_cell", map);
		statistic_product_cellVO[] ar = null;
		
		if (list != null && list.size() > 0) {
			ar = new statistic_product_cellVO[list.size()];
			list.toArray(ar);
		}
		
		ss.close();
		return ar;
	}
	
	// 관리자 - 통계 - 판매 상품 순위 페이징
	public static int statistic_product_cell_paging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("product.statistic_product_cell_paging", map);
		ss.close();
		return res;
	}
}
