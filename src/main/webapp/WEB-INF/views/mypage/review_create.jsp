<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<style>
	.review-write-header {
		border-bottom: 2px solid #333;
		padding-bottom: 20px;
		margin-bottom: 30px;
	}
	.review-write-title {
		font-size: 24px;
		font-weight: bold;
		color: #333;
	}
	.form-group {
		margin-bottom: 25px;
	}
	.form-label {
		font-weight: bold;
		font-size: 16px;
		margin-bottom: 10px;
		display: block;
		color: #333;
	}
	.form-label .required {
		color: #dc3545;
		margin-left: 5px;
	}
	.form-control {
		width: 100%;
		padding: 12px;
		border: 1px solid #ddd;
		border-radius: 4px;
		font-size: 15px;
	}
	.form-control:focus {
		border-color: #007bff;
		outline: none;
		box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
	}
	textarea.form-control {
		min-height: 300px;
		resize: vertical;
	}
	.image-upload-area {
		border: 2px dashed #ddd;
		border-radius: 4px;
		padding: 40px;
		text-align: center;
		background-color: #f9f9f9;
		cursor: pointer;
		transition: all 0.3s;
	}
	.image-upload-area:hover {
		border-color: #007bff;
		background-color: #f0f8ff;
	}
	.image-upload-area i {
		font-size: 48px;
		color: #999;
		margin-bottom: 15px;
	}
	.image-upload-text {
		color: #666;
		font-size: 14px;
	}
	.image-preview {
		display: none;
		margin-top: 20px;
	}
	.image-preview img {
		max-width: 100%;
		max-height: 400px;
		border-radius: 4px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.1);
	}
	.image-preview-controls {
		margin-top: 10px;
	}
	.btn-remove-image {
		background-color: #dc3545;
		color: white;
		border: none;
		padding: 8px 20px;
		border-radius: 4px;
		cursor: pointer;
	}
	.btn-remove-image:hover {
		background-color: #c82333;
	}
	.review-footer {
		border-top: 1px solid #ddd;
		padding-top: 20px;
		margin-top: 40px;
		text-align: right;
	}
	.btn-submit {
		background-color: #007bff;
		color: white;
		border: none;
		padding: 12px 40px;
		font-size: 16px;
		border-radius: 4px;
		cursor: pointer;
		margin-left: 10px;
	}
	.btn-submit:hover {
		background-color: #0056b3;
	}
	.btn-cancel {
		background-color: #6c757d;
		color: white;
		border: none;
		padding: 12px 40px;
		font-size: 16px;
		border-radius: 4px;
		cursor: pointer;
	}
	.btn-cancel:hover {
		background-color: #5a6268;
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
	.char-count {
		text-align: right;
		color: #999;
		font-size: 13px;
		margin-top: 5px;
	}
</style>
</head>

<body>

	<div class="content auth-wrapper" style="margin-top: 30px;">
		<div class="container back">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<main class="mypage-main">
						<div class="review-write-header">
							<div class="review-write-title">
								<i class="fa fa-pencil"></i> 리뷰 작성
							</div>
						</div>

						<form id="reviewForm" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label class="form-label">
									리뷰 내용<span class="required">*</span>
								</label>
								<textarea class="form-control" name="content" id="reviewContent" 
									placeholder="상품에 대한 솔직한 리뷰를 작성해주세요." 
									maxlength="1000" required></textarea>
								<div class="char-count">
									<span id="charCount">0</span> / 1000
								</div>
							</div>

							<div class="form-group">
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
							</div>

							<div class="review-footer" style="margin-bottom: 20px;">
								<button type="button" class="btn-cancel" onclick="history.back()">
									<i class="fa fa-times"></i> 취소
								</button>
								<button type="submit" class="btn-submit">
									<i class="fa fa-check"></i> 등록하기
								</button>
							</div>
						</form>
					</main>
				</div>
			</div>
		</div>
	</div>

</body>
</html>