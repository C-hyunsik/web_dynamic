<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML태그 시작 전의 공백 제거 --%>

<%!
	//전역변수
	int num = 3;
%>
<%

	//Java
	String num = request.getParameter("num");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String datetime = request.getParameter("datetime");
	
	boolean result = true;
	String msg = "덧글이 작성되었습니다.";
%>
<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result><%=result %></result>
	<msg><%=msg %></msg>
	<item>
		<num><%=num %></num>
		<writer><%=writer %></writer>
		<content><%=content %></content>
		<datetime><%=datetime %></datetime>
	</item>
</comment>