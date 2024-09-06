<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String user_id = request.getParameter("user_id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글쓰기</title>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8; /* 연한 파란색 배경 */
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

form#post_write {
    background-color: #ffffff; /* 흰색 배경 */
    border: 2px solid #007bff; /* 진한 파란색 테두리 */
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    max-width: 500px;
    width: 100%;
}

legend {
    font-size: 1.6em;
    color: #007bff; /* 진한 파란색 */
    margin-bottom: 20px;
}

p {
    margin: 10px 0;
    color: #333333; /* 진한 회색 */
}

input#post_title {
    width: 90%;
    padding: 10px;
    font-size: 1.4em;
    border: 1px solid #007bff; /* 진한 파란색 테두리 */
    border-radius: 5px;
}

textarea {
    width: 100%;
    padding: 10px;
    font-size: 1.4em;
    border: 1px solid #007bff; /* 진한 파란색 테두리 */
    border-radius: 5px;
    box-sizing: border-box;
    resize: vertical;
}

input[type="submit"], input[type="button"] {
    background-color: #007bff; /* 진한 파란색 배경 */
    color: #ffffff; /* 흰색 텍스트 */
    border: none;
    border-radius: 5px;
    padding: 10px;
    font-size: 1.2em;
    cursor: pointer;
    margin-top: 10px;
    margin-right: 10px;
}

input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #0056b3; /* 더 어두운 파란색 */
}

input[type="button"] {
    background-color: #6c757d; /* 회색 배경 */
}

input[type="button"]:hover {
    background-color: #5a6268; /* 더 어두운 회색 */
}
</style>
</head>
<body>
    <form id="post_write">
        <fieldset>
            <legend>게시글쓰기</legend>
            <input type="hidden" name="user_id" value="<%=user_id %>" />
            <p>제목</p>
            <input type="text" id="post_title" name="post_title" placeholder="제목" />
            <br/>
            <p>내용</p>
            <textarea rows="15" cols="40" name="post_content" placeholder="최대 300자"></textarea>
            <br/>
            <input type="submit" value="작성하기">
            <input type="button" value="뒤로가기" onclick="window.close();">
        </fieldset>
    </form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
    $('input[type="submit"]').click(function(event){
        event.preventDefault();
        
        $.post('./post_write.jsp',
                $('#post_write').serialize(),
                function(data){
                result = eval($(data).find('result').text());
                console.log(result);
                if(result){
                    alert('글 작성이 완료되었습니다.');
                    window.close();
                }
            }).fail(function(e){
                console.log(e);
            });
    });
});
</script>
</body>
</html>