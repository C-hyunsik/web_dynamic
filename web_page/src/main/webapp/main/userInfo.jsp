<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:if test = "${userId == null }">
<div id = btnInfo>
	<div id = Btn>
		<input id = writeBtn type = button value = 카페가입하기 /><br/>
		<input id = loginBtn type = button value = 로그인 />
	</div>
</div>
</c:if>
<c:if test = "${userId != null }">
<div id = userInfo>
	<div id = loginWrap>
		<div id = iconWrap>
			<c:if test = "${userGender == 'F'}">
				<img id = icon src = ./image/female_icon.png alt = icon width = 100 height = 100 />
			</c:if>
			<c:if test = "${userGender == 'M'}">
				<img id = icon src = ./image/male_icon.png alt = icon width = 100 height = 100 />
			</c:if>
		</div>
		<div id = loginInfo>
			<div id = nameWrap><span>${userNickname }님</span></div><br/>
			<div id = dateWrap><span>${userLogtime} 가입</span></div>
		</div>
	</div>
	<div id = rankInfoWrap>
		<div id = rankInfo>
			<span>등급 : 
			<c:if test = "${count >= 0 }">☆</c:if>
			<c:if test = "${count >= 5 }">☆☆</c:if>
			<c:if test = "${count >= 10 }">☆☆☆</c:if>
			<c:if test = "${count >= 20 }">★★★</c:if>
			</span><br/>
			<span>내가 쓴 글 수 : ${count }개</span><br/>
			<input id = writeBtn type = button value = 글쓰기>
		</div>
	</div>
</div>
</c:if>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#writeBtn').click(function(){
		location.href = "member/writeForm.do";
	});
	$('#loginBtn').click(function(){
		location.href = "member/loginForm.do";
	});
});
</script>