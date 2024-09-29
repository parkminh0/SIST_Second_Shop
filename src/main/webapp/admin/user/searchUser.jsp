<%@page import="dao.UgradeDAO"%>
<%@page import="vo.UgradeVO"%>
<%@page import="util.Paging"%>
<%@page import="dao.UserDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
	
	String search_type = request.getParameter("search_type");
	String type = request.getParameter("type");
	String grade = request.getParameter("grade");
	String regist_start_date = request.getParameter("regist_start_date");
	String regist_end_date = request.getParameter("regist_end_date");
	String del = request.getParameter("del");
	String age1 = request.getParameter("age1");
	String age2 = request.getParameter("age2");
	String gender = request.getParameter("gender");
	String sales_type = request.getParameter("sales_type");
	String min_sales_amount = request.getParameter("min_sales_amount");
	String max_sales_amount = request.getParameter("max_sales_amount");
	
	Map<String, String> map = new HashMap<>();
	if (type != null && type.length() != 0){
		map.put("search_type", search_type.trim());
		map.put("type", type.trim());
	}
	map.put("grade", grade.trim());
	map.put("regist_start_date", regist_start_date.trim());
	map.put("regist_end_date", regist_end_date.trim());
	map.put("del", del.trim());
	map.put("age1", age1.trim());
	map.put("age2", age2.trim());
	map.put("gender", gender.trim());
	map.put("sales_type", sales_type.trim());
	map.put("min_sales_amount", min_sales_amount.trim());
	map.put("max_sales_amount", max_sales_amount.trim());
	
	//유저등급 가져옴
	UgradeVO[] ugvo_list = UgradeDAO.getList();
	request.setAttribute("ugvo_list", ugvo_list);
	
	
	Paging p = new Paging(5, 3);
	String cPage = request.getParameter("cPage");
	//전체페이지 수를 구하기
	p.setTotalRecord(UserDAO.searchForAdminPaging(map));

	if(cPage != null && !cPage.equals("0")) {
		p.setNowPage(Integer.parseInt(cPage));
	} else {
		p.setNowPage(1);
	}
	
	pageContext.setAttribute("page", p);
	
	pageContext.setAttribute("grade_list", p);
	
	map.put("begin", String.valueOf(p.getBegin()));
	map.put("end", String.valueOf(p.getEnd()));
	UserVO[] ar = UserDAO.searchForAdmin(map);
%>
	<div class="mBoard gScroll gCellNarrow typeList">
	    <table border="1" summary="" class="eChkColor">
	        <caption>회원 목록</caption>
	        <colgroup>
	            <col class="chk"/>
	            <col class="date"/>
	            <col style="width:70px"/>
	            <col style="width:100px;"/>
	            <col style="width:100px;"/>                                                                                                
	            <col style="width:120px"/>
	            <col style="width:60px"/>
	            <col style="width:60px; "/>
	            <col style="width:70px"/>                                                                                            
	            <col style="width:235px"/>
	        </colgroup>
	        <thead>
		        <tr>
		            <th scope="col"><input id="allChk" type="checkbox" class="allChk"/></th>
		            <th scope="col">
						<strong class="array ">
						    <span onclick="submitSearch('regist_date', '')">등록일</span><button type="button">정렬선택</button>
						</strong>
					</th>                                                                
					<th scope="col">이름</th>
		            <th scope="col">아이디</th>
		            <th scope="col">등급</th>
		            <th scope="col">전화번호</th>
		            <th scope="col">성별</th>
		            <th scope="col">나이</th>
		            <th scope="col">지역</th>
		            <th scope="col">관련 내역 보기</th>
		       	</tr>
	        </thead>
	        <tbody class="center">
<%
			if (ar != null){
%>
				<input type="hidden" name="user_cnt" value="<%=p.getTotalRecord()%>"/>
<%
				for (UserVO uvo:ar){
%>
				<tr class="">
					<td>
						<input type="hidden" class="u_idx" value="<%=uvo.getU_idx()%>"/>
						<input type="checkbox" name="use_check[]" class="rowChk">
					</td>
					<td><%= uvo.getReg_dtm() %></td>
					<td>
		            	<a href="Controller?type=edituser&u_idx=<%=uvo.getU_idx() %>" title="새창 열림" class="txtLink"><%= uvo.getName() %></a>
		                <span class="gSingle"></span>
		            </td>
		            <td>
		            	<a href="Controller?type=edituser&u_idx=<%=uvo.getU_idx() %>" title="새창 열림" class="txtLink"><%= uvo.getId() %></a>
			          	<span class="gSingle"></span>
		            </td>
		            <td><%= uvo.getUgvo().getGrade() %></td>
		            <td>
		                <a href="Controller?type=edituser&u_idx=<%=uvo.getU_idx() %>" title="새창 열림" class="txtLink"><%= uvo.getPhone() %></a>
		            </td>
		            <td>
<%
					if (uvo.getSex().equals("0")) {
%>
						남자
<%				
					} else {
%>
						여자
<%
					}
%>
		            </td>
		            <td>나이</td>
		            <td>지역</td>
		            <td>관련</td>
				</tr>
<%
				}
			}
%>                        
	        </tbody>
	    </table>
<%
		if (ar == null){
%>
            <p class="empty" style="display:block;">검색된 회원 내역이 없습니다.</p>
<%
		}
%>
        </div>
        <div class="mCtrl typeFooter">
            <div class="gLeft">
               	<a href="#none" onclick="delete_choice()" class="btnNormal"><span><em class="icoDel"></em> 탈퇴</span></a>
           	</div>
        </div>
        <c:set var="page" value="${page}"/>
        <div class="mPaginate">
        	<c:if test="${page.getStartPage() >= page.getPagePerBlock()}">
				<a href="#" onclick="doSrchFrm('${page.getNowPage()-page.getPagePerBlock()}');" class="prev">이전 10페이지</a>
			</c:if>
            <ol>
				<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" varStatus="idx">
					<c:if test="${page.getNowPage() eq idx.index}">
						<li>
							<strong title="현재페이지">${idx.index}</strong>
						</li>
					</c:if>
					<c:if test="${page.getNowPage() ne idx.index}">
						<li>
							<a href="#" onclick="doSrchFrm('${idx.index}');">${idx.index}</a>
						</li>
					</c:if>
				</c:forEach>
            </ol>
            <c:if test="${page.getEndPage() < page.getTotalPage()}">
				<a href="#" onclick="doSrchFrm('${page.getNowPage()+page.getPagePerBlock()}');" class="next">다음 10페이지</a>
			</c:if>
		</div>
		<div class="section" id="QA_level3">
			<div class="mTile">
				<h2>추가설정</h2>
			</div>
			<div class="mBoard gSmall">
				<table border="1" summary="">
					<caption>추가 설정</caption>
					<tbody>
						<tr style="">
							<th scope="row">
								회원등급변경						
							</th>
							<td>
								 선택된 회원을  
								<select id="ugvo_select">
									<c:forEach var="ugvo" items="${requestScope.ugvo_list}">
									<option value="${ugvo.ug_idx }">${ugvo.grade } </option>
									</c:forEach>
								</select>
								 으로 
								<a onclick="cg()" class="btnNormal">
									<span>등급변경</span>
								</a>
								 합니다. 	
							</td>
						
						</tr>
					</tbody>
				</table>	
			</div>
		
		</div>
