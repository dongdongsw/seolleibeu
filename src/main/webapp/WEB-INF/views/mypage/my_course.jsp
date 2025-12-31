<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 코스</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700"
	rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>

	<div class="content auth-wrapper" style="margin-top: -17px;">
		<div class="container">
			<div class="row">
			  <div class="mypage-sizing">
				<div class="col-lg-9 col-md-9 col-sm-12">
					<main class="mypage-main">
						<h2>나의 코스</h2>

						<div class="info-card">
							<c:forEach begin="0" end="2">
								<div class="post-block my-course-item" style="margin-bottom:0">
									<!-- 왼쪽 이미지 -->
									<div class="course-thumb">
										<img src="images/post-img.jpg" alt="thumbnail">
									</div>

									<!-- 가운데 정보 -->
									<div class="course-info">
										<h4 class="course-title">홍대 데이트 코스</h4>
										<div class="course-meta">
											<span class="date">2025-01-05</span>
											<span class="comment">댓글 3</span><span class="comment">조회수 100</span>
										</div>
									</div>

									<!-- 오른쪽 버튼 -->
									<div class="course-actions">
										<a href="#" class="btn btn-xs">수정</a> <a href="#"
											class="btn btn-xs">삭제</a>
									</div>
								</div>
								<hr>
							</c:forEach>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="st-pagination">
									<ul class="pagination">
										<li><a href="#">Previous</a></li>
										<li><a href="#" class="active">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">Next</a></li>
									</ul>
								</div>
							</div>
						</div>

					</main>
				</div>

				<div class="col-lg-3 col-md-3 col-sm-12" style="margin-top: 80px;">
					<div class="sidenav">
						<ul class="listnone">
							<li><a href="../mypage/my_info">내 정보</a></li>
							<li><a href="../mypage/my_favorite">즐겨찾기</a></li>
							<li><a href="../mypage/my_bookmark">북마크</a></li>
							<li><a href="../mypage/my_course" class="active">나의 코스</a></li>
							<li><a href="../mypage/my_review">내가 쓴 리뷰</a></li>
							<li><a href="../mypage/my_reply">내가 쓴 댓글</a></li>
							<li><a href="#">예약 내역</a></li>
							<li><a href="../mypage/my_refund">환불 내역</a></li>
							<li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
						</ul>
					</div>
				</div>

			</div>
			</div>
		</div>
	</div>

</body>
</html>
