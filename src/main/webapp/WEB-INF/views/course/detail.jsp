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
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">코스 상세</h2>
						<p>
							셀레이브 유저가 직접 추천하는 데이트 코스,<br> 셀렘 가득한 데이트를 즐겨보세요!
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="title text-center">
						<h2>서울의 아름다운 밤을 바라보다</h2>
					</div>
					<div class="detail-head">
						<div>
							<i class="fa fa-bookmark-o" aria-hidden="true"></i>
						</div>
						<div style="margin-left: 30px">
							<i class="fa fa-eye" aria-hidden="true"></i>&nbsp;150
						</div>
						<div class="head-right">
							<span class="meta-date">2025.12.27</span> <span
								class="meta-author">By 작성자</span>
						</div>
					</div>
					<div class="detail-content">한양도성은 조선의 건국과 함께 축성한 성곽으로 유네스코
						세계유산 잠정 목록에 올라있다. 총 길이는 18km에 이르며 가장 아름다운 곳은 흥인지문부터 혜화문까지 낙산구간이다.
						흥인지문에서 성곽에 오르기 전에 서울디자인지원센터의 한양도성박물관에 들러 서울의 과거를 들여다보자. 해가 질 무렵
						낙산공원에서 자리 잡은 낙산정으로 가보자. 서울 한복판이 시원스레 내려다보일 것이다.</div>
					<div class="project-img mb30">
						<img src="/images/course.png" class="img-responcive"
							style="width: 100%;">
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
					style="margin-top: 70px">
					<c:forEach begin="0" end="6" varStatus="s">
						<div class="post-block" style="display: flex;">
							<div class="place-index">
								<h2>${s.count}</h2>
							</div>
							<div>
								<img
									src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=96376680-1aa2-4a72-b00d-98eee8043165"
									style="margin-right: 20px; height: 170px; height: 170px;">
							</div>
							<div class="de-place-info">
								<h2>
									<a>서울의 아름다운 밤을 바라보다.</a>
								</h2>
								<p>명소</p>
								<p>서울특별시 종로구 인사동길 49 , 6층</p>
								<h4>한양도성은 조선의 건국과 함께 축성한 성곽으로 유네스코 세계유산 잠정 목록에 올라있다. 총 길이는
									18km에 이르며 가장 아름다운 곳은 흥인지문부터 혜화문까지 낙산구간이다.</h4>
							</div>
						</div>
						<hr>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="reply.jsp"></jsp:include>
</body>

</html>