<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="footer">
        <!-- footer-->
        <div class="container">
            <div class="row">
            	<!-- 로고/소개 -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                	<a href="/"><img src="/images/main_logo.png" style="width: 80px; height: 50px; margin-left: -4px;"></a>
                    <div class="footer-widget">
                        <h3 class="widget-title">설레이브</h3>
                        <p>설레이브 | Team 1 Project<br>당신의 특별한 데이트를 위한 파트너</p>
                    </div>
                </div>
                
                <!-- 기능1 -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="footer-widget">
                        <h3 class="widget-title"><a href="#" style="color: white;">코스</a></h3>
                        <p><a href="/course/create" style="color: gray;">코스 생성</a></p>
                        <p><a href="/course/list" style="color: gray;">추천 코스</a></p>
                    </div>
                </div>
                
                <!-- 기능2 -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="footer-widget">
                        <!-- newsletter block -->
                        <h3 class="widget-title"><a href="#" style="color: white;">장소</a></h3>
                        <p><a href="/place/restaurant/list" style="color: gray;">음식점</a></p>
                        <p><a href="/place/culture/list" style="color: gray;">문화/체험</a></p>
                        <p><a href="/place/attraction/list" style="color: gray;">관광명소</a></p>
                    </div>
                    <!-- newsletter block -->
                </div>
                
                <!-- 기능3 -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="footer-widget" style="margin-top: 80px;">
                        <!-- newsletter block -->
                        <p><a href="/notice/list" style="color: gray;">공지사항</a></p>
                        <p><a href="/auth/login" style="color: gray;">로그인</a></p>
                        <p><a href="/auth/register" style="color: gray;">회원가입</a></p>
                      <!--   <p><a href="#" style="color: gray;">마이페이지</a></p> -->
                    </div>
                    <!-- newsletter block -->
                </div>
            </div>
        </div>
    </div>
    <!-- /.footer-->
    <div class="tiny-footer">
        <!-- tiny footer block -->
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                    <div class="copyright-content">
                       Made by<i class="fa fa-love"></i><a href="https://github.com/dongdongsw/seolleibeu" style="color: white; margin-left: 4px;">Git Hub</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>