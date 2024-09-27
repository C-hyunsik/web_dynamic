<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = stylesheet href = ../css/boardWriteForm.css>
<style type="text/css">
input[type = "file"]{
	display: none;
}
#imageLabel{
	cursor:pointer;
	color: #ffffff;
	background: gray;
	border-radius: 10px;
	padding: 5px 15px;
	border-style: none;
	border: 2px solid black;
	font-size:12px;
}
#imageLabel:hover{
	background: black;
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
			글 작성
		</h1>
		<jsp:include page = "../main/imagboardMenu.jsp" />
	</div>
	<div id="container">
		<div id = nav>
			<jsp:include page="../main/nav.jsp" />
		</div>
		<div id = section>
			<form id = "imageboardWriteForm">
			<!-- <form id="imageboardWriteForm" method = "post" enctype = "multipart/form-data"
			action = "/projectMVC/imageboard/imageboardWrite.do"> -->
			<!-- enctype = "application/x-www-form-urlencoded" -->
				<table>
					<tr>
			        	<th width="100">상품코드</th>
				        <td>
				            <input type="text" id="imageId" name="imageId" size="50" placeholder="상품코드 입력">
				            <div id="imageIdDiv"></div>
				        </td>
			    	</tr>
			    	<tr>
			        	<th width="100">상품명</th>
				        <td>
				            <input type="text" id="imageName" name="imageName" size="50" placeholder="상품명 입력">
				            <div id="imageNameDiv"></div>
				        </td>
			    	</tr>
			    	<tr>
			        	<th width="100">단가</th>
				        <td>
				            <input type="text" id="imagePrice" name="imagePrice" size="50" placeholder="단가 입력">
				            <div id="imagePriceDiv"></div>
				        </td>
			    	</tr>
			    	<tr>
			        	<th width="100">개수</th>
				        <td>
				            <input type="text" id="imageQty" name="imageQty" size="50" placeholder="개수 입력">
				            <div id="imageQtyDiv"></div>
				        </td>
			    	</tr>
			    	<tr>
				        <th>내용</th>
				        <td>
				            <textarea id="imageContent" name="imageContent" rows="10" cols="50" placeholder="내용 입력"></textarea>
				            <div id="imageContentDiv"></div>
				        </td>
				    </tr>
				    <tr>
				    	<th width="100" align = "right"></th>
				        <td>
				        	<img id = "camera" src = "../image/camera.png" alt ="카메라" width = "50" height = "50" />
				        	&emsp;
				        	<img id = "showImg" width = "70" height = "70"/>
				        	<!-- <label for = "image1" id = "imageLabel">이미지 선택</label> -->
				            <span id = "imageUrl"></span>
				            <input type = "file" id = "image1" name = "image1" />
				            <div id = "image1Div"></div>
				        </td>
				    </tr>
				    <tr>
				    	<th width="100"></th>
				        <td>
				        	<input type="submit" value="이미지 등록">
				            <input type="button" value="이미지 등록 AJax" id="imageboardWriteBtn">
				            <input type="reset" value="다시작성">
				        </td>
				    </tr>
				</table>
			</form>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/imageboardWrite.js"></script>
</body>
</html>
<!-- 
FileReader 란?
FileReader는 type이 file인 input 태그 또는 API 요청과 같은 인터페이스를 통해 
File 또는 Blob 객체를 편리하게 처리할수있는 방법을 제공하는 객체이며
abort, load, error와 같은 이벤트에서 발생한 프로세스를 처리하는데 주로 사용되며,
File 또는 Blob 객체를 읽어서 result 속성에 저장한다.

FileReader도 비동기로 동작한다.

FileReader.onload()
load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료되었을 때마다 발생한다.

processData
 - 기본값은 true
 - 기본적으로 Query String으로 변환해서 보내진다('변수=값&변수=값')
 - 파일 전송시에는 반드시 false로 해야 한다.(formData를 문자열로 변환하지 않는다)
 
contentType
  - 기본적으로 "application/x-www-form-urlencoded; charset=UTF-8"
  - 파일 전송시에는 'multipart/form-data'로 전송이 될 수 있도록 false로 설정한다
 -->