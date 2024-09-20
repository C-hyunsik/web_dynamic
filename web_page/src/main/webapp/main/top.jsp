<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "context" value = "${pageContext.request.contextPath }" />
<style>
#header ul{
	list-style: none;
	margin:0;
	padding-right:30px;
}
#header{
	color:white;
	padding-top:10px;
	width:1200px;
	font-size:16px;
	height: 35px;
	background: #8a2be2;
	margin: 0 auto;
}
#header li{
	display: inline-block;
	float:right;
	padding: 0 10px;
}
#header span{
	float:right;
}
#top1 a:link, #menu a:link{color: white; text-decoration:none;}
#top1 a:visited, #menu a:visited{color : white; text-decoration:none;}
#top1 a:hover, #menu a:hover{color : cyan; text-decoration:underline;}
#top1 a:active, #menu a:active{color : purple; text-decoration:none;}
</style>
<div id = top1>
<ul>
	<c:if test = "${userId == null }">
	<li><a href = "${context }/member/loginForm.do"><span>로그인</span></a></li>
	<li><a href = "${context }/member/index.do">카페홈</a></li>
	</c:if>
	<c:if test = "${userId != null }">
	<li><a href = "${context }/member/updateForm.do"><span>${userNickname}님</span></a></li>
	<li><a href = "${context }/member/boardWriteForm.do">글쓰기</a></li>
	</c:if>
</ul>
</div>