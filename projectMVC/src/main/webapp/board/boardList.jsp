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

#container {
	margin: auto;
	width: 1100px;
	text-align: center;
	/* height: 500px; */
}

#container:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

#nav {
	margin-left: 10px;
	width: 25%;
	height: 100%;
	float: left;
}
table {
    border-collapse: collapse;
}
th, td{
    padding: 10px;
}
#currentPaging {
	border: 1px solid blue;
	color: red;
	font-size: 15pt;
	padding: 5px 8px;
	margin: 3px;
}
#paging {
	color: black;
	font-size: 15pt;
	padding: 5px 8px;
	margin: 3px;
}
span:hover {
	text-decoration: underline;
}
.subjectA:link{color:black; text-decoration:none;}
.subjectA:visited{color:black; text-decoration:none;}
.subjectA:hover{color:black; text-decoration:none; font-weight:bold;}
.subjectA:active{color:black; text-decoration:none;}
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
	<input id = "memId" type = "hidden" value = "${memId}">
	<input id = "pg" type = "hidden" value = "${requestScope.pg }">
	<table border="1" frame="hsides" rules="rows">
		<tr>
			<th width="100">글번호</th>
			<th width="400">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">조회수</th>
		</tr>

		<c:if test="${list != null}">
			<c:forEach var = "boardDTO" items = "${list}">
				<tr>
					<td align="center" data-seq = "${boardDTO.seq}">${boardDTO.seq}</td>
					<td><a href = "#" class = subjectA>${boardDTO.subject}</a></td>
					<td align="center">${boardDTO.id}
					<input type = "hidden" class = "postId" value = "${boardDTO.id}" /></td>
					<td align="center">
						<fmt:parseDate value="${boardDTO.logtime}" pattern="yyyy-MM-dd HH:mm:ss" var="logtimeDate" />
						<fmt:formatDate pattern = "yyyy.MM.dd" value = "${logtimeDate}"/>
					</td>
					<td align="center">${boardDTO.hit}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div style="text-align: center; width: 1000px; margin-top: 15px;">
	${pagingHTML }
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
function boardPaging(pg){
	location.href = "boardList.do?pg=" + pg;
}
$(document).on('click','.subjectA',function(){
	if($('#memId').val() == ''){
		alert('먼저 로그인하세요');
	}
	else{
		let seq = $(this).parent().prev().text();
		let pg = $('#pg').val();
		let memId = $('#memId').val();
		let postId = $(this).closest('tr').find('.postId').val();
		if(memId != postId){
			$.ajax({
				type:'post',
				url:'./boardHitUpdate.do',
				data:{'seq':seq},
				dataType:'text',
				success:function(){
					location.href = './boardView.do?seq=' + seq + '&pg=' + pg;
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		else{
			location.href = './boardView.do?seq=' + seq + '&pg=' + pg;
		}
	}
	
});
</script>	
</body>
</html>