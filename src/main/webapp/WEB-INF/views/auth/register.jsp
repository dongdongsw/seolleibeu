<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="row"  style="display: flex; justify-content: center; align-items: center; height: 80vh;">
				<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12" style="display: flex; justify-content: center; align-items: center; height: 70vh;">
					<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12" style="height:50vh; display:flex; align-items:center;">
						<div class="leave-comments" >
							<h1 style="display: flex; justify-content: center; align-items: center; margin-bottom: 15px;">회원가입</h1>
							<div class="row" style="font-size: 20px;">
								<div class="col-md-8" style="margin-bottom: 15px;">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="아이디" style="border:none; border-bottom: 1px solid #e2dcdb">
									</div>
								</div>
								<div class="col-md-4" style="margin-bottom: 15px;">
									<div class="form-group">
										<button class="btn btn-default" style="border-radius:10px;">중복 검사</button>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="비밀번호" style="border:none; border-bottom: 1px solid #e2dcdb">
									</div>
								</div>
								<div class="col-md-12" style="margin-bottom: 15px;">
									<div class="form-group" >
										<input type="text" class="form-control" placeholder="비밀번호 재입력" style="border:none; border-bottom: 1px solid #e2dcdb">
									</div>
								</div>
								<div class="col-md-8" style="margin-bottom: 15px;">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="닉네임" style="border:none; border-bottom: 1px solid #e2dcdb">
									</div>
								</div>
								<div class="col-md-4" style="margin-bottom: 15px;">
									<div class="form-group">
										<button class="btn btn-default" style="border-radius:10px;">중복 검사</button>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="이메일 입력" style="border:none; border-bottom: 1px solid #e2dcdb">
									</div>
								</div>
								<div class="col-md-7">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="인증번호 입력" style="border:none; border-bottom: 1px solid #e2dcdb">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<button class="btn btn-default" style="border-radius:10px;">인증 번호 전송</button>
									</div>
								</div>
								<div class="col-md-12" style="margin-top: 30px; margin-bottom: 30px;">
									<div class="form-group" class="col-md-3" style="display:flex; height:30px; justify-content: center; align-items: center;">
										<select class="col-md-3">
											<option>010</option>
											<option>011</option>
											<option>031</option>
										</select>
										<h3 class="col-md-1">-</h3>
										<input type="text" placeholder="1234" class="col-md-3" maxlength="4" style="height:30px;">
										<h3 class="col-md-1">-</h3>
										<input type="text" placeholder="5678" class="col-md-3" maxlength="4" style="height:30px;">
									</div>
								</div>
								<div class="col-md-12" >
									<div class="form-group" class="col-md-3">
										<input type="checkbox" class="col-md-1" style="transform:scale(1.5);">
										<p class="col-md-6">이용약관(선택)</p>
										<a href="#" class="col-md-4"><더보기></a>
									</div>
								</div>
								<div class="col-md-12" >
									<div class="form-group" class="col-md-3">
										<input type="checkbox" class="col-md-1" style="transform:scale(1.5);">
										<p class="col-md-6">이용약관(선택)</p>
										<a href="#" class="col-md-4"><더보기></a>
									</div>
								</div>
								<div class="col-md-12" >
									<div class="form-group" class="col-md-3">
										<input type="checkbox" class="col-md-1" style="transform:scale(1.5);">
										<p class="col-md-6">이용약관(선택)</p>
										<a href="#" class="col-md-4"><더보기></a>
									</div>
								</div>
							</div>
							<div class="col-md-12" style="display: flex; justify-content: center; align-items: center; margin-top: 30px;">
								<div class="form-group">
									<button class="btn btn-default" style="border-radius:10px;">회원가입</button>
									<button class="btn btn-default" style="border-radius:10px;">취소</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>