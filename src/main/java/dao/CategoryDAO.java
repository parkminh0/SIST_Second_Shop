package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.CategoryVO;

public class CategoryDAO {
	public static CategoryVO[] getList() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<CategoryVO> c_list = ss.selectList("category.getList", null);

		CategoryVO[] category_list = null;
		if (c_list != null && c_list.size() > 0) {
			category_list = new CategoryVO[c_list.size()];
			c_list.toArray(category_list);
		}

		/** Category 모든 레코드 확인해보기
		for(CategoryVO cvo:c_list) {
			System.out.println(cvo.getCategory_name());
			if (cvo.getCategory_list() != null) {
				System.out.println(cvo.getCategory_list().size());
				for(CategoryVO ccvvoo:cvo.getCategory_list()) {
					System.out.println(ccvvoo.getCategory_name());
					if (ccvvoo.getCategory_list() != null) {
						System.out.println(ccvvoo.getCategory_list().size());
					}
				}
			}
		}
		**/

		ss.close();
		return category_list;
	}

	public static CategoryVO[] editCategory(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.update("category.editCategory", map);
		if (res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return getList();
	}

	public static CategoryVO[] addCategory(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.insert("category.addCategory", map);
		if (res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return getList();
	}

	public static CategoryVO[] deleteCategory(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int un_category_key = ss.selectOne("category.getUnclassified");
		map.put("un_category_key", String.valueOf(un_category_key));
		int res1 = ss.update("product.cateToUnclassified", map);
		int res = ss.insert("category.deleteCategory", map);
		if (res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return getList();
	}
}
