<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700"
	rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>

<body>
<div class="page-header">
        <!-- page header -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h2 class="page-title">공지사항</h2>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="content auth-wrapper" style="margin-top: -17px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<main class="mypage-main">
						<h2>공지사항</h2>
						<div class="row">
							<table class="table">
							</table>
							<table class="table table-hover">
								<thead>
									<tr>
										<th width="10%" class="text-center">번호</th>
										<th width="60%" class="text-center">제목</th>
										<th width="15%" class="text-center">작성일</th>
										<th width="15%" class="text-center">조회수</th>
									</tr>
								</thead>
								<tbody>
									<!-- 공지사항 목록 반복 -->
									<c:forEach var="notice" items="${noticeList}">
										<tr style="cursor: pointer;" onclick="location.href='notice_detail?no=${notice.no}'">
											<td class="text-center">${notice.no}</td>
											<td class="text-left">
												<c:if test="${notice.isImportant}">
													<span class="badge bg-danger">중요</span>
												</c:if>
												${notice.title}
												<c:if test="${notice.isNew}">
													<span class="badge bg-success">New</span>
												</c:if>
											</td>
											<td class="text-center">${notice.createDate}</td>
											<td class="text-center">${notice.viewCount}</td>
										</tr>
									</c:forEach>
									
									<!-- 샘플 데이터 -->
									<tr style="cursor: pointer;" onclick="location.href='../notice/detail'">
										<td class="text-center">5</td>
										<td class="text-left">2025년 설 연휴 배송 안내</td>
										<td class="text-center">2025-01-15</td>
										<td class="text-center">1,234</td>
									</tr>
									<tr style="cursor: pointer;" onclick="location.href='notice_detail?no=4'">
										<td class="text-center">4</td>
										<td class="text-left">개인정보 처리방침 개정 안내</td>
										<td class="text-center">2025-01-10</td>
										<td class="text-center">856</td>
									</tr>
									<tr style="cursor: pointer;" onclick="location.href='notice_detail?no=3'">
										<td class="text-center">3</td>
										<td class="text-left">서비스 정기 점검 안내 (1월 20일)</td>
										<td class="text-center">2025-01-05</td>
										<td class="text-center">642</td>
									</tr>
									<tr style="cursor: pointer;" onclick="location.href='notice_detail?no=2'">
										<td class="text-center">2</td>
										<td class="text-left">신규 결제 수단 추가 안내</td>
										<td class="text-center">2024-12-28</td>
										<td class="text-center">421</td>
									</tr>
									<tr style="cursor: pointer;" onclick="location.href='notice_detail?no=1'">
										<td class="text-center">1</td>
										<td class="text-left">회원가입 이벤트 안내</td>
										<td class="text-center">2024-12-20</td>
										<td class="text-center">1,987</td>
									</tr>
									<tr style="cursor: pointer;" onclick="location.href='notice_detail?no=1'">
										<td class="text-center">1</td>
										<td class="text-left">회원가입 이벤트 안내</td>
										<td class="text-center">2024-12-20</td>
										<td class="text-center">1,987</td>
									</tr>
									<tr style="cursor: pointer;" onclick="location.href='notice_detail?no=1'">
										<td class="text-center">1</td>
										<td class="text-left">회원가입 이벤트 안내</td>
										<td class="text-center">2024-12-20</td>
										<td class="text-center">1,987</td>
									</tr>
									<tr style="cursor: pointer;" onclick="location.href='notice_detail?no=1'">
										<td class="text-center">1</td>
										<td class="text-left">회원가입 이벤트 안내</td>
										<td class="text-center">2024-12-20</td>
										<td class="text-center">1,987</td>
									</tr>
									<tr style="cursor: pointer;" onclick="location.href='notice_detail?no=1'">
										<td class="text-center">1</td>
										<td class="text-left">회원가입 이벤트 안내</td>
										<td class="text-center">2024-12-20</td>
										<td class="text-center">1,987</td>
									</tr>
									<tr style="cursor: pointer;" onclick="location.href='notice_detail?no=1'">
										<td class="text-center">1</td>
										<td class="text-left">회원가입 이벤트 안내</td>
										<td class="text-center">2024-12-20</td>
										<td class="text-center">1,987</td>
									</tr>
								</tbody>
							</table>
							
							<!-- 페이지네이션 -->
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
			</div>
		</div>
	</div>

</body>
</html>