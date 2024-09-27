<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}
html {
	overflow-y: scroll;
}

#wrap{
	width: 1100px; 
	margin: 0 auto;
}

#header {
	height: 10%;
	text-align: center;
}
table{
	width: 100%;
	border-collapse: collapse;
	font-size:20px;
}
td,th{
	padding: 20px 0;
	border-top:2px solid black;
}
textarea{
	font-size:20px;
	resize: none;
}
input[type = text]{
	font-size:20px;
	height:30px;
}
input[type = button]{
	color: #ffffff;
	background: gray;
	border-radius: 10px;
	padding: 5px 30px;
	border-style: none;
	width:150px;
	height: 40px;
}
input[type = button]:hover{
	background: black;
	font-weight: bold;
}
#content{
	white-space: pre-wrap;
}
#subjectDiv, #contentDiv{
	font-size:9pt;
	color:red;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id = wrap>
		<div id = header>
			<h1>
				<img alt="남자" src="${pageContext.request.contextPath }/image/male_icon.png" width = 50 height = 50
				onclick = "location.href = '../index.do'" style="cursor: pointer;" />
				글 목록
			</h1>
			<jsp:include page = "../main/menu.jsp" />
		</div>
		<input id = "pg" type = "hidden" value = "${requestScope.pg }">
		<form>
			<table>
				<tr>
					<th width = "15%">제목</th>
					<td colspan = "3">
						<input name = subject type = text value = "${list[0].subject}" />
						<div id = subjectDiv></div>
					</td>
					<th width = "10%">작성일 : </th>
					<td width = "10%">
						<fmt:parseDate value="${list[0].logtime}" pattern="yyyy-MM-dd HH:mm:ss" var="logtimeDate" />
						<fmt:formatDate pattern = "yyyy.MM.dd" value = "${logtimeDate}"/>
					</td>
				</tr>
				<tr>
					<th>글번호 : </th>
					<td width = 30% data-seq="${list[0].seq}">${list[0].seq}</td>
					<th width = 10%>작성자 : </th>
					<td>${list[0].id}</td>
					<th>조회수 : </th>
					<td>${list[0].hit}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td id = content colspan = "5" height = "300px">
						<textarea name = content cols = "80" rows = "13">${list[0].content}</textarea>
						<div id = contentDiv></div>
					</td>
				</tr>
				<tr>
					<th><input type = "button" value ="취소" onclick = "history.go(-1)"></th>
					<td align = right colspan = "5">
						<input id = "updateBtn" type = "button" value ="수정하기" />
						<input type = "button" value ="다시작성" onclick = "window.location.reload()"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#updateBtn').click(function(){
		var seq = $('td[data-seq]').data('seq');
		var subject = $('input[name="subject"]').val();
		var content = $('textarea[name="content"]').val();
		let pg = $('#pg').val();
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		if(subject == ''){
			$('#subjectDiv').html('제목을 입력하세요');
		}
		else if(content == ''){
			$('#contentDiv').html('내용을 입력하세요');
		}
		else{
			$.ajax({
				type:'post',
				url:'./boardUpdate.do',
				data:{
					'seq':seq,
					'subject':subject,
					'content':content
					},
				dataType:'text',
				success:function(data){
					alert('글을 수정하였습니다.');
					location.href = './boardList.do?pg='+pg;
				},
				error:function(e){
					alert('글을 수정하는데 실패했습니다.');
					console.log(e);
				}
			});
		}
	});
});
</script>
</body>
</html>