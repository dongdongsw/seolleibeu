<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div class="header navbar-fixed-top">
        <div class="container" style="width: 1500px;">
            <div class="row" style="position: relative;">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
                    <a href="/"><img src="/images/main_logo.png" style="width: 80px; height: 50px"></a>
                </div>
                <div class="col-lg-7 col-md-8 col-sm-12 col-xs-12">
                    <div class="navigation">
                        <div id="navigation">
                            <ul>
                                <li class="active"><a href="/" title="Home">Home</a></li>
                                <li>
                                	<a href="/course/create" onclick="return loginRouter()">내 코스 만들기</a>
                                </li>
                                <li><a href="/course/list">추천 코스</a>
                                </li>
                                <li><a href="/place/restaurant/list" title="Contact Us">음식점</a> </li>
                                <li><a href="/place/culture/list" title="Contact Us">문화/체험</a> </li>
                                <li><a href="/place/attraction/list" title="Contact Us">관광명소</a> </li>
                                <!-- <li><a href="/admin" title="Error">관리자</a> </li> -->
                                <li style="padding-right: 15px;"><a href="/notice/list" title="Contact Us">공지사항</a> </li>
                                <%-- <c:choose>
                           		 <c:when test="${not empty sessionScope.uno}">
                                 <li><a href="/mypage/my_info" title="Contact Us">마이페이지</a> </li>
                                 </c:when>
                                 <c:otherwise>
		                         <li><a href="/auth/login">마이페이지</a></li>
		                         </c:otherwise>
		                        </c:choose> --%>
		                        <sec:authorize access="isAuthenticated()">
                                	<jsp:include page="../commons/notification.jsp"></jsp:include>
                                </sec:authorize>
                            </ul>
                        </div>
                    </div>
                </div>
                <sec:authorize access="!isAuthenticated()">
				    <div style=" position:absolute; right:20px; top:40%; transform:translateY(-50%);">
				        <a class="bttn" href="/auth/login"
				           style="font-size:13px; font-weight:600; padding:5px 20px;
				               color:white; height:35px; display:inline-flex;
				               align-items:center; line-height:normal; text-decoration:none;">
				            로그인/회원가입
				        </a>
				    </div>
				</sec:authorize>
		       	<sec:authorize access="isAuthenticated()">
					<div class="dropdown" style="position:absolute; right:40px; top:40%; transform:translateY(-50%);">
					    <button class="bttn dropdown-toggle" type="button" data-toggle="dropdown"
					            style="background:none; border:none; color:white;
					                font-size:13px; font-weight:600; height:35px;
					                padding:5px 20px; display:inline-flex; align-items:center;
					                line-height:normal;">
					        ${sessionScope.name}
					        <span class="caret" style="margin-left:4px;"></span>
					    </button>
					    <ul class="dropdown-menu"
					        style="width:110px; min-width:110px; left:auto; right:0;">
					        <sec:authorize access="hasRole('USER')">
					        	<li><a href="/mypage/my_info">마이페이지</a></li>
					        </sec:authorize>
					        <sec:authorize access="hasRole('ADMIN')">
					        	<li><a href="/admin">관리자</a></li>
					        </sec:authorize>
					        <li class="divider"></li>
					        <li><a href="/auth/logout">로그아웃</a></li>
					    </ul>
					</div>
				</sec:authorize>
            </div>
         </div>
    </div>
    
    <!-- 알림 -->
    <jsp:include page="../commons/toast.jsp"></jsp:include>
    
    
    <script>
    	function loginRouter(){
    		var userId = '${sessionScope.id}';
    		if(userId !== ''){
    			return true;
    		}
    		
  			if(confirm('로그인이 필요한 서비스입니다.')){
  				location.href='/auth/login';
  			}
    	
  			return false;
    	}
    </script>
</body>
</html>