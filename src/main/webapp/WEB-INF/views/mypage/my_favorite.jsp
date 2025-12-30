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

	<div class="content auth-wrapper">
		<div class="container">
			<div class="row">
				<div class="mypage-sizing">
					<div class="col-lg-9 col-md-9 col-sm-12">
						<main class="mypage-main">
							<h2>나의 즐겨찾기</h2>
	
							<div class="row" style="margin-top: 30px;">
								<c:forEach begin="0" end="7">
					                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
					                    <div class="project-img mb30 thumbnail">
					                        <a href="/place/restaurant/detail" class="imghover">
					                        	<img src="/images/project-pic-1.jpg" class="img-responsive" alt="Interior Design Website Templates Free Download">
					                        </a>
					                    </div>
					                    <h4 class="text-center" style="position:absolute; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;
					                    	left: 10%; top:85%; width: 80%">
					                    	제목제목제목제목제목제목제목제목제목제목제목
					                    </h4>
					                    <a><i class="fa fa-star" style="position:absolute; left:77%; top:7%; padding-top: 1px; font-size: 22px; color: gold;"></i></a>
					                </div>
					                
				                </c:forEach>
				            </div>
				            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 25px;">
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
						</main>
					</div>

					<div class="col-lg-3 col-md-3 col-sm-12" style="margin-top: 80px;">
						<div class="sidenav">
							<ul class="listnone">
								<li><a href="../mypage/my_info">내 정보</a></li>
								<li><a href="../mypage/my_favorite"  class="active">즐겨찾기</a></li>
								<li><a href="../mypage/my_bookmark">북마크</a></li>
								<li><a href="../mypage/my_course">나의 코스</a></li>
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
			
			<div class="st-pagination" style="position: absolute; left:52.5%; top: 19%;">
				<ul class="pagination">
					<li><a href="#" style="border-radius: 15px;" class="active">음식점</a></li>
					<li><a href="#" style="border-radius: 15px;">문화/체험</a></li>
					<li><a href="#" style="border-radius: 15px;">관광명소</a></li>
				</ul>
			</div>
			
		</div>
	</div>
	
</body>
</html>
