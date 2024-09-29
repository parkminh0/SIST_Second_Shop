package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.UgradeVO;

public class UgradeDAO {
	public static UgradeVO[] getList() {
		UgradeVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<UgradeVO> list = ss.selectList("u_grade.getList");
		if (list != null && list.size() > 0) {
			ar = new UgradeVO[list.size()];
			list.toArray(ar);
		}

		ss.close();
		return ar;
	}

	public static UgradeVO[] searchUgrade(String ug_idx) {
		UgradeVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<UgradeVO> list = ss.selectList("u_grade.search",ug_idx);
		if (list != null && list.size() > 0) {
			ar = new UgradeVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
}
