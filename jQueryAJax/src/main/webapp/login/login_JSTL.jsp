<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML태그 시작 전의 공백 제거 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="result" value="true"/>
<c:set var="msg" value="안녕하세요 홍길동님"/>
<c:if test = "${param.user_id != 'hong'}">
	<c:set var = "result" value = "false" />
	<c:set var = "msg" value = "가입되지 않은 아이디입니다." />
</c:if>
<c:if test = "${param.user_password != '111'}">
	<c:set var = "result" value = "false" />
	<c:set var = "msg" value = "비밀번호가 틀렸습니다" />
</c:if>

<?xml version="1.0" encoding="UTF-8"?>
<login>
	<result>${result}</result>
	<msg>${msg}</msg>
</login>