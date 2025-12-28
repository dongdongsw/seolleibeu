<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="content auth-wrapper">
	    <div class="container" style="display: flex; align-items: center; justify-content: center;">
	        <div class="row col-md-6">
	            <div class="col-md-12">
	                <div class="auth-card">
	                    <ul class="nav nav-tabs auth-tabs">
	                        <li><a href="/auth/find_id">아이디 찾기</a></li>
	                        <li class="active"><a href="#">비밀번호 찾기</a></li>
	                    </ul>
	
	                    <div class="row auth-form">
	                        <div class="col-md-8">
	                            <input type="text" class="form-control auth-input" placeholder="아이디">
	                        </div>
	                        <div class="col-md-4">
	                            <button class="btn btn-default auth-sub-btn auth-dark-btn" style="padding: 14px 3px;">아이디 확인</button>
	                        </div>
	                        
	                        <div class="col-md-8">
	                            <input type="text" class="form-control auth-input" placeholder="이메일">
	                        </div>
	                        <div class="col-md-4">
	                            <button class="btn btn-default auth-sub-btn auth-dark-btn" style="padding: 14px 3px;">인증번호 전송</button>
	                        </div>
	
	                        <div class="col-md-8">
	                            <input type="text" class="form-control auth-input" placeholder="인증번호">
	                        </div>
	                        <div class="col-md-4">
	                            <button class="btn btn-default auth-sub-btn auth-dark-btn">확인</button>
	                        </div>
	
	                        <div class="col-md-12 text-center">
	                            <button class="btn btn-default auth-main-btn auth-dark-btn">비밀번호 재설정</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>