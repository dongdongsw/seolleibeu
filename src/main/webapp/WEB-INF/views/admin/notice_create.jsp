<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 작성</title>
</head>
<body>
	<div class="container">
		<h1 class="page-title">
			<i class="fas fa-edit"></i>공지사항 작성
		</h1>
		<div class="card">
			<div class="card-header">공지사항 작성</div>
			<div class="card-body">
				<div class="form-group">
					<label for="title">제목<span style="color: #e74a3b;">*</span>
					</label> <input type="text" class="form-control" id="title" name="title"
						placeholder="제목을 입력하세요">
				</div>
				<div class="form-group">
					<label for="content">내용 <span style="color: #e74a3b;">*</span></label>
					<textarea class="form-control" id="content" name="content"
						placeholder="내용을 입력하세요"></textarea>
				</div>
				<div class="d-flex justify-content-center">
					<a href="/admin/notice" type="button"
						class="btn btn-secondary mr-3" style="width: 80px;"> <i
						class="fas fa-times"></i>&nbsp;취소
					</a>
					<button type="button" class="btn btn-primary" style="width: 80px;">
						<i class="fas fa-check"></i>&nbsp;등록
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>