<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.recent-box {
  position: fixed;
  top: 50%;
  right: 20px;
  transform: translateY(-50%);
  width: 120px;
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  z-index: 9999;
  height: 400px;
}

.recent-header {
  padding: 10px;
  font-weight: bold;
  border-bottom: 1px solid #eee;
  text-align: center;
}

.recent-list {
  list-style: none;
  margin: 0;
  padding: 10px;
}
.recent-box img {
	display: block;
	margin: 0 auto;
	margin-top: 20px;
}
</style>
</head>
<body>
<div class="card recent-box">
  <div class="card-header text-center">
    최근 본 항복
  </div>
  <c:forEach begin="0" end="2">
  	<img src="https://korean.visitseoul.net/resources/theme/images/img/visitseoul_sns_20241127.png" style="width: 100px; height: 100px;">
  </c:forEach>
</div>
</body>
</html>