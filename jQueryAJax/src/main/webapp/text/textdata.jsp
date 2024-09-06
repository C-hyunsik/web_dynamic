<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
<%
//Java 구역	반드시 요청(request), 응답(response)이 들어가야한다
String result = request.getParameter("keyword");	//내장객체
 %>
결과 = <%=result	/* result의 값을 화면에 출력 */ %>
--%>
${ param.keyword}	<%-- EL/JSTL --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
