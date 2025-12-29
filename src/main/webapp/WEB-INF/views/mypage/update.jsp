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
  <h2>정보 수정</h2>
  <div class="info-card">
    
    <form method="post" action="../mypage/update">
     <table class="update-info">
      <tr>
        <th>닉네임</th>
        <td><input type="text" name="nickname" id="nickname" required></td>
        <td><button class="btn btn-xs info-btn" style="border: none;">중복 확인</button></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" id="pwd" required></td>
      </tr>
      <tr>
        <th>비밀번호 확인</th>
        <td><input type="password" name=pwdok id="pwdok" required></td>
      </tr>
      <tr>
        <th>연락처</th>
        <td><input type="text" name="phone" id="phone" required></td>
        <td><button class="btn btn-xs info-btn">중복 확인</button></td>
      </tr>
     </table>
    </form>
    <div class="btn-group">
     <button class="info-card btn" style="border: none;">저장</button>
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