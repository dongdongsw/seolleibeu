<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/mainpage.css">
</head>
<body>
	<div class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                    <h1 class="hero-title">
                    	<strong>데이트 코스 짜기에 지치신 분들?</strong>
                    	<br>원하는 코스를 검색해보세요!
					</h1>
					<!-- <form action="/course/list" method="get"> -->
						<div class="mainSearch-container">
							<input type="text" class="mainSearch" placeholder="검색어를 입력하세요" name="keyword" id="homeKeyword" onkeydown="enter(event)">
		                    <button type="submit" class="btn-search" onclick="homeSearch()">검색</button>
	                    </div>
                    <!-- </form> -->
				</div>
            </div>
        </div>
    </div>
    
    <!-- 인기 코스 -->
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8
               col-sm-12 col-xs-12">
                    <div class="mb60 text-center section-title">
                        <!-- section title start-->
                        <h1 style="font-weight: bold; font-size: 40px; font-variant-numeric: lining-nums;">인기 코스 Best 4</h1>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            <div class="row">
            	<c:forEach var="b4vo" items="${b4List}">
	                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
	                    <div class="service-block text-center">
	                        <!-- service block -->
	                        <div class="service-img ">
	                            <!-- service img -->
	                            <a href="/course/detail?cno=${b4vo.cno}" class="imghover">
	                            	<img src="${b4vo.pvo.thumbnail}" class="img-responsive coursethumb" alt="Interior Design Website Templates Free Download">
	                            </a>
	                        </div>
	                        <!-- service img -->
	                        <div class="service-content">
	                            <!-- service content -->
	                            <h2><a href="/course/detail?cno=${b4vo.cno}" class="title" style="font-variant-numeric: lining-nums;">${b4vo.title}</a></h2>
	                            <p class="content_p">${b4vo.content}</p>
	                        </div>
	                        <!-- service content -->
	                    </div>
	                    <!-- /.service block -->
	                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    
    <!-- 최신 코스 -->
    <div class="space-medium bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8
               col-sm-12 col-xs-12">
                    <div class="mb60 text-center section-title">
                        <!-- section title start-->
                        <h1 style="font-weight: bold; font-size: 40px; font-variant-numeric: lining-nums;">최신 코스 New 4</h1>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            <div class="row">
            	<c:forEach var="n4vo" items="${n4List}">
	                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
	                    <div class="service-block text-center">
	                        <!-- service block -->
	                        <div class="service-img ">
	                            <!-- service img -->
	                            <a href="/course/detail?cno=${n4vo.cno}" class="imghover">
	                            	<img src="${n4vo.pvo.thumbnail}" class="img-responsive coursethumb" alt="Interior Design Website Templates Free Download">
                            	</a>
	                        </div>
	                        <!-- service img -->
	                        <div class="service-content">
	                            <!-- service content -->
	                            <h2><a href="/course/detail?cno=${n4vo.cno}" class="title" style="font-variant-numeric: lining-nums;">${n4vo.title}</a></h2>
	                            <p class="content_p">${n4vo.content}</p>
	                        </div>
	                        <!-- service content -->
	                    </div>
	                    <!-- /.service block -->
	                </div>
				</c:forEach>
			</div>
        </div>
    </div>
    
    <!-- 장소 이동 버튼 -->
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                    <div class="section-title mb60 text-center">
                        <!-- section title start-->
                        <h1 style="font-weight: bold; font-size: 40px;">데이트 장소 탐색</h1>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="outline pinside30 text-center mb30">
                        <div class="mb30">
                        	<img src="images/restaurant.jpg" class="" alt="Interior Design Website Templates Free Download">
                       	</div>
                        <div class="">
                            <h2>Restaurant</h2>
                            <a href="/place/restaurant/list" class="btn btn-white" style="margin-left: 1px;">음식점 목록 →</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="outline pinside30 text-center mb30">
                        <div class="mb30">
                        	<img src="images/culture.jpg" class="" alt="Interior Design Website Templates Free Download">
                       	</div>
                        <div class="">
                            <h2>Culture & Experience</h2>
                            <a href="/place/culture/list" class="btn btn-white" style="margin-left: 1px;">문화/체험 목록 →</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="outline pinside30 text-center mb30">
                        <div class="mb30">
                        	<img src="images/tour.jpg" class="" alt="Interior Design Website Templates Free Download">
                       	</div>
                        <div class="">
                            <h2>Tourist Attraction</h2>
                            <a href="/place/attraction/list" class="btn btn-white" style="margin-left: 1px;">관광명소 목록 →</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="cta-section cta-section_thumb">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="text-center" style="margin: 200px auto;">
                        <h1 style="font-weight: bold; font-size: 40px;">나만의 코스 만들기</h1>
                        <a href="/course/create" class="btn btn-white">GO →</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    	function enter(e) {
    		if (e.key === 'Enter') {
    			homeSearch()
    		}
    	}
    	
    	function homeSearch() {
    		const input = document.getElementById('homeKeyword')
    		
    		if(!input.value || input.value.trim() === '') {
    			input.focus()
    			
    			return
    		}
    		
    		location.href = '/course/list?keyword='+encodeURIComponent(input.value.trim())
    	}
    </script>
</body>
</html>