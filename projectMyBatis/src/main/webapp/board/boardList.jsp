<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="board.bean.BoardPaging"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
	int pg = Integer.parseInt(request.getParameter("pg"));

	//1페이지당 5개씩
	int endNum = pg * 5;
	int startNum = endNum - 4;
	
	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	List<BoardDTO> list = boardDAO.boardList(startNum, endNum);
	
	//페이징 처리
	int totalA = boardDAO.getTotalA();
	
	BoardPaging boardPaging = new BoardPaging();
	boardPaging.setCurrentPage(pg);
	boardPaging.setPageBlock(3);
	boardPaging.setPageSize(5);
	boardPaging.setTotalA(totalA);
	
	boardPaging.makePagingHTML();
	
	request.setAttribute("list", list);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
</style>
</head>
<body>
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
					<td align="center">${boardDTO.seq}</td>
					<td>${boardDTO.subject}</td>
					<td align="center">${boardDTO.id}</td>
					<td align="center">${boardDTO.logtime}</td>
					<td align="center">${boardDTO.hit}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div style="text-align: center; width: 1000px; margin-top: 15px;">
		<%=boardPaging.getPagingHTML() %>
	</div>
	
<script type="text/javascript">
function boardPaging(pg){
	location.href = "boardList.jsp?pg=" + pg;
}
</script>	
</body>
</html>