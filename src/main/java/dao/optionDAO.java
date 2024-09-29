package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;

public class optionDAO {
	public static int addOption(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.insert("option.addOption", map);
		if (res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return res;
	}

	public static int deleteOption(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.delete("option.deleteOption", map);
		if (res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return res;
	}
}