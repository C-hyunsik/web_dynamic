<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String apple = (String)request.getAttribute("apple");
%>

결과 = <%=apple%>

<input type = button value = 뒤로가기 onclick = "history.go(-1)">