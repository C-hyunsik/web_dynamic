<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
<h3>*** include directive ***</h3>
<%@ include file="today.jsp" %>

<h3>*** include JSP tag ***</h3>
<jsp:include page="image.jsp" />
<%
	String name = "홍길동";
%>
<h3>main.jsp name = <%=name %></h3>

<h3>*** 3초뒤에 네이버 이동 ***</h3>
<% response.setHeader("Refresh", "3;url=https://www.naver.com"); %>
</body>
</html>