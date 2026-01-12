<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/review/review_update.css" rel="stylesheet">
</head>

<body>

	<div class="content auth-wrapper" style="margin-top: 30px;">
		<div class="container back">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<main class="mypage-main">
						<div class="review-write-header">
							<div class="review-write-title">
								<i class="fa fa-pencil"></i> 리뷰 수정
							</div>
						</div>

						<form id="reviewForm" method="post" enctype="multipart/form-data">
							<!-- 별점 -->
							<div class="form-group">
								<label class="form-label">
									별점<span class="required">*</span>
								</label>
								<div class="rating-area">
									<div class="star-rating" id="starRating">
										<span class="star-wrapper" data-value="1">
											<i class="fa fa-star-o"></i>
										</span>
										<span class="star-wrapper" data-value="2">
											<i class="fa fa-star-o"></i>
										</span>
										<span class="star-wrapper" data-value="3">
											<i class="fa fa-star-o"></i>
										</span>
										<span class="star-wrapper" data-value="4">
											<i class="fa fa-star-o"></i>
										</span>
										<span class="star-wrapper" data-value="5">
											<i class="fa fa-star-o"></i>
										</span>
									</div>
									<span class="rating-text" id="ratingText">별점을 선택해주세요</span>
								</div>
								<input type="hidden" name="rating" id="ratingValue" required>
							</div>

							<!-- 리뷰 내용 -->
							<div class="form-group">
								<label class="form-label">
									리뷰 내용<span class="required">*</span>
								</label>
								<textarea class="form-control" name="content" id="reviewContent" 
									placeholder="상품에 대한 솔직한 리뷰를 작성해주세요." 
									maxlength="1000" required></textarea>
							</div>

							<!-- 이미지 업로드 -->
							<!-- <div class="form-group">
								<label class="form-label">
									리뷰 이미지 <span style="color: #999; font-weight: normal;">(선택사항)</span>
								</label>
								<div class="image-upload-area" id="uploadArea">
									<i class="fa fa-camera"></i>
									<div class="image-upload-text">
										<p style="margin: 0; font-size: 16px; font-weight: bold;">이미지를 클릭하여 업로드</p>
										<p style="margin: 5px 0 0 0;">JPG, PNG 파일 (최대 5MB)</p>
									</div>
									<input type="file" id="imageInput" name="image" 
										accept="image/jpeg,image/png,image/jpg" 
										style="display: none;">
								</div>
								
								<div class="image-preview" id="imagePreview">
									<img id="previewImg" src="" alt="미리보기">
									<div class="image-preview-controls">
										<button type="button" class="btn-remove-image" id="removeImage">
											<i class="fa fa-trash"></i> 이미지 삭제
										</button>
									</div>
								</div>
							</div> -->

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
<script src="/vuejs/mypage/r_create.js"></script>
</body>
</html>