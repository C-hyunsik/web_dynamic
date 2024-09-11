<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	margin:0 auto;
	padding:0;
}
#wrap {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
#top ul{
	list-style: none;
	margin:0;
	padding-right:300px;
}
#top{
	color:white;
	padding-top:10px;
	width:100%;
	font-size:16px;
	height: 35px;
	background: black;
}
#top li{
	display: inline-block;
	float:right;
	padding: 0 10px;
}
#top span{
	float:right;
	margin-right:10%;
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
	background: black;
}
#menuWrap{
	height:50px;
	background: black;
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
	background: black;
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
#contentWrap {
    display: flex;
    justify-content: flex-start;
    width: 100%;
    margin-left:37%;
    margin-top: 20px;
}
#userInfo {
    width: 15%;
    height: 1000px;
    background-color: lightgray;
    margin-right: 20px;  /* 오른쪽에 약간의 여백 추가 */
}
#thum {
    width: 47%;
    height: 1000px;
    background-color: lightgray;
}
a:link{color: white; text-decoration:none;}
a:visited{color : white; text-decoration:none;}
a:hover{color : cyan; text-decoration:underline;}
a:active{color : purple; text-decoration:none;}
#loginWrap{
	display: flex;
}
#iconWrap{
	display: inline-block;
	width: 110px;
	height: 110px;
}
#icon{
	padding: 10px 0 0 10px;
}
#loginInfo{
	display: inline-block;
}
#loginInfo>span{
	padding: 3px 10px;
}
</style>
</head>
<body>
	<div id = top>
		<a href = #><span>로그인</span></a>
		<ul>
			<li><a href = #>카페홈</a></li>
			<li><a href = #>글쓰기</a></li>
			<li><a href = #>내정보</a></li>
		</ul>
	</div>
	<div id = bannerimg>
		<img src = ./image/1.jpg alt = 배너 width = 1200 height = 400 />
	</div>
	<div id = wrap>
		<div id = menuSearch>
		<div id = dumy></div>
			<div id = menuWrap>
				<div id = menu>
					<ul>
						<li>맛집추천</li>
						<li>게시판</li>
						<li>회원정보</li>
					</ul>
				</div>
			</div>
			<div id = search>
				<input id = lookup type = text name = lookup />
			</div>
			<div id = lookupBtn>
				<img id = searchimg src = ./image/Search_Button.png alt = 검색버튼 />
			</div>
		</div>
		<div id = contentWrap>
			<div id = userInfo>
				<div id = loginWrap>
					<div id = iconWrap>
						<img id = icon src = ./image/banana.jpeg alt = icon width = 100 height = 100 />
					</div>
					<div id = loginInfo>
						<span>~~님</span><br>
						<span>YYYY년 MM월 DD일 가입</span>
					</div>
				</div>
				<div id = rankInfoWrap>
					<span>등급 : </span>
					<span>내가 쓴 글 수 : </span>
					<input type = button value = 글쓰기>
				</div>
			</div>
			<div id = thum>
				asdasd
			</div>
		</div>
	</div>
</body>
</html>