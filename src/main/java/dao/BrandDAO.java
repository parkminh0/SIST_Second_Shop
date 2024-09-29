package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.BrandVO;

public class BrandDAO {
	public static BrandVO[] getList() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<BrandVO> list = ss.selectList("brand.getList");

		BrandVO[] ar = null;
		if(list != null && list.size() > 0) {
			ar = new BrandVO[list.size()];
			list.toArray(ar);
		}
		ss.close();

		return ar;
	}
}
