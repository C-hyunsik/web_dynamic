<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "user.dao.UserDAO" %>
<%@ page import = "user.dto.UserDTO" %>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML태그 시작 전의 공백 제거 --%>
<%
	//Java
	UserDTO userDTO = new UserDTO();
	UserDAO userDAO = UserDAO.getInstance();
	
	List<String> list = userDAO.post_list(userDTO);
	
	if (list == null) {
        list = new ArrayList<>();
    }
%>

<?xml version="1.0" encoding="UTF-8"?>
<items>
<%
    for (String item : list) {
        String[] parts = item.split("\t");
%>
    <item>
        <no><%= parts[0] %></no>
        <title><%= parts[1] %></title>
        <writer><%= parts[2] %></writer>
        <logtime><%= parts[3] %></logtime>
    </item>
<%
    }
%>
</items>