<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">
<div id="wrapper">
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <img src="/images/main_logo.png" style="width: 50px;">
            </a>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active">
                <a class="nav-link" href="/admin">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>
            <hr class="sidebar-divider">
            <li class="nav-item">
                <a class="nav-link" href="/admin/place_list">
                    <i class="fas fa-map-marked-alt"></i>
                    <span>장소 조회</span></a>
            </li><li class="nav-item">
                <a class="nav-link" href="/admin/place_create">
                    <i class="fas fa-pencil-alt"></i>
                    <span>장소 등록</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/course_list">
                    <i class="fas fa-map"></i>
                    <span>코스 조회</span></a>
            </li>
			
			<li class="nav-item">
                <a class="nav-link" href="/admin/users_list">
                    <i class="fas fa-user-alt"></i>
                    <span>사용자 조회</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/refund">
                    <i class="fas fa-coins"></i>
                    <span>환불 조회</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/notice">
                    <i class="fas fa-fw fa-table"></i>
                    <span>공지사항</span></a>
            </li>
            <hr class="sidebar-divider d-none d-md-block">
        </ul>
        </div>
</body>
</html>