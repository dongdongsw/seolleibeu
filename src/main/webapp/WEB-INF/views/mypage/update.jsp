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

</head>
<body>
<div class="content auth-wrapper">
  <div class="container">
    <div class="row">

      <div class="col-lg-9 col-md-9 col-sm-12">
        <main class="mypage-main">
          <h2>정보 수정</h2>

          <div class="info-card">
            <form method="post" action="../mypage/update">
              <table class="table" style="max-width:700px;">
                <tr>
                  <th style="width:140px;">닉네임</th>
                  <td><input class="form-control"></td>
                  <td><button type="button" class="btn btn-sm">중복 확인</button></td>
                </tr>
                <tr>
                  <th>비밀번호</th>
                  <td colspan="2"><input type="password" class="form-control"></td>
                </tr>
                <tr>
                  <th>비밀번호 확인</th>
                  <td colspan="2"><input type="password" class="form-control"></td>
                </tr>
                <tr>
                  <th>연락처</th>
                  <td><input class="form-control"></td>
                  <td><button type="button" class="btn btn-sm">중복 확인</button></td>
                </tr>
              </table>

              <button class="btn">저장</button>
            </form>
          </div>
        </main>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-12" style="margin-top: 80px;">
        <div class="sidenav">
          <ul class="listnone">
            <li><a href="../mypage/info" class="active">내 정보</a></li>
            <li><a href="#">즐겨찾기</a></li>
            <li><a href="../mypage/bookmark">북마크</a></li>
            <li><a href="../mypage/my_course">나의 코스</a></li>
            <li><a href="../mypage/my_review">내가 쓴 리뷰</a></li>
            <li><a href="../mypage/reply">내가 쓴 댓글</a></li>
            <li><a href="#">예약 내역</a></li>
            <li><a href="../mypage/my_refund">환불 내역</a></li>
            <li><a href="../mypage/pwd_delete">회원 탈퇴</a></li>
          </ul>
        </div>
      </div>

    </div>
  </div>
</div>
</body>
</html>