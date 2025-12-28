<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header navbar-fixed-top">
        <div class="container" style="width: 1500px;">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
                    <a href="/"><img src="/images/main_logo.png" style="width: 80px; height: 50px"></a>
                </div>
                <div class="col-lg-7 col-md-8 col-sm-12 col-xs-12">
                    <div class="navigation">
                        <div id="navigation">
                            <ul>
                                <li class="active"><a href="/" title="Home">Home</a></li>
                                <li><a href="/course/create">내 코스 만들기</a>
                                </li>
                                <li><a href="/course/list">추천 코스</a>
                                </li>
                                <li><a href="contact.html" title="Contact Us">음식점</a> </li>
                                <li><a href="contact.html" title="Contact Us">문화/엔터</a> </li>
                                <li><a href="/admin" title="Error">관리자</a> </li>
                                <li><a href="contact.html" title="Contact Us">공지사항</a> </li>
                                
                                <li>
                                	<a href="#" class="dropdown-toggle bellBtn">
                                		<img src="/images/bell2.png" style="height: 15px; width: 13px; padding-bottom: 2px">
                                	</a>
                                	<ul class="dropdown-menu dropdown-menu-right bell" style="width:300px;">
									    <li>
									      <a class="no-read" href="#" style="width: 300px;">코스 게시판에 새 댓글이 달렸습니다.</a>
									    </li>
									    <li>
									      <a class="read" href="#" style="width: 300px;">뮤지컬 결제 완료 되었습니다.</a>
									    </li>
									    <li>
									      <a  class="read" href="#" style="width: 300px;">뮤지컬 예매 완료 되었습니다.</a>
									    </li>
									</ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-1 col-md-8 col-sm-12 col-xs-12">
                    <div class="navigation">
                        <div id="navigation">
                        	<ul>
                				<li><a href="/auth/login" style="border: 1px solid #fff; border-radius: 12px; padding: 10px 20px; margin-top: 5px;">로그인</a>
                			</ul>
                        </div>
		           </div>
		       </div>
            </div>
         </div>
    </div>
</body>
</html>