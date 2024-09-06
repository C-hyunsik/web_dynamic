<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	//Java 구역 - 전역변수
	//1번만 실행, init()
	String name = "홍길동";
	int age = 25;
%>
<%
	//Java 구역 - 지역변수
	//요청 시 마다 실행, service()
	age++;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
o(*￣▽￣*)ブ<br/>

<!-- Hello JSP!!<br/> --><!-- html주석 f12누르면 보임 -->

<%-- 안녕하세요 JSP!!🤣<br/> --%><%-- JSP주석 f12눌러도 안보임 --%>

나의 이름은 <%=name %>입니다.<br/><!-- 해당 방법 추천 -->

<% out.println("나의 이름은 "+ name + "입니다."); %><br/><!-- 컴파일 성능에 안좋음 -->

<!-- 나의 나이는 <%=age%>살 입니다. <br/> -->

<%-- <% out.println("나의 나이는 "+ age + "입니다."); %> --%>
</body>
</html>