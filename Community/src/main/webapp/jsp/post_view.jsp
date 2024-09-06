<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.dao.UserDAO" %>
<%@ page import="post.dto.PostDTO" %>

<% 
    PostDTO postDTO = null;
    String errorMessage = null;
    String user_id = request.getParameter("user_id");

    try {
        String post_no_str = request.getParameter("no");
        int post_no = Integer.parseInt(post_no_str);

        UserDAO userDAO = UserDAO.getInstance();
        postDTO = userDAO.post_view(post_no);

        if (postDTO == null) {
            errorMessage = "해당 게시글을 찾을 수 없습니다.";
        }
    } catch (NumberFormatException e) {
        errorMessage = "잘못된 게시글 번호 형식입니다.";
        e.printStackTrace();
    } catch (Exception e) {
        errorMessage = "게시글을 불러오는 도중 오류가 발생했습니다.";
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= (postDTO != null) ? postDTO.getTitle() : "게시글 조회" %></title>
<style type="text/css">
    /* 전체 페이지 스타일 */
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #e6f2ff; /* 연한 파란색 배경 */
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    /* 컨테이너 스타일 */
    .container {
        background: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 60%;
        max-width: 800px;
        min-width: 400px;
    }

    h1 {
        font-size: 2.5em;
        margin-bottom: 10px;
        color: #003366; /* 다크 블루 색상 */
        border-bottom: 2px solid #cce0ff; /* 밝은 파란색 경계선 */
        padding-bottom: 10px;
    }

    #post_no, #writer, #post_date {
        font-size: 1em;
        color: #777;
    }

    #writer, #post_date {
        display: inline-block;
    }

    #writer {
        width: calc(100% - 150px);
    }

    #post_content {
        font-size: 1.2em;
        margin-top: 20px;
        line-height: 1.6em;
        color: #003366; /* 다크 블루 색상 */
        white-space: pre-wrap; /* 개행 문자 반영 */
    }

    /* 게시글 내용 담는 div 스타일 */
    .content-box {
        background-color: #f2f9ff; /* 아주 연한 파란색 */
        padding: 20px;
        border-radius: 6px;
        border: 1px solid #cce0ff; /* 밝은 파란색 테두리 */
        margin-bottom: 20px;
        max-height: 400px;
        overflow-y: auto;
    }

    /* 에러 메시지 스타일 */
    .error-message {
        color: #cc0000; /* 에러 메시지 빨간색 */
        font-size: 1.2em;
        margin-bottom: 20px;
    }

    /* 목록보기 버튼 스타일 */
    .back-button {
        display: inline-block;
        padding: 10px 20px;
        font-size: 1.2em;
        color: #fff;
        background-color: #007bff; /* 파란색 버튼 */
        border: none;
        border-radius: 4px;
        cursor: pointer;
        text-align: center;
        transition: background-color 0.3s ease;
        text-decoration: none;
        text-align: center;
    }

    .back-button:hover {
        background-color: #0056b3; /* 다크 블루 색상 */
    }

</style>
</head>
<body>
<div class="container">
    <% if (errorMessage != null) { %>
        <p class="error-message"><%= errorMessage %></p>
    <% } else { %>
        <h1><%= postDTO.getTitle() %></h1>
        <p id="post_no">글번호: <%= postDTO.getNo() %></p>
        <p id="writer">작성자: <%= postDTO.getId() %></p>
        <p id="post_date">작성일: <%= postDTO.getLogtime() %></p>
        <br/>
        <div class="content-box">
            <p id="post_content"><%= postDTO.getContent() %></p>
        </div>
        <button id="delete" class="back-button">삭제하기</button>
        <a href="javascript:history.back()" class="back-button">목록보기</a>
    <% } %>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
    $('#delete').click(function(){
        var writer = '<%= user_id %>';
        var postNo = <%= postDTO.getNo() %>;
        
        $.post('./delete.jsp', { 'writer': writer, 'post_no': postNo }, function(data) {
        	let su = eval($(data).find('su').text());
        	if(su){
	            alert('삭제가 완료되었습니다.');
    	        window.location.href = './list.jsp?user_id=' + writer; // 목록 페이지로 이동
        	}
        	else{
            	alert('삭제 권한이 없습니다.');        		
        	}
        },'xml'
        ).fail(function(e) {
            console.log(e);
            alert('오류가 발생했습니다.')
        });
    });
});
</script>
</body>
</html>