<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL: Format</title>
</head>
<body>
   <fmt:formatNumber type="number" value="123456789"></fmt:formatNumber><br/>
   <fmt:formatNumber type="number" value="123456789.88"></fmt:formatNumber><br/>
   <fmt:formatNumber type="number" value="123456789.88" maxFractionDigits="1"></fmt:formatNumber><br/>
   <br/>
   <fmt:formatNumber type="number" value="123456.78" pattern="#,###"></fmt:formatNumber><br/>
   <fmt:formatNumber type="number" value="123456.789" pattern=".##"></fmt:formatNumber><br/>
   <fmt:formatNumber type="number" value="123456.789" pattern="#,###.##"></fmt:formatNumber><br/>
   <br/>
   <fmt:formatNumber type="number" value="0000.00" pattern="#,###.##"></fmt:formatNumber><br/>
   <fmt:formatNumber type="number" value="0000.00" pattern="0,000.00"></fmt:formatNumber><br/>
   <fmt:formatNumber type="number" value="12.3" pattern="000.00"></fmt:formatNumber><br/>
   <br/>
   
   <c:set var="now" value="<%=new java.util.Date()%>"/>
   <c:out value="${now}"/><br/>
   date : <fmt:formatDate value="${now}" type="date"/>
   time : <fmt:formatDate value="${now}" type="time"/>
   both : <fmt:formatDate value="${now}" type="both"/>
   <br/>
   
   <fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm" type="both"/>
   <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" type="date"/>
   <fmt:formatDate value="${now}" pattern="yyyy-MM-dd E요일 a" type="date"/>
</body>
</html>