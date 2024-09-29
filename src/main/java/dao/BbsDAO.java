package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.BbsVO;
import vo.BoardCategoryVO;

public class BbsDAO {

	public static int getCount(String bc_key) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("bbs.count", bc_key);
		ss.close();
		return cnt;
	}

	public static int getSearchCount(String bc_key, String searchType, String keyword) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("bc_key", bc_key);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int cnt = ss.selectOne("bbs.s_count", map);
		ss.close();
		return cnt;
	}


	public static BbsVO[] getList(String bc_key, int begin,
			int end) {
		BbsVO[] ar = null;

		SqlSession ss = FactoryService.getFactory().openSession();

		HashMap<String, String> map = new HashMap<>();
		map.put("bc_key", bc_key);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));

		List<BbsVO> list = ss.selectList("bbs.list", map);
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);//list가 가지는 모든 요소들을
						//ar이라는 배열에 복사한다.
		}
		ss.close();
		return ar;
	}
	public static BbsVO[] usergetList(String u_idx, int begin,
			int end) {
		BbsVO[] ar = null;

		SqlSession ss = FactoryService.getFactory().openSession();

		HashMap<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));

		List<BbsVO> list = ss.selectList("bbs.userbbslist", map);
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);//list가 가지는 모든 요소들을
			//ar이라는 배열에 복사한다.
		}
		ss.close();
		return ar;
	}

	public static BbsVO[] getSearch(String bc_key, String searchType, String keyword, int begin,
			int end) {
		BbsVO[] ar = null;

		SqlSession ss = FactoryService.getFactory().openSession();

		HashMap<String, String> map = new HashMap<>();
		map.put("bc_key", bc_key);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));

		List<BbsVO> list = ss.selectList("bbs.s_list", map);
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);//list가 가지는 모든 요소들을
			//ar이라는 배열에 복사한다.
		}
		ss.close();
		return ar;
	}

	//원글을 저장하는 기능
	public static String add(String title, String u_idx,
			String content, String bc_key) {
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("u_idx", u_idx);
		map.put("content", content);
		map.put("bc_key", bc_key);
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("bbs.add", map);

		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();

		ss.close();


		return String.valueOf(map.get("b_idx"));
	}

	public static int addfile(String b_idx, String f_name, String o_name) {
		HashMap<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("f_name", f_name);
		map.put("o_name", o_name);

		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("bfile.insert", map);
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
		return cnt;
	}
	public static int reply(String writer, String content, String b_idx) {
		HashMap<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("writer", writer);
		map.put("content", content);

		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("comm.reply", map);
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
		return cnt;
	}

	public static BbsVO[] view(String b_idx) {
		BbsVO[] ar = null;
		SqlSession ss= FactoryService.getFactory().openSession();
		List<BbsVO> list = ss.selectList("bbs.view",b_idx);
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}

	public static int del(String bc_key) {
		SqlSession ss= FactoryService.getFactory().openSession();
		int chk = ss.update("bbs.del",bc_key);

		if(chk == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}

		ss.close();
		return chk;
	}

	public static int delComm(String c_idx) {
		SqlSession ss= FactoryService.getFactory().openSession();
		int chk = ss.update("comm.del",c_idx);

		if(chk == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}

		ss.close();
		return chk;
	}

	public static int hitInc(String b_idx) {

		SqlSession ss = FactoryService.getFactory().openSession();

		int chk = ss.update("bbs.hit",b_idx);

		if(chk > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}

		ss.close();

		return chk;
	}

	public static int up(String b_idx) {
		SqlSession ss= FactoryService.getFactory().openSession();
		int chk = ss.update("bbs.up",b_idx);

		if(chk == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return chk;
	}

	public static int edit(String b_idx, String title, String content) {
		HashMap<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("title", title);
		map.put("content", content);

		SqlSession ss= FactoryService.getFactory().openSession();
		int chk = ss.update("bbs.edit",map);

		if(chk == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return chk;
	}
	public static int userbbscount(String u_idx) {
		SqlSession ss= FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("bbs.userbbscount",u_idx);

		ss.close();
		return cnt;
	}
	public static int edit_bf(String b_idx, String fname, String oname) {
		HashMap<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);

		if(fname != null) {
			map.put("fname", fname);
			map.put("oname", oname);
		}

		SqlSession ss= FactoryService.getFactory().openSession();
		int chk = ss.update("bfile.edit",map);

		if(chk == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return chk;
	}

	public static BbsVO[] fulllist(String bc_key) {
		BbsVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<BbsVO> list = ss.selectList("bbs.fulllist", bc_key);
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
	
	public static BoardCategoryVO[] bbscategorysearch() {
		BoardCategoryVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<BoardCategoryVO> list = ss.selectList("bbs.bbs_category_search");
		if(list != null && list.size() > 0) {
			ar = new BoardCategoryVO[list.size()];
			list.toArray(ar);
		}
		
		ss.close();
		return ar;
	}
	
	public static void bbsdelete(String bc_key) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.delete("bbs.delbbs",bc_key);
		
		if(cnt > 0) {
			ss.commit();
		}
		
		ss.close();
	}
	
	public static List<BbsVO> BbsSearch(Map<String, String> map) {
        SqlSession ss = FactoryService.getFactory().openSession();

        List<BbsVO> c_list = ss.selectList("bbs.searchbbs",map);

		ss.close();
		return c_list;
	}
	
	public static int searchBbsAdminPaging(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("bbs.searchBbsPaging", map);

		ss.close();
		
		return res;
	}
	
}
