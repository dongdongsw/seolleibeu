<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 리뷰</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700"
	rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>

	<div class="content auth-wrapper" style="margin-top: -17px;" id="review_list">
		<div class="container">
			<div class="row">
			  <div class="mypage-sizing">
				<div class="col-lg-9 col-md-9 col-sm-12">
					<main class="mypage-main">
						<div class="search search-row">
						  <h2 class="mypage-title">내가 쓴 리뷰</h2>
						  <div class="input-group reply-search" style="margin-top: -40px;">
						    <input type="text" class="form-control"
						           placeholder="검색어를 입력하세요.">
						    <span class="input-group-addon">
						      <i class="fa fa-search"></i>
						    </span>
						  </div>
						</div>

						<div class="info-card">
								<div class="post-block my-course-item" style="margin-bottom:0">
									<!-- 왼쪽 이미지 -->
									<div class="course-thumb">
										<img src="images/post-img.jpg" alt="thumbnail">
									</div>
									<!-- 가운데 정보 -->
									<div class="mypage-reply">
										<h4 class="reply-title">홍대 데이트 코스</h4>
										<p style="margin-bottom: 10px">정말 좋은곳입니다.</p>
										<div class="course-meta">
											리뷰 쓴 날짜 : <span class="date">2025-01-05</span>
										</div>
									</div>
									<!-- 오른쪽 버튼 -->
									<div class="course-actions">
										<a href="/mypage/review_update" class="btn btn-xs">수정</a> <a href="#"
											class="btn btn-xs" data-toggle="modal" data-target="#myModal">삭제</a>
									</div>
								</div>
								<hr>
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
				            <li><a href="../mypage/my_course">나의 코스</a></li>
				            <li><a href="../mypage/my_review" class="active">내가 쓴 리뷰</a></li>
				            <li><a href="../mypage/my_reply">내가 쓴 댓글</a></li>
				            <li><a href="../mypage/my_reserve">예매 내역</a></li>
				            <li><a href="../mypage/my_refund">환불 내역</a></li>
				            <li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
						</ul>
					</div>
				</div>

			</div>
			</div>
		</div>
		<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h3 class="modal-title">리뷰 삭제</h3>
		      </div>
		      <div class="modal-body">
		        <p>리뷰를 삭제하시겠습니까?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger">삭제</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/vue-demi"></script>
<script src="https://unpkg.com/pinia@2/dist/pinia.iife.prod.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/vuejs/axios.js"></script>
<script src="/vuejs/place/review.js"></script>
</body>
</html>
