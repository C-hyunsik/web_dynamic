<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 이동</title>
<style>
    /* 전체 페이지 스타일 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    /* 컨테이너 스타일 */
    .container {
        background-color: white;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        text-align: center;
    }

    /* 버튼 스타일 */
    input[type="button"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 12px 24px;
        margin: 10px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
    }

    input[type="button"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

    <div class="container">
        <input type="button" value="sendRedirect" onclick="location.href='sendRedirectStart.jsp'" />
        <input type="button" value="forward" onclick="location.href='forwardStart.jsp'" />
    </div>

</body>
</html>
