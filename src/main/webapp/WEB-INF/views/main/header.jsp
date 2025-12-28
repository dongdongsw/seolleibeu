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
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <a href="/"><img src="/images/main_logo.png" style="width: 80px; height: 50px"></a>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <div class="navigation">
                        <div id="navigation">
                            <ul>
                                <li class="active"><a href="/" title="Home">Home</a></li>
                                <li><a href="/course/create">나만의 코스 만들기</a>
                                </li>
                                <li><a href="/course/list">추천 코스</a>
                                </li>
                                <li class="has-sub"><a href="blog-default.html" title="Blog ">News</a>
                                    <ul>
                                        <li><a href="blog-default.html" title="Blog">Blog Default</a></li>
                                        <li><a href="blog-single.html" title="Blog Single ">Blog Single</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html" title="Contact Us">Contact</a> </li>
                                <li><a href="/admin" title="Error">관리자</a> </li>
                                
                                <li><a href="#" class="dropdown-toggle bellBtn">
                                <img src="/images/bell2.png" style="height: 15px; width: 13px; padding-bottom: 2px"></a>
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
            </div>
        </div>
    </div>
</body>
</html>