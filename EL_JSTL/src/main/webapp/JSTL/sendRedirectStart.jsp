<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<String> list = new ArrayList<String>();

	list.add("호랑이");
	list.add("사자");
	list.add("기린");
	list.add("코끼리");
	list.add("타조");
	list.add("코알라");
	list.add("아리");
	
	//submit, button을 통해서 넘어가는 데이터를 문자열(String)만 가능하다
	//절대로 객체를 넘길 수 없다.
	request.setAttribute("list", list);
	
	//페이지 이동
	response.sendRedirect("sendRedirectEnd.jsp");
	
%>