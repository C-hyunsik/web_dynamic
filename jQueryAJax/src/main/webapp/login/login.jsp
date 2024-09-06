<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML태그 시작 전의 공백 제거 --%>

<%
	//Java
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	
	//DB
	//만약에 아이디:hong 비밀번호:111 ===> 로그인 성공
	boolean result = true;
	String msg = "안녕하세요 홍길동님";
	
	if(!user_id.equals("hong")){
		result = false;
		msg = "가입되지 않은 아이디입니다.";
	}
	else if(!user_password.equals("111")){
		result = false;
		msg = "비밀번호가 틀렸습니다.";
	}	
%>

<?xml version="1.0" encoding="UTF-8"?>
<login>
	<result><%=result %></result>
	<msg><%=msg %></msg>
</login>