<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "../css/imageboardList.css">
</head>
<body>
<div id = wrap>
	<div id = header>
		<h1>
			<img alt="남자" src="${pageContext.request.contextPath }/image/male_icon.png" width = 50 height = 50
			onclick = "location.href = '../index.do'" style="cursor: pointer;" />
			이미지 목록
		</h1>
		<jsp:include page = "../main/menu.jsp" />
	</div>
	<input id = "memId" type = "hidden" value = "${memId}">
	<input id = "pg" type = "hidden" value = "${requestScope.pg }">
	<form id = "imageboardListForm">
		<table border="1" frame="hsides" rules="rows">
			<tr>
				<th width="100">
				<input id = "all_check" type = "checkbox" /> 번호
				</th>
				<th width="300">이미지</th>
				<th width="160">상품명</th>
				<th width="100">단가</th>
				<th width="150">개수</th>
				<th width="150">합계</th>
			</tr>
	
			<c:if test="${list != null}">
				<c:forEach var = "imageboardDTO" items = "${list}">
					<tr>
						<td align="center" data-seq = "${imageboardDTO.seq}">
							<input class = "seq_check" type = "checkbox" value = "${imageboardDTO.seq}"/>${imageboardDTO.seq}
						</td>
						
						<td align="center">
							<a href = "#" class = thumnail>
							<!-- src = "가상폴더의 위치" -->
								<img alt = "${imageboardDTO.imageName}" src = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-145/storage/${imageboardDTO.image1}" width = "100" height = "100"/>
							</a>
						</td>
						
						<td align="center">
							${imageboardDTO.imageName}
						</td>
						
						<td align="center">
							<fmt:formatNumber pattern = "#,###" value = "${imageboardDTO.imagePrice}"/>
						</td>
						
						<td align="center">
							<fmt:formatNumber pattern = "#,###" value = "${imageboardDTO.imageQty}"/>
						</td>
						
						<td align="center">
							<fmt:formatNumber pattern = "#,###" value = "${imageboardDTO.imagePrice * imageboardDTO.imageQty}"/>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<input type = "button" value = "선택삭제" id = "deleteBtn"/>
		<div id = pagingWrap style="float:right; text-align: left; width: 600px; margin-top: 15px;">
		${pagingHTML }
		</div>
	</form>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
function imageboardPaging(pg){
	location.href = "imageboardList.do?pg=" + pg;
}
$(document).on('click','.thumnail',function(){
	if($('#memId').val() == ''){
		alert('먼저 로그인하세요');
	}
	else{
		let seq = $(this).parent().prev().text();
		let pg = $('#pg').val();
		location.href = './imageboardView.do?seq=' + seq + '&pg=' + pg;
	}
});
$(function(){
	$('#all_check').change(function(){
		let isChk = $(this).is(':checked')
		//$('.hobby_check').attr('checked',isChk)
		$('.seq_check').prop('checked',isChk)
	});
	
	$('.seq_check').click(function(){
		let checkVal = $('input[class = "seq_check"]:checked').length;
		let totalCheck = $('input[class = "seq_check"]').length
		if(checkVal == totalCheck)
			$('#all_check').prop('checked',true);
		else
			$('#all_check').prop('checked',false);
	});
	$('#deleteBtn').click(function(){
		// 체크된 seq 값을 수집
        let selectedSeqs = [];
        $('input[class=seq_check]:checked').each(function() {
            selectedSeqs.push($(this).val());
        });

        // 삭제할 seq 값이 없으면 알림
        if (selectedSeqs.length === 0) {
            alert('삭제할 항목을 선택하세요.');
            return;
        }

        // AJAX 요청으로 삭제
        $.ajax({
            type: 'post',
            url: './imageboardDelete.do',
            data: {'selectedSeqs':selectedSeqs }, // seq 값을 콤마로 연결하여 전송
            traditional:true,
            dataType: 'text',
            success: function(data) {
                let result = data.trim();
                alert(result + '개의 항목을 삭제하였습니다.');
                location.href = "/projectMVC/imageboard/imageboardList.do?pg=1";
            },
            error: function(e) {
                console.log(e);
            }
        });
	});
});
</script>
</body>
</html>