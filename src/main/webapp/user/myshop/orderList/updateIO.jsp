<%@page import="java.util.ArrayList"%>
<%@page import="vo.OrderDetailVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="service.BasIntService"%>
<%@page import="vo.BasketVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="vo.InterestVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="vo.UserVO"%>
<%@page import="service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String order_key = request.getParameter("order_key"); 
	String type = request.getParameter("type"); 

	String od_key = request.getParameter("od_key"); 
	String qty = request.getParameter("qty");
	String cell_price = request.getParameter("cell_price");

	String option_keys_tmp = request.getParameter("option_keys"); 
	String b_qtys_tmp = request.getParameter("b_qtys");
	
	String os_msg = request.getParameter("os_msg");
	
	
	String[] option_keys = null;
	String[] b_qtys = null;
	

	HashMap<String, String> map2 = new HashMap<>();
	String product_key2 = request.getParameter("product_key");
	String option_key2 = request.getParameter("option_key");
	String qty2 = request.getParameter("qty");
	map2.put("od_key", od_key);
	map2.put("product_key", product_key2);
	map2.put("option_key", option_key2);
	map2.put("qty", qty2);
	
	
	if(option_keys_tmp != null){
		option_keys = option_keys_tmp.split(",");
	}
	if(b_qtys_tmp != null){
		b_qtys = b_qtys_tmp.split(",");
	}
	
		SqlSession ss = FactoryService.getFactory().openSession();
		try {
			int result = 0;
			
			HashMap<String, String> map = new HashMap<>();
			map.put("order_key", order_key);
			map.put("od_key", od_key);
			
			
			switch(type){
			case "cancel_all":
				map.put("os_option", "1");
				
				List<OrderDetailVO> od_list = ss.selectList("orderlist.getOd_list",order_key);
				for(OrderDetailVO odvo: od_list){
					map2.put("od_key", odvo.getOd_key());
					map2.put("product_key", odvo.getOpvo().getProduct_key());
					map2.put("option_key", odvo.getOption_key());
					map2.put("qty", String.valueOf(odvo.getOd_qty()));
					
					result = ss.update("orderlist.prod_up",map2);
					result *= ss.update("orderlist.opt_up",map2);
				}
				result *= ss.update("orderlist.cancelAll",map);
				result *= ss.update("orderlist.cancelAll_od",map);
				break;
			case "cancel":
				map.put("os_option", "1");
				map.put("cancel_qty", qty);
				map.put("cell_price", cell_price);
				result = ss.update("orderlist.cancel_od",map);
				result *= ss.update("orderlist.cancel",map);
				result *= ss.update("orderlist.prod_up",map2);
				result *= ss.update("orderlist.opt_up",map2);
				break;
			case "refund_all":
				map.put("os_option", "2");
				
				od_list = ss.selectList("orderlist.getOd_list",order_key);
				for(OrderDetailVO odvo: od_list){
					map2.put("od_key", odvo.getOd_key());
					map2.put("product_key", odvo.getOpvo().getProduct_key());
					map2.put("option_key", odvo.getOption_key());
					map2.put("qty", String.valueOf(odvo.getOd_qty()));
					
					result = ss.update("orderlist.prod_up",map2);
					result *= ss.update("orderlist.opt_up",map2);
				}
				result *= ss.update("orderlist.refundAll",map);
				result *= ss.update("orderlist.refundAll_od",map);
				break;
			case "refund":
				map.put("os_option", "2");
				map.put("refund_qty", qty);
				map.put("cell_price", cell_price);
				result = ss.update("orderlist.refund_od",map);
				result *= ss.update("orderlist.refund",map);
				result *= ss.update("orderlist.prod_up",map2);
				result *= ss.update("orderlist.opt_up",map2);
				break;
			case "exchange":
				map.put("os_option", "3");
				map.put("exchange_qty", qty);
				map.put("cell_price", cell_price);
				OrderDetailVO odvo = ss.selectOne("orderlist.exchange_od_info",map);
				int perMile = odvo.getOd_mile() / odvo.getOd_changed_qty();
				result = ss.update("orderlist.exchange_od_ex",map);
				result *= ss.update("orderlist.opt_up",map2);
				for(int i=0; i<option_keys.length;i++){
					
					map.put("option_key", option_keys[i]);
					map.put("b_qty", b_qtys[i]);

					odvo.setOption_key(option_keys[i]);
					odvo.setOd_qty(Integer.parseInt(b_qtys[i]));
					odvo.setOd_mile(perMile*Integer.parseInt(b_qtys[i]));
					odvo.setOd_changed_qty(Integer.parseInt(b_qtys[i]));
					odvo.setOd_totalprice(odvo.getCell_price()*Integer.parseInt(b_qtys[i]));
					odvo.setOd_changed_price(odvo.getCell_price()*Integer.parseInt(b_qtys[i]));
					
					map2.put("option_key", option_keys[i]);
					map2.put("b_qty", b_qtys[i]);
					
					result *= ss.insert("orderlist.exchange_od_add",odvo);
					result *= ss.update("orderlist.opt_down",map2);
					
					if(result == 0){
						break;
					}
				}
				
				break;
			case "confirm":
				result = ss.update("orderlist.confirm",od_key);
				if(result>0){
					int count = ss.selectOne("orderlist.getOd_cnt",od_key);
					int chk_count = ss.selectOne("orderlist.check_confirm",od_key);
					if(count == chk_count){
						result *= ss.update("orderlist.confirm_O",od_key);
					}
					
				}
				
				
				break;
			}

			if(result > 0){
				if(type.equals("refund_all") || type.equals("cancel_all")){
					
					List<OrderDetailVO> od_list = ss.selectList("orderlist.getOd_key",order_key);
					for(OrderDetailVO odvo: od_list){
						map.put("od_key", odvo.getOd_key());
						map.put("os_qty", String.valueOf(odvo.getOd_qty()));
						map.put("os_price", String.valueOf(odvo.getOd_qty()*odvo.getCell_price()));
						if(type.equals("cancel_all")){
							map.put("os_msg", "주문번호["+odvo.getOrder_key()+"] 전체취소");
						} else {
							map.put("os_msg", "주문번호["+odvo.getOrder_key()+"] 전체반품");
						}
						result *= ss.insert("orderlist.addOS", map);	
					}
					
					
				} else if(!type.equals("confirm")){
					map.put("os_qty", qty);
					int os_price = Integer.parseInt(qty)*Integer.parseInt(cell_price);
					map.put("os_price", String.valueOf(os_price));
					map.put("os_msg", os_msg);
					
					
					result *= ss.insert("orderlist.addOS", map);
				}
			}
			
			if (result > 0){
				ss.commit();
				
			} else {
				ss.rollback();
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		ss.close();
	
%>
