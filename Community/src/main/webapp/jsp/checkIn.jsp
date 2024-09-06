<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.dao.UserDAO" %>
<%@ page import = "user.dto.UserDTO" %>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML태그 시작 전의 공백 제거 --%>
<%
	//Java
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String user_name = request.getParameter("user_name");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	boolean result = false;
	UserDTO userDTO = new UserDTO();
	
	userDTO.setId(user_id);
	userDTO.setPw(user_pw);
	userDTO.setName(user_name);
	userDTO.setGender(gender);
	userDTO.setEmail(email);
	
	UserDAO userDAO = UserDAO.getInstance();
	result = userDAO.checkIn(userDTO);
%>
<?xml version="1.0" encoding="UTF-8"?>
<result><%=result %></result>