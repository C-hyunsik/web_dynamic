<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.dao.UserDAO" %>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML태그 시작 전의 공백 제거 --%>
<%
	//Java
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	
	UserDAO userDAO = UserDAO.getInstance();
	boolean result = userDAO.login(user_id, user_pw); 
%>
<?xml version="1.0" encoding="UTF-8"?>
<result><%=result %></result>