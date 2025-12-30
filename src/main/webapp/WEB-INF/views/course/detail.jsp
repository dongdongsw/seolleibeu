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
							<i class="fa fa-bookmark-o" aria-hidden="true"></i> <i
								class="fa fa-bookmark" aria-hidden="true"></i>
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
			</div>
		</div>
		<div class="container course-place-info">
			<div class="row">
				<div class="mc-wrap" style="margin: 0 15px 0 15px">
					<button class="mc-btn prev" aria-label="prev">‹</button>
					<div class="mc-viewport" id="carousel">
						<c:forEach begin="0" end="15" varStatus="s">
							<div class="mc-card">
								<div class="place-index">
									<h2>${s.count}</h2>
								</div>
								<div class="card-img"
									style="background-image: url('https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=96376680-1aa2-4a72-b00d-98eee8043165')">
									<div class="card-text">
										<h3>서울 서울서울</h3>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<button class="mc-btn next" aria-label="next">›</button>
				</div>
			</div>
			<div class="row">
				<div class="place-detail">
					<div class="place-detail-title text-center">
					  <div class="place-index second">
							<h2>1</h2>
					</div>
					&nbsp;&nbsp;
					<div>
						<h2>서울 서울서울</h2>
					</div>
						
					</div>
					<div class="place-detail-address text-center">
						<p>서울특별시 동교동 쌍용구 23 | 명소</p>
					</div>
					
					<div class="place-detail-img text-center">
						<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=96376680-1aa2-4a72-b00d-98eee8043165" width="800" height="450">
					</div>
					<div class="place-detail-content">	 
					   한양도성은 조선의 건국과 함께 축성한 성곽으로 유네스코 세계유산 잠정 목록에 올라있다. 총 길이는
									18km에 이르며 가장 아름다운 곳은 흥인지문부터 혜화문까지 낙산구간이다.
									한양도성은 조선의 건국과 함께 축성한 성곽으로 유네스코 세계유산 잠정 목록에 올라있다. 총 길이는
									18km에 이르며 가장 아름다운 곳은 흥인지문부터 혜화문까지 낙산구간이다.
									한양도성은 조선의 건국과 함께 축성한 성곽으로 유네스코 세계유산 잠정 목록에 올라있다. 총 길이는
									18km에 이르며 가장 아름다운 곳은 흥인지문부터 혜화문까지 낙산구간이다.
					</div>
					<div class="place-detail-btn text-right">
						<button>자세히 보기</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="reply.jsp"></jsp:include>
	<script src="/js/course_detail.js"></script>
</body>

</html>