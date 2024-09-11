<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0 auto;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 97vh;
}
#wrap {
	height: center;
	border: 2px solid black;
	border-radius: 15px;
	padding: 5em;
}
h3 {
	display: flex;
	text-align: center;
	align-items: center;
	justify-content: center;
	margin-bottom: -0.5em;
}
span {
	display: flex;
	font-size: 15px;
	color: black;
	text-align: center;
	justify-content: center;
	margin-bottom: 1em;
}
table {
    border-collapse: collapse;
}
th, td{
    padding: 5px;
	color: black;
	font-size: 14px;
}
div{
    color: red;
    font-size: 8pt;
    font-weight: bold;
}
input[type="text"], textarea {
	width: 350px;
	background: #ffffff;
	color: black;
	font-size: 14px;
}
input[type="button"], input[type="reset"] {
	color: #ffffff;
	background: gray;
	border-radius: 10px;
	padding: 5px 30px;
	border-style: none;
	border: 2px solid black;
}
input[type="button"]:hover, input[type="reset"]:hover {
	background: black;
	font-weight: bold;
}

</style>
</head>
<body>
<div id="wrap">
<h3>
    <img src="../image/4.jpg" width="100" height="100" alt="홈"
         onclick="location.href='../index.jsp'" style="cursor: pointer;">
</h3>
<span>글 등록</span>
<form id="boardWriteForm">
	<table border="1">
		<tr>
        	<th width="100">제목</th>
	        <td>
	            <input type="text" id="subject" name="subject" size="50" placeholder="제목 입력">
	            <div id="subjectDiv"></div>
	        </td>
    	</tr>
    	<tr>
	        <th>내용</th>
	        <td>
	            <textarea id="content" name="content" rows="15" cols="50" placeholder="내용 입력"></textarea>
	            <div id="contentDiv"></div>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	            <input type="button" value="글쓰기" id="boardWriteBtn">
	            <input type="reset" value="다시작성">
	        </td>
	    </tr>
	</table>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/boardWrite.js"></script>
</body>
</html>













