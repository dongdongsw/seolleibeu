<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.toast-container {
  position: fixed;
  bottom: 20px;
  right: 20px;
  z-index: 9999;
}

.toast {
  width: 320px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 6px 20px rgba(0,0,0,0.15);
  overflow: hidden;
  opacity: 0;
  transform: translateY(20px);
  transition: all 0.4s ease;
  pointer-events: none;
}

.toast.show {
  opacity: 1;
  transform: translateY(0);
  pointer-events: auto;
}

.toast-header {
  background: #cec8c1; 
  color: white;
  padding: 3px 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.toast-title {
  font-size: 15px;
  font-weight: bold;
}

.toast-close {
  background: transparent;
  border: none;
  color: white;
  font-size: 18px;
  cursor: pointer;
}

.toast-body {
  padding: 16px;
  font-size: 14px;
  color: #333;
}
</style>
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