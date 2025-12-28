<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">
<!-- Sidebar -->
<div id="wrapper">
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">설레이브</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/admin">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="/admin/place_list">
                    <i class="fas fa-map-marked-alt"></i>
                    <span>장소 조회</span></a>
            </li><li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="	fas fa-pencil-alt"></i>
                    <span>장소 생성</span></a>
            </li>
			
			<li class="nav-item">
                <a class="nav-link" href="/admin/users_list">
                    <i class="fas fa-user-alt"></i>
                    <span>사용자 조회</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-coins"></i>
                    <span>환불 조회</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/notice">
                    <i class="fas fa-fw fa-table"></i>
                    <span>공지사항</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            
        </ul>
        <!-- End of Sidebar -->
        </div>
</body>
</html>