<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="content auth-wrapper">
	    <div class="container" style="display: flex; align-items: center; justify-content: center;">
	        <div class="row justify-content-center">
	            <div class="col-lg-12 col-md-12">
	
	                <div class="auth-card login-card">
	
	                    <div class="auth-logo text-center mb-4">
	                        <h1>로그인</h1>
	                    </div>
	
	                    <form class="auth-form" >
	
	                        <div class="form-group"  style="display: flex; align-items: center; justify-content: center; margin-bottom: 0px;">
	                            <input type="text" class="form-control auth-input" style="width: 80%; " placeholder="아이디">
	                        </div>
	
	                        <div class="form-group" style="display: flex; align-items: center; justify-content: center; margin-bottom: 0px;">
	                            <input type="password" class="form-control auth-input" style="width: 80%; " placeholder="비밀번호">
	                        </div>
	
	                        <div class="form-group text-center mt-4">
	                            <button class="btn btn-default auth-main-btn login-btn" style="background: black; color: #fff; border-radius: 10px; width: 80%;">
	                                로그인하기
	                            </button>
	                        </div>
	
	                        <ul class="auth-links">
	                            <li><a href="/auth/register">회원가입</a></li>
	                            <li>|</li>
	                            <li><a href="/auth/find_id">아이디 찾기</a></li>
	                            <li>|</li>
	                            <li><a href="/auth/find_pwd">비밀번호 찾기</a></li>
	                        </ul>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>
