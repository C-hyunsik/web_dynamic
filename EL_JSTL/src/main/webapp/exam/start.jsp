<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 이동 예제</title>
<style>
    /* 배경 어둡게 처리 */
    body {
        font-family: Arial, sans-serif;
        background-color: rgba(0, 0, 0, 0.8);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-size:1.5em;
    }

    /* 모달 폼 스타일 */
    .modal {
        background-color: white;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
        width: 600px;
    }

    .modal h2 {
        color: #333;
        margin-bottom: 20px;
    }

    .modal .description {
        margin-bottom: 30px;
        font-size: 20px;
        color: #555;
        line-height: 1.5;
    }

    /* 버튼 스타일 */
    .modal input[type="button"] {
        background-color: blue;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        margin: 10px;
        cursor: pointer;
        font-size: 20px;
        transition: background-color 0.3s;
    }

    .modal input[type="button"]:hover {
        background-color: #45a049;
    }

    /* 빨간색 텍스트 스타일 */
    .red-text {
        color: red;
        font-weight: bold;
    }

    /* 파란색 텍스트 스타일 */
    .blue-text {
        color: blue;
        font-weight: bold;
    }
</style>
</head>
<body>

    <!-- 모달 창 -->
    <div class="modal">
        <h2>페이지 이동 예제</h2>
        <div class="description">
            <span class="red-text">
                start.jsp - sendProc.jsp - sendResult.jsp 페이지 이동<br/>
                sendRedirect로 이동하므로 데이터는 공유하지 않음<br/>
                주소는 sendResult.jsp가 보임<br/>
            </span>
            <br/>
            <span class="blue-text">
                start.jsp - forwardProc.jsp - forwardResult.jsp 페이지 이동<br/>
                forward로 이동하므로 데이터는 공유함<br/>
                주소는 forwardProc.jsp로 보이지만 forwardResult.jsp가 나옴<br/>
            </span>
        </div>

        <!-- 버튼 -->
        <input type="button" value="sendRedirect" onclick="location.href='sendProc.jsp'" />
        <input type="button" value="forward" onclick="location.href='forwardProc.jsp'" />
    </div>

</body>
</html>
