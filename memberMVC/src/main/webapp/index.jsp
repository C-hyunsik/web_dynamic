<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0 auto;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 97vh;
}
#wrap {
 	text-align: center;
 	height: center;
 	border: 2px solid black;
 	padding: 5em;
 	border-radius: 15px;
}
h3 a {
	color: gray;
	text-decoration: none;
}
h3 a:hover {
	color: black;
	font-weight: bold;
}
</style>
</head>
<body>
<div id="wrap">
<h2>메인화면</h2>
<c:set var = "context" value = "${pageContext.request.contextPath }" />

<c:if test = "${sessionScope.memId == null }">
	<h3><a href="${context}/member/writeForm.do">회원가입</a></h3>
	<h3><a href="${context}/member/loginForm.do">로그인</a></h3>
</c:if>
<c:if test = "${sessionScope.memId != null }">
	<h3><a href="${context}/member/logout.do">로그아웃</a></h3>
	<h3><a href="${context}/member/updateForm.do">회원정보수정</a></h3>
	<h3><a href="./board/boardWriteForm.do">글쓰기</a></h3>
</c:if>
<h3><a href="./board/boardList.do?pg=1">목록</a></h3>
</div>
</body>
</html>