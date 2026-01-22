<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/toast.css" rel="stylesheet">
<script>
	const uno='${sessionScope.uno}'
</script>
</head>
<body>
	<div class="toast-container">
		<div id="reserveToast" class="toast">
			<div class="toast-header">
				<strong class="toast-title">알림</strong>
				<button class="toast-close" onclick="hideToast()">×</button>
			</div>
			<div class="toast-body" id="toastMsg"></div>
		</div>
	</div>
</body>
</html>