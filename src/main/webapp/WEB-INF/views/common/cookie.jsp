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
		<c:forEach begin="0" end="2">
			<a href="#"> 
				<img src="https://korean.visitseoul.net/resources/theme/images/img/visitseoul_sns_20241127.png"
					 style="width: 130px; height: 100px;">
			</a>
		</c:forEach>
	</div>
</body>
</html>