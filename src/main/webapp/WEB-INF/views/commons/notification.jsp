<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/course.css" rel="stylesheet">
</head>
<script>
const UNO = Number('${sessionScope.uno}');
</script>
<body>
<li id="notification">
    <a href="#" class="dropdown-toggle bellBtn">
       <img class="noti-img" src="/images/bell.png" v-if="store.noReadCount===0">
       <img class="noti-img" src="/images/bell2.png" v-else>
    </a>
    <ul class="dropdown-menu dropdown-menu-right bell" style="width:300px;">
        <li v-if="store.noti_list.length === 0">
		    <a class="read" style="width: 300px; font-size: 12px;">알림이 없습니다.</a>
		</li>
		<li v-for="(vo, index) in store.noti_list" :key="index">
			<a :class="vo.is_read === 'Y' ? 'read' : 'no-read'" 
			   @click="store.notificationRead(vo.target_id, vo.target_type, vo.nono)" style="width: 300px; font-size: 12px;">
			   {{vo.msg}}<button class="noti-del-btn" @click.stop="store.notiDelete(vo.nono)">x</button></a>
		</li>
	</ul>
</li>
    <script src="/vuejs/notification/notificationStore.js"></script>
    <script src="/vuejs/notification/notification.js"></script>
</body>
</html>
