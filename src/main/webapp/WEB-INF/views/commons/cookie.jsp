<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/course.css" rel="stylesheet">
</head>
<body>
	<div class="card recent-box">
		<div class="card-header text-center">
			<h4>최근 본 장소</h4>
		</div>
 		<c:forEach var="vo" items="${cookieList }">
			<a href="/place/${vo.category=='식당' ? 'restaurant': 
			(vo.type=='전시'||vo.type=='연극/뮤지컬'||vo.type=='액티비티' ? 'culture' : 'attraction') }/detail?pno=${vo.pno}"> 
				<img src="${vo.thumbnail }" title="${vo.name }"
					 style="width: 130px; height: 100px;">
			</a>
		</c:forEach> 
	</div>
</body>
</html>