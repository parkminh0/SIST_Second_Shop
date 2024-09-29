<%@page import="vo.UserVO"%>
<%@page import="service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s_id = request.getParameter("id"); 

	SqlSession ss = FactoryService.getFactory().openSession();
	
	UserVO vo = ss.selectOne("user.check_id", s_id);
	ss.close();
	
	if (vo == null) {
%>
		<span class="success">사용가능</span>
<%
	} else {
%>
		<span class="fail">사용불가</span>
<%
	}
%>