<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String user_id = request.getParameter("user_id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
body {
    margin: 0;
    padding: 20px;
    font-family: 'Arial', sans-serif;
    background-color: #e9f0f7; /* 연한 파란색 배경 */
    color: #333;
}

h1 {
    font-size: 2.5em;
    color: #003366; /* 다크 블루 색상 */
    text-align: center;
    margin-bottom: 20px;
}

hr {
    border: 0;
    height: 1px;
    background: #cce0ff; /* 파란색 경계선 */
    margin-bottom: 30px;
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse; /* 이중 테두리 제거 */
    background-color: #ffffff; /* 흰색 배경 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
}

th, td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #e0eaff; /* 연한 파란색 테두리 */
}

th {
    background-color: #003366; /* 다크 블루 색상 */
    color: #ffffff; /* 흰색 글씨 */
    font-size: 1.2em;
    font-weight: 600;
    text-transform: uppercase;
}

tbody tr:nth-child(even) {
    background-color: #f2f9ff; /* 아주 연한 파란색 */
}

tbody tr:hover {
    background-color: #cce0ff; /* 파란색 하이라이트 */
    cursor: pointer;
}

td {
    font-size: 1.1em;
    color: #333;
}

/* 링크 스타일 */
a:link, a:visited {
    color: #0056b3; /* 파란색 링크 */
    text-decoration: none;
}

a:hover {
    color: #003d7a; /* 더 어두운 파란색 */
    text-decoration: underline;
}

a:active {
    color: #002a5c; /* 더 어두운 파란색 */
    text-decoration: underline;
}
span{
	font-size: 1.4em;
	float:right;
	margin-right:10%;
	margin-top:-20px;
}
</style>
</head>
<body>
    <h1>전체 게시글</h1>
    <hr/>
    <span><%=user_id%>님</span>
    <table>
        <thead>
            <tr>
                <th id="post_no">번호</th>
                <th id="post_title">제목</th>
                <th id="writer">작성자</th>
                <th id="post_date">작성 날짜</th>
            </tr>
        </thead>
        <tbody id="post_list">
            <!-- 게시글 목록이 여기에 추가됩니다 -->
        </tbody>
    </table>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
    // sessionStorage에서 userId를 가져옵니다.
    let user_id = '<%=user_id%>';
    $.get('../jsp/post_list.jsp', {}, function(data){
        var items = $(data).find('item');

        items.each(function() {
            var no = $(this).find('no').text();
            var title = $(this).find('title').text();
            var writer = $(this).find('writer').text();
            var logtime = $(this).find('logtime').text();
            
            var row = '<tr onclick="viewPost(' + no + ')"><td>' + no + 
                      '</td><td><a href="javascript:void(0);">' + title + 
                      '</a></td><td>' + writer + 
                      '</td><td>' + logtime + '</td></tr>';
                      
            $('#post_list').append(row);
        });
    });

    // 게시글 번호와 user_id를 쿼리 파라미터로 전달
    window.viewPost = function(no) {
        window.location.href = '../jsp/post_view.jsp?no=' + no + '&user_id=' + encodeURIComponent(user_id);
    };
});
</script>
</body>
</html>

