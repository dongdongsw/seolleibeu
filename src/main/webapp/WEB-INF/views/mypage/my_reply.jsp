<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="mypage-container">
  <aside class="mypage-sidebar">
    <ul class="menu">
      <li><a href="../mypage/my_info">내 정보</a></li>
      <li><a href="#">즐겨찾기</a></li>
      <li><a href="../mypage/my_bookmark">북마크</a></li>
      <li><a href="#">나의 코스</a></li>
      <li><a href="#">내가 쓴 리뷰</a></li>
      <li><a href="../mypage/my_reply" class="active">내가 쓴 댓글</a></li>
      <li><a href="#">예약 내역</a></li>
      <li><a href="#">환불 내역</a></li>
      <li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
    </ul>
  </aside>
  <main class="mypage-main">
    <h2>내가 쓴 댓글</h2>
    <h3>총<span style="color:#FF472E;"> 0 </span>건</h3>
    <div class="reply-card">
      <img class="reply-profile" src="${empty sessionScope.profile ? '../images/profile.jpg' : sessionScope.profile}" alt="profileImg">
      <div class="mypage-reply">
       <h3 style="margin-left: 2px;">홍대 데이트</h3><br/>
       <p style="margin-bottom: 10px">정말 좋은곳입니다.</p>
       <h5>닉네임  |  2026. 01. 01</h5>
    </div>
    </div>
  </main>
</div>
</body>
</html>