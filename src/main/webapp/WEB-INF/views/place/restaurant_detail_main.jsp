<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/css/place/restaurant_detail.css" rel="stylesheet" />
</head>
<body>

	<jsp:include page="restaurant_detail_header.jsp"></jsp:include>
	
	<jsp:include page="${restaurant_jsp}"></jsp:include>
	
</body>
</html>