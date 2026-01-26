<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/review/review.css" rel="stylesheet">
<style type="text/css">
 .star-rating-read {
    display: inline-block;
    font-size: 3rem;
    position: relative;
    unicode-bidi: bidi-override;
    color: #e0e0e0;
}
.star-rating-read::before {
    content: "★★★★★"; 
}
.star-rating-read .star {
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    overflow: hidden;
    white-space: nowrap;
    width: 0;
    color: #ffc107;
}
.star-rating-read .star::before {
    content: "★★★★★";
}
</style>
</head>
<body>
	<div class="content auth-wrapper" style="margin-top: 30px;" id="review_update">
		<div class="container back">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<main class="mypage-main">
						<div class="review-write-header">
							<div class="review-write-title">
								<i class="fa fa-pencil"></i> 리뷰 수정
							</div>
						</div>
						<form id="reviewForm" method="post" action="/review_update_vue/">
					      <input type="hidden" name="rno" value="${vo.rno }">
							<!-- 별점 -->
							<div class="form-group">
								<label class="form-label">별점(수정 불가)</label>
								<div class="rating-area">
									<div class="star-rating-read">
									    <span class="star" style="width:${vo.r_score * 20}%"></span>
									</div>
								</div>
								<input type="hidden" name="rating" id="ratingValue" required>
							</div>
							<!-- 리뷰 내용 -->
							<div class="form-group">
								<label class="form-label">
									리뷰 내용<span class="required">*</span>
								</label>
								<textarea class="form-control" name="r_content" id="reviewContent" placeholder="상품에 대한 솔직한 리뷰를 작성해주세요." maxlength="1000" required>${vo.r_content }</textarea>
							</div>
							<div class="review-footer" style="margin-bottom: 20px;">
								<button type="button" class="btn-cancel" onclick="history.back()">
									<i class="fa fa-times"></i> 취소
								</button>
								<button type="submit" class="btn-submit">
									<i class="fa fa-check"></i> 수정하기
								</button>
							</div>
						</form>
					</main>
				</div>
			</div>
		</div>
	</div>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/vue-demi"></script>
<script src="https://unpkg.com/pinia@2/dist/pinia.iife.prod.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/vuejs/axios.js"></script>
<script src="/vuejs/review/mypage_review.js"></script>
</body>
</html>