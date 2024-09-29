<%@page import="service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="vo.BbsVO"%>
<%@page import="java.util.List"%>
<%@page import="util.Paging"%>
<%@page import="dao.BbsDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%
	String bc_key = request.getParameter("bc_key");
	String search = request.getParameter("search");
	String search_type = request.getParameter("search_type");
	String start_date = request.getParameter("start_date");	
	String end_date = request.getParameter("end_date");
	String cPage = request.getParameter("cPage");
	Map<String, String> map = new HashMap<>();
	map.put("bc_key", bc_key);
	map.put("title", search);
	map.put("start_date", start_date);
	map.put("end_date", end_date);
	map.put("search_type", search_type);
	
	if (cPage == null || cPage.equals("0")) {
        cPage = "1";
    }
	Paging p = new Paging(5, 3);
	
	//전체페이지 수를 구하기
	p.setTotalRecord(BbsDAO.searchBbsAdminPaging(map));
	
	if(cPage != null && !cPage.equals("0")) {
		p.setNowPage(Integer.parseInt(cPage));
	} else {
		p.setNowPage(1);
	}
	SqlSession ss = FactoryService.getFactory().openSession();
	session.setAttribute("page", p);
	map.put("begin", String.valueOf(p.getBegin()));
	map.put("end", String.valueOf(p.getEnd()));
	
	List<BbsVO> bbs_list = ss.selectList("bbs.searchbbs", map);
	
	session.setAttribute("bbs_list", bbs_list);
	ss.close();
%>