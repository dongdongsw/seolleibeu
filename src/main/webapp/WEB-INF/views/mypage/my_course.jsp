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
<style type="text/css">
a {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="content auth-wrapper" style="margin-top: -17px;">
		<div class="container" id="my_course">
			<div class="row">
			  <div class="mypage-sizing">
				<div class="col-lg-9 col-md-9 col-sm-12">
					<main class="mypage-main">
						<h2>나의 코스</h2>
						<div class="info-card text-center" style="margin: 0; padding: 0" v-if="store.list == ''">
							<p style="margin-top: 250px;">등록된 코스가 없습니다.</p>
						</div>
						<div class="info-card" style="margin: 0; padding: 0" v-if="store.list !== ''">
							<div v-for="(vo, index) in store.list" :key="index">
								<div class="post-block my-course-item"  style="margin-top: 30px">
									<!-- 왼쪽 이미지 -->
									<div class="course-thumb">
										<img :src="vo.pvo.thumbnail" style="width:80px; height: 80px">
									</div>

									<!-- 가운데 정보 -->
									<div class="course-info">
										<h4 class="course-title"><a :href="'/course/detail?cno='+vo.cno" style="color:black;">{{vo.title}}</a></h4>
										<div class="course-meta">
											<span class="date">{{vo.dbday}}&nbsp;&nbsp;</span>
											<span class="comment">댓글 {{vo.replycount}}</span>
											&nbsp;&nbsp;<span class="comment">조회수 {{vo.hit}}</span>
											&nbsp;&nbsp;<span class="comment">{{vo.is_public==='Y'?'공개':'비공개'}}</span>
										</div>
									</div>

									<!-- 오른쪽 버튼 -->
									<div class="course-actions">
										<a :href="'/course/update?cno='+vo.cno" class="btn btn-xs">수정</a> 
										<a @click="store.courseDelete(vo.cno)" class="btn btn-xs">삭제</a>
									</div>	
								</div>
								<hr style="margin:0">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="st-pagination">
									<ul class="pagination">
										<li v-if="store.startPage>1" @click="store.movePage(store.startPage-1)">
											<a class="page-link">이전</a>
										</li>
										<li v-for="i in store.range" >
											<a :class="i==store.curpage?'page-link active':'page-link'" @click="store.movePage(i)">{{i}}</a>
										</li>
										<li v-if="store.endPage<store.totalpage">
											<a class="page-link" @click="store.movePage(store.endPage+1)">다음</a>
										</li>
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
							<li><a href="../mypage/my_reserve">예매 내역</a></li>
							<li><a href="../mypage/my_refund">환불 내역</a></li>
							<li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
						</ul>
					</div>
				</div>

			</div>
			</div>
		</div>
	</div>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/course/myCourseStore.js"></script>
	<script src="/vuejs/course/myCourse.js"></script>
</body>
</html>
