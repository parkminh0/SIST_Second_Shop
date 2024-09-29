<%@page import="vo.BasketVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="vo.UserVO"%>
<%@page import="service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    UserVO uvo = (UserVO)session.getAttribute("user_vo");
    String option_key = request.getParameter("option_key"); 
    String b_qty = request.getParameter("b_qty"); 

    if (uvo != null) {
        Map<String, String> map = new HashMap<>();
        map.put("u_idx", uvo.getU_idx());
        map.put("option_key", option_key);
        map.put("b_qty", b_qty);

        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            //먼저 selOpt 쿼리로 중복된 옵션키가 있는지 확인
            BasketVO existingBasket = ss.selectOne("basket.selOpt", map);

            int result;
            if (existingBasket != null) {
                //중복된 옵션키가 있는 경우 changeQty 호출
                result = ss.update("basket.changeQty", map);
            } else {
                //중복된 옵션키가 없는 경우 basket.add 호출
                result = ss.insert("basket.add", map);
            }

            System.out.println(result);

            if (result > 0) {
                ss.commit();
            } else {
                ss.rollback();
            }
        } catch (Exception e) {
            ss.rollback();
            e.printStackTrace();
        } finally {
            ss.close();
        }
    }
%>