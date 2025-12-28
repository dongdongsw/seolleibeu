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
						<h1 class="page-title">추천 코스</h1>
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
					<div class="row">
						<div class="list-head">
							<div class="widget widget-search col-md-3"
								style="margin-left: 30px;">
								<form>
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="코스를 검색하세요." aria-describedby="basic-addon2">
										<span class="input-group-addon" id="basic-addon2"> <i
											class="fa fa-search"></i></span>
									</div>
								</form>
							</div>
							<div class="col-md-9 text-right head" style="margin-top: 30px;">
								<h4>
									<a>최신순</a>
								</h4>
								&nbsp;&nbsp;<span style="margin-bottom: 10px">|</span>&nbsp;&nbsp;
								<h4>
									<a>인기순</a>
								</h4>
							</div>
						</div>
						<c:forEach begin="0" end="4">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="post-block" style="display: flex;">
									<div>
										<img
											src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=96376680-1aa2-4a72-b00d-98eee8043165"
											style="margin-right: 20px; height: 300px; height: 300px;">
									</div>
									<div>
										<h1>
											<a href="/course/detail" class="title">서울의 아름다운 밤을 바라보다.</a>
										</h1>
										<p class="meta">
											<span class="meta-date"> On April 24, 2020 </span> <span
												class="meta-author">By <a href="#" class="meta-link">작성자</a></span>
										</p>
										<div class="place-tag">
										  <c:forEach begin="0" end="6">
										    <span>장소장소장소</span>
										  </c:forEach>
											
										</div>
										<div class="post-content">
											<p>한양도성은 조선의 건국과 함께 축성한 성곽으로 유네스코 세계유산 잠정 목록에 올라있다. 총 길이는
												18km에 이르며 가장 아름다운 곳은 흥인지문부터 혜화문까지 낙산구간이다. 흥인지문에서 성곽에 오르기 전에
												서울디자인지원센터의 한양도성박물관에 들러 서울의 과거를 들여다보자. 해가 질 무렵 낙산공원에서 자리 잡은
												낙산정으로 가보자. 서울 한복판이 시원스레 내려다보일 것이다.</p>
											<div class="text-right">
												<a href="/course/detail" class="btn btn-default right">자세히 보기</a>
											</div>
										</div>
									</div>
								</div>
								<hr>
							</div>
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>