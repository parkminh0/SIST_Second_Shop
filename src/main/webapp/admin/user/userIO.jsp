<%@page import="dao.UserDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String u_idx = request.getParameter("u_idx");
    String ug_idx = request.getParameter("ug_idx");
    String type = request.getParameter("type");
    if(type.equals("cg")){
    	if(ug_idx != null && ug_idx != ""){
    		UserDAO.changeGrade(u_idx, ug_idx);
    	}
    }else{
    	UserDAO.del(u_idx, "관리자 탈퇴");
	
    }
	
%>