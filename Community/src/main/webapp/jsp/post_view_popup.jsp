<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.dao.UserDAO" %>
<%@ page import="post.dto.PostDTO" %>
<% 
	PostDTO postDTO = null;
	try {
    	String post_no_str = request.getParameter("post_no");
    	int post_no = Integer.parseInt(post_no_str);
    
	    UserDAO userDAO = UserDAO.getInstance();
	    postDTO = userDAO.post_view(post_no);
	} catch (NumberFormatException e) {
	    out.println("잘못된 게시글 번호 형식입니다.");
	    e.printStackTrace();
	} catch (Exception e) {
	    out.println("게시글을 불러오는 도중 오류가 발생했습니다.");
	    e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=postDTO.getTitle() %></title>
<style type="text/css">
body {
    margin-left: 20px;
    background-color: #E0F7FA; /* 연한 파란색 배경 */
    color: #01579B; /* 어두운 파란색 글꼴 */
    font-family: Arial, sans-serif;
}

h1 {
    font-size: 3em;
    color: #0277BD; /* 메인 제목 어두운 파란색 */
    border-bottom: 2px solid #01579B; /* 제목 아래에 파란색 밑줄 */
    padding-bottom: 10px;
}

#post_no, #writer, #post_date {
    font-size: 1.2em;
    color: #0288D1; /* 밝은 파란색 텍스트 */
}

#post_content {
    font-size: 1.4em;
    margin-top: 15px;
    margin-left: 10px;
    color: #01579B; /* 어두운 파란색 텍스트 */
}

div {
    display: inline-block;
    width: 800px;
    height: 300px;
    border: 2px solid #0288D1; /* 밝은 파란색 테두리 */
    background-color: #B3E5FC; /* 연한 파란색 배경 */
    padding: 10px;
    box-shadow: 2px 2px 10px #81D4FA; /* 파란색 그림자 */
}
</style>
</head>
<body>
    <h1><%=postDTO.getTitle() %></h1>
    <p id="post_no">글번호: <%=postDTO.getNo() %></p>
    <p id="writer">작성자: <%=postDTO.getId() %></p>
    <p id="post_date">작성일: <%=postDTO.getLogtime() %></p>
    <div>
        <p id="post_content"><%=postDTO.getContent() %></p>
    </div>
</body>
</html>