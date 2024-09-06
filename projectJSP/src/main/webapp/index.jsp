<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String name = null;
	String id = null;
	name = (String)session.getAttribute("memName");	//자식 = (자식)부모
	id = (String)session.getAttribute("memId");	//자식 = (자식)부모
	/* Cookie[] ar = request.getCookies();	//특정 쿠키만을 가져오지 못하고, 전부 꺼내옴
	String name = null;
    String id = null;

    if(ar != null){
        for(Cookie cookie : ar){
            if(cookie.getName().equals("memName")){
                name = cookie.getValue();
            } else if(cookie.getName().equals("memId")){
                id = cookie.getValue();
            }
        }
    } */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
<h2>메인화면</h2>
<% if(id != null) { %>
    <h3>환영합니다, <%= name %> 님!</h3>
    <h3><a href="./member/memberLogout.jsp">로그아웃</a></h3>
    <h3><a href="./member/memberUpdateForm.jsp">회원정보수정</a></h3>
	<h3><a href = "">글쓰기</a></h3>
<% } else { %>
    <h3><a href="./member/memberWriteForm.jsp">회원가입</a></h3>
    <h3><a href="./member/memberLoginForm.jsp">로그인</a></h3>
<% } %>
<h3><a href = "">목록</a></h3>
</body>
</html>