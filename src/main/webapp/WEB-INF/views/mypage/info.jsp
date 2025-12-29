<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="../css/mypage.css" rel="stylesheet">
</head>
<body>
<div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h1 class="page-title">latest news</h1>
                        <p>Praesent sit amet dapibus dui, non ullamcorper nisecenas ac
                            <br> nulla non urna ullamcorper iaculis nec eu leo. </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                    <main class="mypage-main">
  <h2>회원 정보</h2>
  <div class="info-card">
  	<div class="profile"  style="margin-top: 50px;">
      <img src="${empty sessionScope.profile ? '../images/profile.jpg' : sessionScope.profile}" alt="profileImg">
    </div>
    
    <table style="margin-left: 200px;">
      <tr>
        <th>아이디</th>
        <td>happy</td>
      </tr>
      <tr>
        <th>닉네임</th>
        <td>닉네임</td>
      </tr>
      <tr>
        <th>이메일</th>
        <td>happy@gmail.com</td>
      </tr>
      <tr>
        <th>연락처</th>
        <td>010-1234-5678</td>
      </tr>
      <tr>
        <th>가입일</th>
        <td>2025-12-27</td>
      </tr>
    </table>
  
  <div class="btn-group" >
   <button class="info-card btn" onclick="location.href='../mypage/update'" style="border: none;">수정</button>
  </div>
  </div>
  </main>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" style="margin-top: 100px;">
                    <div class="sidenav">
                        <ul class="listnone">
                            <li><a href="../mypage/info" class="active">내 정보</a></li>
						    <li><a href="#">즐겨찾기</a></li>
						    <li><a href="../mypage/my_bookmark">북마크</a></li>
						    <li><a href="#">나의 코스</a></li>
						    <li><a href="#">내가 쓴 리뷰</a></li>
						    <li><a href="../mypage/my_reply">내가 쓴 댓글</a></li>
						    <li><a href="#">예약 내역</a></li>
						    <li><a href="#">환불 내역</a></li>
						    <li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>