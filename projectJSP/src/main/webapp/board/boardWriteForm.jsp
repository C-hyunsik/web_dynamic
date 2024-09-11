<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = null;
	String id = null;
	String email = null;
	
	name = (String)session.getAttribute("memName");	//자식 = (자식)부모
	id = (String)session.getAttribute("memId");	//자식 = (자식)부모
	email = (String)session.getAttribute("memEmail");	//자식 = (자식)부모
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style type="text/css">
th{
	vertical-align: top;
}
#checkDiv{
	font-size:8pt;
	font-weight: bold;
	color:red;
}
textarea{
	white-space: pre-wrap;
}
</style>
</head>
<body>
	<h2>&star;글쓰기</h2>
	<form id = boardWriteForm>
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input id = subject type = text name = subject placeholder = 제목 />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea id = content name = content cols = 70 rows = 20 style = "resize: none;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan = 2>
					<div id = checkDiv></div>
				</td>
			</tr>
			<tr>
				<td colspan = 2 align = center>
					<input id = writeBtn type = button value = 작성하기 />
					<input type = reset value = 다시작성 />
					<input type = button value = 메인화면 onclick = "location.href = '../index.jsp'"/>
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#writeBtn').click(function(){
		$('#checkDiv').empty();
		
		if(!$('#subject').val()){
			$('#checkDiv').html('제목을 입력해주세요');
			$('#subject').focus();
			return false;
		}
		else if(!$('#content').val()){
			$('#checkDiv').html('내용을 입력해주세요');
			$('#content').focus();
			return false;
		}
		
		$.ajax({
			type: 'post',
			url:'./boardWrite.jsp',
			data:{
				'name':'<%=name%>',
				'id':'<%=id%>',
				'email':'<%=email%>',
				'subject': $('#subject').val(),
				'content': $('#content').val()
			},
			dataType:'text',
			success:function(data){
				result = data.trim();
				if(result){
					alert('글을 작성하였습니다.');
					location.href = './boardListForm.jsp?pg=1';
				}
				else{
					alert('글작성에 실패하였습니다.');
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	});
});
</script>
</body>
</html>