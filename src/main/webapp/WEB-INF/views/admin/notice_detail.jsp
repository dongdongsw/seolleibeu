<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
 <div class="d-flex justify-content-center">
	<div id="wrapper" style="width: 1200px;">
		<div class="container-fluid">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-3">
			</div>
			<div class="card shadow mb-4">
				<div
					class="card-header py-3 d-flex justify-content-between align-items-center">
					<h6 class="m-0 font-weight-bold text-primary">공지사항 상세보기</h6>

				</div>
				<div class="card-body">
					<div class="mb-3">
						<div class="row">
							<div class="col-lg-12 mb-3">
							  <label class="small text-gray-700 font-weight-bold">제목</label>
							  <div class="form-control">asd</div>
							</div>
						</div>
					</div>
					<div class="mb-4">
						<div class="row">
							<div class="col-lg-12 mb-3">
								<label class="small text-gray-700 font-weight-bold">내용</label>
								<div class="form-control" style="min-height: 350px; white-space: pre-wrap;">asdadsadsadsdasadsadsadsads</div>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-end">
						<a href="/admin/notice" class="btn btn-secondary mr-2">목록</a>
						<a href="/admin/notice_update" class="btn btn-primary mr-2">수정</a>
						<button type="button" class="btn btn-danger" onclick="deleteNotice()">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
function deleteNotice() {
	if(confirm('정말 삭제하시겠습니까?')) {
		
	}
}
</script>
</body>
</html>