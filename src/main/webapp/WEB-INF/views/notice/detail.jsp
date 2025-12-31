<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<style>
	.notice-detail-header {
		border-bottom: 2px solid #333;
		padding-bottom: 20px;
		margin-bottom: 20px;
	}
	.notice-title {
		font-size: 24px;
		font-weight: bold;
		margin-bottom: 15px;
		color: #333;
	}
	.notice-info {
		color: #666;
		font-size: 14px;
	}
	.notice-info span {
		margin-right: 20px;
	}
	.notice-content {
		min-height: 400px;
		padding: 30px 20px;
		line-height: 1.8;
		font-size: 15px;
		color: #333;
	}
	.notice-footer {
		border-top: 1px solid #ddd;
		padding-top: 20px;
		margin-top: 40px;
	}
	.btn-list {
		float: right;
	}
	.notice-nav {
		margin-top: 30px;
		border-top: 1px solid #ddd;
	}
	.notice-nav-item {
		padding: 15px 0;
		border-bottom: 1px solid #eee;
	}
	.notice-nav-label {
		font-weight: bold;
		width: 80px;
		display: inline-block;
	}
	.notice-nav-title {
		color: #333;
		text-decoration: none;
	}
	.notice-nav-title:hover {
		color: #007bff;
		text-decoration: underline;
	}
	.back {
		background-color: #ffffff;
		padding: 40px;
		border-radius: 8px;
		box-shadow: 0 2px 4px rgba(0,0,0,0.1);
	}
	body {
		background-color: #f8f6f2;
	}
</style>
</head>

<body>

	<div class="content auth-wrapper" style="margin-top: 30px;">
		<div class="container back">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<main class="mypage-main">
						<div class="notice-detail-header">
							<div class="notice-title">
								<c:if test="${notice.isImportant}">
									<span class="badge bg-danger">중요</span>
								</c:if>
								${notice.title}
								<!-- 샘플 제목 -->
								<span class="badge bg-danger">중요</span>
								2025년 설 연휴 배송 안내
							</div>
							<div class="notice-info">
								<span><i class="fa fa-user"></i> 관리자</span>
								<span><i class="fa fa-calendar"></i> 2025-01-15</span>
								<span><i class="fa fa-eye"></i> 조회수 1,234</span>
							</div>
						</div>

						<div class="notice-content">
							${notice.content}
							<!-- 샘플 내용 -->
							<p>안녕하세요. 고객 여러분</p>
							<br>
							<p>2025년 설 연휴 기간 동안의 배송 일정을 안내드립니다.</p>
							<br>
							<p><strong>[휴무 기간]</strong></p>
							<p>2025년 1월 28일(화) ~ 1월 30일(목)</p>
							<br>
							<p><strong>[배송 안내]</strong></p>
							<ul>
								<li>1월 27일(월) 오후 2시 이후 주문 건은 1월 31일(금)부터 순차 발송됩니다.</li>
								<li>배송 지연이 예상되오니 미리 주문해 주시기 바랍니다.</li>
								<li>긴급 문의는 고객센터 이메일로 남겨주시면 휴무 후 순차 답변드리겠습니다.</li>
							</ul>
							<br>
							<p><strong>[고객센터 운영]</strong></p>
							<p>설 연휴 기간 중 고객센터 운영이 중단되며, 1월 31일(금)부터 정상 운영됩니다.</p>
							<br>
							<p>이용에 불편을 드려 죄송합니다.</p>
							<p>즐거운 명절 보내시기 바랍니다.</p>
							<br>
							<p>감사합니다.</p>
						</div>

						<div class="notice-footer" style="margin-bottom: 20px;">
							<button class="btn btn-primary btn-list" onclick="location.href='../notice/list'">
								<i class="fa fa-list"></i> 목록으로
							</button>
							<div style="clear: both;"></div>
						</div>
					</main>
				</div>
			</div>
		</div>
	</div>

</body>
</html>