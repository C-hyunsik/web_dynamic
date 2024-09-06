<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML태그 시작 전의 공백 제거 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var = "result" value = "${param.num }"/>
<c:set var = "writer" value = "${param.writer }"/>
<c:set var = "content" value = "${param.content }"/>
<c:set var = "datetime" value = "${param.datetime }"/>

<c:set var = "result" value = "true"/>
<c:set var = "msg" value = "덧글이 작성되었습니다."/>

<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result>${result}</result>
	<msg>${msg}</msg>
	<item>
		<num>${num }</num>
		<writer>${writer }</writer>
		<content>${content }</content>
		<datetime>${datetime }</datetime>
	</item>
</comment>