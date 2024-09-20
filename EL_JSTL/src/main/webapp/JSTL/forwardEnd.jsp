<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 전체 페이지 스타일 */
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* 컨텐츠 박스 스타일 */
.content-box {
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    width: 100%;
}

h3 {
    color: #333;
    margin-bottom: 20px;
    font-size: 20px;
    text-align: center;
}

.result {
    font-size: 16px;
    color: #555;
    margin-bottom: 10px;
}

/* 리스트 스타일 */
.list-item {
    background-color: #e0e0e0;
    margin: 5px 0;
    padding: 10px;
    border-radius: 5px;
    font-size: 16px;
}

/* 3번째 항목 강조 */
.third-item {
    background-color: #d4edda;
    color: #155724;
    font-weight: bold;
}
</style>
</head>
<body>

    <div class="content-box">
        <h3>
            forward로 보내면 데이터는 공유한다. <br/>
            주소는 forwardStart.jsp가 보이지만 화면은 forwardEnd.jsp가 보인다.
        </h3>

        <!-- 결과 출력 -->
        <div class="result">
            결과 = ${requestScope.list }
        </div>

        <!-- 3번째 항목 강조 -->
        <div class="result third-item">
            3번째 항목 = ${requestScope.list[2] }
        </div>

        <br/>

        <!-- 리스트 항목 반복 출력 -->
        <c:forEach var="data" items="${list }">
            <div class="list-item">${data}</div>
        </c:forEach>
        <hr/>
        <c:forEach var="data" items="${list2 }">
            <div class="list-item">${data}</div>
        </c:forEach>
        <hr/>
        <c:forEach var="data" items="${list2 }">
            <div class="list-item">${data.getName()}&emsp;${data.getAge()}</div>
           <%-- JSTL에서는 메서드의 이름을 변수명처럼 사용한다. --%>
           <div class="list-item">${data.name}&emsp;${data.age}</div>
        </c:forEach>
    </div>
</body>
</html>