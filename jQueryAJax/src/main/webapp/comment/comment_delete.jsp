<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML태그 시작 전의 공백 제거 --%>

<%
	//Java
	String num = request.getParameter("num");
	
	//고유한 값인 num을 가지고 DB에서 삭제
	boolean result = true;
	String msg = "덧글을 삭제하였습니다.";
%>

<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result><%=result %></result>
	<msg><%=msg %></msg>
</comment>