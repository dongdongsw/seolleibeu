<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="/css/place/restaurant_detail.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="${fixedPage }"></jsp:include>
					<%-- <div class="detail-wrap" style="width: 1155px;">
						<div class="container">
						  <ul class="nav nav-tabs">
						    <li class="active"><a data-toggle="tab" href="#menu1">상세보기</a></li>
						    <li><a data-toggle="tab" href="#menu2">리뷰</a></li>
						  </ul>	
					</div>
	 				<div class="tab-content">
					    <div id="menu1" class="tab-pane fade in active">
					      <jsp:include page="restaurant_detail.jsp"></jsp:include>
					    </div>
					    <div id="menu2" class="tab-pane fade">
					      <jsp:include page="restaurant_review.jsp"></jsp:include>
					    </div>
					  </div>
					</div> --%>
					
					<div class="container">
					<ul class="nav nav-tabs">
					    <li class="active"><a data-toggle="tab" href="#menu1">상세보기</a></li>
					    <li><a data-toggle="tab" href="#menu2">리뷰</a></li>
					  </ul>
					
					  <div class="tab-content">

					    <div id="menu1" class="tab-pane fade in active">
					      <jsp:include page="${detailPage }"></jsp:include>
					    </div>
					    <div id="menu2" class="tab-pane fade">
					      <jsp:include page="restaurant_review.jsp"></jsp:include>
					    </div>
						</div>
					  </div>
</body>
</html>