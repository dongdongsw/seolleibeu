<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div class="content auth-wrapper">
	    <div class="container" style="display: flex; align-items: center; justify-content: center; ">
	        <div class="row" style="width: 50%; height: 70vh;">
	            <div class="col-lg-12 col-md-12" style="height: 110vh;">
	
	                <div class="auth-card register-card" style="height: 105vh;">
	
	                    <div class="auth-logo text-center mb-4" >
	                        <h1>회원가입</h1>
	                    </div>
	
	                    <form class="auth-form" >
	
	                        <!-- 아이디 -->
	                        <div class="row" style="margin-bottom: 20px;">
	                            <div class="col-md-8">
	                                <input type="text" class="form-control auth-input" placeholder="아이디">
	                            </div>
	                            <div class="col-md-4">
	                                <button class="btn btn-default auth-sub-btn auth-dark-btn">중복 검사</button>
	                            </div>
	                        </div>
	
	                        <!-- 비밀번호 -->
	                        <div class="form-group">
	                            <input type="password" class="form-control auth-input" placeholder="비밀번호">
	                        </div>
	
	                        <div class="form-group"  style="margin-bottom: 30px;">
	                            <input type="password" class="form-control auth-input" placeholder="비밀번호 재입력">
	                        </div>
	
	                        <!-- 닉네임 -->
	                        <div class="row"  style="margin-bottom: 20px;">
	                            <div class="col-md-8">
	                                <input type="text" class="form-control auth-input" placeholder="닉네임">
	                            </div>
	                            <div class="col-md-4">
	                                <button class="btn btn-default auth-sub-btn auth-dark-btn">중복 검사</button>
	                            </div>
	                        </div>
	
	                        <!-- 이메일 -->
	                        <div class="form-group">
	                            <input type="email" class="form-control auth-input" placeholder="이메일 입력">
	                        </div>
	
	                        <!-- 인증번호 -->
	                        <div class="row" style="margin-bottom: 20px;">
	                            <div class="col-md-8">
	                                <input type="text" class="form-control auth-input" placeholder="인증번호 입력">
	                            </div>
	                            <div class="col-md-4">
	                                <button class="btn btn-default auth-sub-btn auth-dark-btn" style="padding:14px 3px;">인증번호 전송</button>
	                            </div>
	                        </div>
	
								<h3 style="color: #b7b6b7; margin-left: 5px;">전화번호</h3>
	
	                        <!-- 전화번호 -->
	                        <div class="form-group phone-group" style="margin-left: 5px;">
	                            <select class="form-control phone-select" style="height: 30px; color: black;">
	                                <option>010</option>
	                                <option>011</option>
	                                <option>031</option>
	                            </select>
	                            <span>-</span>
	                            <input type="text" class="form-control phone-input" maxlength="4" style="height: 30px; color: black;">
	                            <span>-</span>
	                            <input type="text" class="form-control phone-input" maxlength="4" style="height: 30px; color: black;">
	                        </div>
	
	                        <!-- 약관 -->
	                        <div class="terms">
	                            <label>
	                                <input type="checkbox"> 이용약관(필수)
	                                <a href="#">더보기</a>
	                            </label>
	                            <label>
	                                <input type="checkbox"> 개인정보 처리방침(필수)
	                                <a href="#">더보기</a>
	                            </label>
	                            <label>
	                                <input type="checkbox"> 마케팅 수신 동의(선택)
	                                <a href="#">더보기</a>
	                            </label>
	                        </div>
	
	                        <!-- 버튼 -->
	                        <div class="text-center mt-4">
	                            <a class="btn btn-default auth-cancel-btn auth-dark-btn" href="/auth/login" 
	                            		style="color: white; text-decoration: none; margin-top:20px; ">회원가입</a>
	                            <a class="btn btn-default auth-cancel-btn auth-dark-btn" href="/auth/login" 
	                            		style="color: white; text-decoration: none; margin-top:20px; ">취소</a>
	                            
	                        </div>
	
	                    </form>
	
	                </div>
	
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>
