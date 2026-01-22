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
                                <li><a href="/notice/list" title="Contact Us">공지사항</a> </li>
                                <%-- <c:choose>
                           		 <c:when test="${not empty sessionScope.uno}">
                                 <li><a href="/mypage/my_info" title="Contact Us">마이페이지</a> </li>
                                 </c:when>
                                 <c:otherwise>
		                         <li><a href="/auth/login">마이페이지</a></li>
		                         </c:otherwise>
		                        </c:choose> --%>
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
					        <li><a href="/mypage/my_info">마이페이지</a></li>
					        <li><a href="/admin">관리자</a></li>
					        <li class="divider"></li>
					        <li><a href="/auth/logout">로그아웃</a></li>
					    </ul>
					</div>
				</sec:authorize>
            </div>
         </div>
    </div>
    
    <!-- 알림 -->
    <div id="notification"></div>
    <jsp:include page="../common/toast.jsp"></jsp:include>
    <script src="/vuejs/notification/notificationStore.js"></script>
    <script>
    	window.createPinia ??= Pinia.createPinia
   		window.createApp ??= Vue.createApp
   		window.onMounted ??= Vue.onMounted
    	const notificationApp = createApp({
    		setup(){
    			const store = useNotificationStore()
    			
    			onMounted(()=>{
    				store.connect(uno)
    			})
    			
    			return {
    				store
    			}
    		}
    	})
		notificationApp.use(createPinia()) 
    	notificationApp.mount("#notification")
    </script>
    
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