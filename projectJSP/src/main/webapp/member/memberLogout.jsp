<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키
	/*
	Cookie[] ar = request.getCookies();	//특정 쿠키만을 가져오지 못하고, 전부 꺼내옴
	if(ar != null){
		for(int i = 0; i < ar.length; i++){
			if(ar[i].getName().equals("memName")){
				ar[i].setMaxAge(0);	//쿠키 삭제
				ar[i].setPath("/");
				response.addCookie(ar[i]);	//클라이언트에 저장
			}
			if(ar[i].getName().equals("memId")){
				ar[i].setMaxAge(0);	//쿠키 삭제
				ar[i].setPath("/");
				response.addCookie(ar[i]);	//클라이언트에 저장
			}
		}//for i
	}//if
	*/
	
	//세션
	session.removeAttribute("memName");
	session.removeAttribute("memId");
	
	//session.invalidate();		//모든 세션 한방에 다지워짐
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
window.onload = function(){
	alert("로그아웃");
	location.href = "../index.jsp";
}
</script>
</body>
</html>