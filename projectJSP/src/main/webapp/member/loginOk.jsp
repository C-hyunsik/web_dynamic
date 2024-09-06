<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	//String name = request.getParameter("name");
	//String id = request.getParameter("id");
	String redirect = "../index.jsp";
	String name = null;
	String id = null;
	//쿠키 받기
	/*
	Cookie[] ar = request.getCookies();	//특정 쿠키만을 가져오지 못하고, 전부 꺼내옴
	if(ar != null){
		for(int i = 0; i < ar.length; i++){
			String cookieName = ar[i].getName();	//쿠키명
			String cookievalue = ar[i].getValue();	//쿠키값
			
			System.out.println("쿠키명 = " + cookieName);
			System.out.println("쿠키값 = " + cookievalue);
			System.out.println();
			
			if(cookieName.equals("memName")){name = cookievalue;}
			if(cookieName.equals("memId")){id = cookievalue;}
		}//for i
	}//if
	*/
	
	//세션 받기
	name = (String)session.getAttribute("memName");	//자식 = (자식)부모
	id = (String)session.getAttribute("memId");	//자식 = (자식)부모
				
%>
<%=name %>|<%=id %>|<%=redirect %>
