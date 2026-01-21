<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설레이브 - 설렘 가득 데이트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Are you interior design company and looking for startup your website. Download Free Interior Design Website Templates for you suitable to you.">
    <meta name="keywords" content="interior design, furniture, exterior furniture, furniture company, bootstrap interior design website templates, interior design & furniture website templates">
    <meta name="referrer" content="no-referrer">
    
	<link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700" rel="stylesheet">
    <link href="/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<script src="https://unpkg.com/vue-demi"></script>
	<script src="https://unpkg.com/pinia@2/dist/pinia.iife.prod.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div id="duplication">
		<!--  -->
	</div>
	<div id="notification">
		<!--  -->
	</div>
	<jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="${main_jsp }"></jsp:include>
	<jsp:include page="../common/cookie.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	<jsp:include page="toast.jsp"></jsp:include>
	
	<script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/menumaker.js"></script>
    <script src="/js/navigation.js" type="text/javascript"></script>
    <script src="/vuejs/auth/duplicationStore.js"></script>
    <script src="/vuejs/notification/notification.js"></script>
    <script>
    	window.createPinia ??= Pinia.createPinia
   		window.createApp ??= Vue.createApp
   		window.onMounted ??= Vue.onMounted
    	const duplicationApp = createApp({
    		setup(){
    			const duplicationStore = useDuplicationStore()
    			
    			onMounted(()=>{
    				duplicationStore.connect()
    			})
    		}
    	})
		duplicationApp.use(createPinia()) 
    	duplicationApp.mount("#duplication")
    </script>
    
</body>
</html>