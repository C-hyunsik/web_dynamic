<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>
	sendRedirect로 보내면 데이터는 공유하지 않는다. <br/>
	주소도 화면도 sendRedirectEnd.jsp가 보인다.
</h3>
결과 = ${requestScope.list }
</body>
</html>