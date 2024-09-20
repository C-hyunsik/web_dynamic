<%@page import="com.jstl.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	
	PersonDTO aa = new PersonDTO("홍길동",25);
	PersonDTO bb = new PersonDTO("라이언",23);
	PersonDTO cc = new PersonDTO("프로도",30);
	
	List<PersonDTO> list2 = new ArrayList<PersonDTO>();
	list2.add(aa);
	list2.add(bb);
	list2.add(cc);
	
	//submit, button을 통해서 넘어가는 데이터를 문자열(String)만 가능하다
	//절대로 객체를 넘길 수 없다.
	request.setAttribute("list", list);
	request.setAttribute("list2", list2);
	
	//페이지 이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("./forwardEnd.jsp");
	dispatcher.forward(request, response);
%>
<%-- <jsp:forward page = "forwardEnd.jsp"/> --%>