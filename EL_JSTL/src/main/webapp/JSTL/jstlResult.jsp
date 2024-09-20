<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
}

.result-container {
    width: 50%;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

ul {
    list-style-type: none;
    padding: 0;
}

li {
    font-size: 1.2em;
    margin: 10px 0;
    padding: 10px;
    background-color: #f9f9f9;
    border-radius: 4px;
    border: 1px solid #ddd;
}

li:nth-child(odd) {
    background-color: #e9e9e9;
}
span{
	font-weight: bold;
}
</style>
</head>
<body>
    <div class="result-container">
        <fmt:requestEncoding value="UTF-8"/>
        <ul>
            <li>이름 : ${param.name }</li>
            <li>나이 : ${param.age }살
            	<c:if test = "${param.age >= 19}" >[성인]</c:if>
            	<c:if test = "${param.age < 19}" >[청소년]</c:if>
            </li>
            <li>색깔 : 
            	<c:if test = "${param.color == 'red' }"><span style = "color:${param.color};">빨강</span></c:if>
            	<c:if test = "${param.color == 'green' }"><span style = "color:${param.color};">초록</span></c:if>
            	<c:if test = "${param.color == 'blue' }"><span style = "color:${param.color};">파랑</span></c:if>
            	<c:if test = "${param.color == 'magenta' }"><span style = "color:${param.color};">보라</span></c:if>
            	<c:if test = "${param.color == 'cyan' }"><span style = "color:${param.color};">하늘</span></c:if>
            </li>
            <li>취미 :
            	${paramValues['hobby'][0] }
            	${paramValues['hobby'][1] }
            	${paramValues['hobby'][2] }
            	${paramValues['hobby'][3] }
            	${paramValues['hobby'][4] } 
            	<br/>
            	취미 :
            	<c:forEach var = "data" items = "${paramValues.hobby }"><%-- for(String data : hobby) --%>
            	${data }
            	</c:forEach>
            </li>
        </ul>
    </div>
</body>
</html>
