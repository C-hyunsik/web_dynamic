<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.dao.UserDAO" %>
<%@ page import = "user.dto.UserDTO" %>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML태그 시작 전의 공백 제거 --%>

<%
	//Java
	String user_id = request.getParameter("user_id");
	String title = request.getParameter("post_title");
	String content = request.getParameter("post_content");
	
	UserDAO userDAO = UserDAO.getInstance();
	boolean result = userDAO.post_write(user_id, title, content);
%>
<?xml version="1.0" encoding="UTF-8"?>
<result><%=result %></result>