<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap" rel="stylesheet">
<style type="text/css">
body{
	margin:0 auto;
	padding:0;
	font-family: 'Josefin Sans', sans-serif;
}
table{
	border-collapse: collapse;
}
#wrap {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
#bannerimg{
	display: flex;
	width:70%;
	margin:0 auto;
	justify-content: center;
}
#menuSearch{
	display:flex;
	width:1200px;
	margin: 0 auto;
	height: 50px;
}
#dumy{
	display: inline-block;
	width:33%;
	height:50px;
	background: #8a2be2;
}
#menuWrap{
	height:50px;
	background: #8a2be2;
	color:white;
	display:inline-block;
	align-items: center;
	width:33%;
}
#menu ul{
	display:inline-block;
	justify-content: center;
	float:center;
	text-align: center;
	font-size: 20px;
	margin-top:10px;
}
#menu li{
	display: inline-block;
	justify-content: center;
	padding:0 20px;
}
#search{
	display:inline-block;
	float:right;
	width:30%;
	height:50px;
	background: #8a2be2;
}
#lookup{
	margin-top:7px;
	float:right;
	width:150px;
	height:30px;
	font-size:16px;
}
#searchimg{
	float:right;
	cursor:pointer;
	height:50px;
}
#container {
    display: flex;
    justify-content: flex-start;
    width: 100%;
    margin-left:37%;
    margin-top: 20px;
}
#nav {
    width: 15%;
    height: 1000px;
    margin-right: 20px;  /* 오른쪽에 약간의 여백 추가 */
}
#btnInfo{
	display:flex;
	border-top:2px solid black;
	border-bottom:2px solid black;
	padding:10px;
	height:300px;
	align-items: center;
}
#section {
    width: 47%;
    height: 1000px;
}
#loginWrap{
	display: flex;
	padding-top:30px;
}
#iconWrap{
	display: inline-block;
	width: 110px;
	height: 110px;
}
#loginInfo{
	display: inline-block;
}
#nameWrap{
	margin-top: 20px;
}
#dateWrap{
	font-size:14px;
}
#Btn{
	margin:0 auto;
	justify-content: center;
	align-items: center;
}
#Btn>input, #writeBtn{
	width: 200px;
	height: 50px;
	margin:20px 0;
	font-size:30px;
	color:white;
	background: #8a2be2;
	border-radius: 10px;
	border:none;
	cursor:pointer;
}
#userInfo{
	font-size:20px;
	border-top:2px solid black;
	border-bottom:2px solid black;
	height: 300px;
}
#rankInfoWrap{
	display:flex;
	justify-content: center;
}
#rankInfo{
	font-size: 16px;
}
#rankInfo>input{
	margin-top:20px;
}
#boardInfoWrap{
	border-bottom:2px solid black;
}
#notice{
	border-bottom:1px solid #E2E2E2;
	font-weight: bold;
}
#boardThum>a:nth-child(1){
	font-size:1.2em;
	font-weight:bold;
}
a:link{color: black; text-decoration:none;}
a:visited{color : black; text-decoration:none;}
a:hover{color : black; text-decoration:underline;}
a:active{color : black; text-decoration:none;}
#boardThum>ul{
	padding-left:10px;
	list-style: none;
	margin-top:0;
	margin-bottom:5px;
	line-height: 20px;
}
#boardThum>ul>li{
	font-size:1em;
}
#welcome{
	border: 4px solid #E2E2E2;
	margin-bottom: 20px;
}
#tablehead{
	border-bottom: 2px solid black;
	padding-bottom: 10px;
	font-size: 2em;
}
#allPost{
	border-bottom: 2px solid black;
	color:#CCCCCC;
	vertical-align: bottom;
	padding-bottom: 5px;
}
#allPost a:link{color: #CCCCCC; text-decoration:none;}
#allPost a:visited{color : #CCCCCC; text-decoration:none;}
#allPost a:hover{color : #CCCCCC; text-decoration:underline;}
#thumtable td{
	border-bottom: 1px solid #e2e2e2;
	font-size: 20px;
	padding: 10px 0;
}
#thumtable td:nth-child(2){
	font-weight: bold;
}
</style>
</head>
<body>
<c:set var = "context" value = "${pageContext.request.contextPath }" />
	<div id = header>
		<jsp:include page = "./main/top.jsp" />
	</div>
	<div id = bannerimg>
		<img src = "${context}/image/banner.png" alt = 배너 width = 1200 height = 400 
		onclick = "location.href = '${context}/index.do'"/>
	</div>
	<div id = wrap>
		<div id = menuSearch>
			<div id = dumy></div>
			<div id = menuWrap>
				<div id = menu>
					<jsp:include page = "${context}/main/menu.jsp" />
				</div>
			</div>
			<div id = search>
				<input id = lookup type = text name = lookup />
			</div>
			<div id = lookupBtn>
				<img id = searchimg src = "${context}/image/Search_Button.png" alt = 검색버튼 />
			</div>
		</div>
		<div id = container>
			<div id = nav>
				<jsp:include page = "${context}/main/userInfo.jsp" />
				<div id = boardInfoWrap>
					<div id = notice >
						<h3>게시판</h3>
					</div>
					<div id = boardThum>
						<a href = "">※공지사항</a><br/>
						<a href = "">맛집리스트</a>
						<ul>
							<li>└<a href = "#"> 한식</a></li>
							<li>└<a href = "#"> 중식</a></li>
							<li>└<a href = "#"> 양식</a></li>
							<li>└<a href = "#"> 카페/디저트</a></li>
						</ul>
						<a href = "">질문게시판</a>
					</div>
				</div>
			</div>
			<div id = section>
				<div id = welcome>
					<img src = "${context}/image/banner.png" alt = 환영배너 width = 100% height = 300 />
				</div>
				<table id = thumtable width = 100% >
					<tr>
						<th id = tablehead colspan = 4 align = left>최신게시글</th>
						<th id = allPost align = right><a href = #>전체글보기></a></th>
					</tr>
					<!-- 이 부분에 최신 게시글이 들어감 10개 가량 -->
					<tr>
						<td align = center width = 10%>1</td>
						<td width = 40%><a href = #>1</a></td>
						<td width = 20%>aa</td>
						<td align = center width = 10%>2024.09.13</td>
						<td align = center width = 10%>111</td>
					</tr>
					<tr>
						<td align = center width = 10%>2</td>
						<td width = 40%><a href = #>2</a></td>
						<td width = 20%>bb</td>
						<td align = center width = 10%>2024.09.13</td>
						<td align = center width = 10%>222</td>
					</tr>
					<tr>
						<td align = center width = 10%>3</td>
						<td width = 40%><a href = #>3</a></td>
						<td width = 20%>cc</td>
						<td align = center width = 10%>2024.09.13</td>
						<td align = center width = 10%>333</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
</body>
</html>