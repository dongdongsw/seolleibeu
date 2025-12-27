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
	            <div class="row">
	                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display:flex; justify-content:center; align-items:center; height:70vh;">
	                    <div class="bg-light pinside30" style=" border-radius:40px; width:60vh;">
	                        <div class="row" style="height:50vh; display:flex; align-items:center;">
	                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
	                                <h1>로그인</h1>
	                                <form style="margin-top:60px;">
	                                    <div class="row">
	                                        <div class="col-md-12" style="display:flex; justify-content:center;">
	                                            <div class="form-group has-feedback">
	                                                <div class="input-group" >
	                                                    <input type="text" class="form-control" placeholder="아이디" style="height:40px;">
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="col-md-12" style="display:flex; justify-content:center;">
	                                            <div class="form-group has-feedback">
	                                                <div class="input-group">
	                                                    <input type="password" class="form-control" placeholder="비빌번호" style="height:40px;">
	                                                </div>
	                                            </div>
	                                        </div>
	                                       
	                                        <div class="col-md-12" style="margin-top:30px;">
	                                            <div class="form-group">
	                                                <button id="singlebutton" name="singlebutton" class="btn btn-default" style="border-radius:10px; width:21vh;">로그인하기</button>
	                                            </div>
	                                        </div>
											<ul style="display: flex; justify-content: center; margin-left: -40px;">
												<h5><a href="/auth/register" class="title">회원가입</a></h5>
												<h5>&nbsp;|&nbsp;</h5>
												<h5><a href="/auth/find_id" class="title">아이디 찾기</a></h5>
												<h5>&nbsp;|&nbsp;</h5>
												<h5><a href="/auth/find_pwd" class="title">비밀번호 찾기</a></h5>
											</ul>
	                                    </div>
	                                </form>
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