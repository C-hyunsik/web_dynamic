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
input{
	color: #ffffff;
	background: gray;
	border-radius: 10px;
	padding: 5px 30px;
	border-style: none;
	width:150px;
	height: 40px;
}
input:hover{
	background: black;
	font-weight: bold;
}
#image {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
}

#image img {
    border: 2px solid #ccc;
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

#image img:hover {
    transform: scale(1.05);
    box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
}

#contentWrap {
    background-color: #f9f9f9;
    border: 1px solid #dcdcdc;
    border-radius: 10px;
    padding: 15px;
    font-size: 18px;
    line-height: 1.6;
    color: #333;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.05);
}

#contentWrap:hover {
    background-color: #fff;
    box-shadow: 3px 3px 12px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

</style>
</head>
<body>
	<div id = wrap>
		<div id = header>
			<h1>
				<img alt="남자" src="${pageContext.request.contextPath }/image/male_icon.png" width = 50 height = 50
				onclick = "location.href = '../index.do'" style="cursor: pointer;" />
				이미지 상세정보
			</h1>
			<jsp:include page = "../main/menu.jsp" />
		</div>
		<form id = imageboardViewForm>
		<input type = "hidden" name = "pg" value = "${requestScope.pg }">
		<input type = "hidden" name = "seq" value = "${list[0].seq}">
		<input type = "hidden" id = "pwd" value = "${memPwd }">
			<table>
				<tr>
					<th width = "15%">상품명</th>
					<td colspan = "5">${list[0].imageName}</td>
					<th width = "10%">작성일 : </th>
					<td width = "10%">
						<fmt:formatDate pattern = "yyyy.MM.dd" value = "${list[0].logtime}"/>
					</td>
				</tr>
				<tr>
					<th>번호 : </th>
					<td width = 15% data-seq="${list[0].seq}">${list[0].seq}</td>
					
					<th width = 10%>상품코드 : </th>
					<td>${list[0].imageId}</td>
					
					<th>단가 : </th>
					<td>
						<fmt:formatNumber pattern = "#,###원" value = "${list[0].imagePrice}"/>
					</td>
					
					<th>개수 : </th>
					<td>
						<fmt:formatNumber pattern = "#,###개" value = "${list[0].imageQty}"/>
					</td>
					
				</tr>
				<tr>
					<th>이미지</th>
					<th width = 25%>
						<img alt = "${list[0].imageName}" src = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-145/storage/${list[0].image1}" width = "200" height = "200"/>
					</th>
					<th>내용</th>
					<td id = content colspan = "5" height = "300px"><div id = contentWrap>${list[0].imageContent}</div></td>
				</tr>
				<tr>
					<th><input type = "button" value ="목록" onclick = "location.href = './imageboardList.do?pg=${requestScope.pg}'"></th>
					<td align = right colspan = "7">
						<c:if test = "${memId == 'admin'}">
							<input id = deleteBtn type = "button" value ="글 삭제" />
							<input id = updateBtn type = "button" value ="글 수정" 
							onclick = "location.href = './imageboardUpdateForm.do?seq=${list[0].seq}'"/>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>