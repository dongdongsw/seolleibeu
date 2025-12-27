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
      <li><a href="../mypage/my_info" class="active">내 정보</a></li>
      <li><a href="#">즐겨찾기</a></li>
      <li><a href="../mypage/my_bookmark">북마크</a></li>
      <li><a href="#">나의 코스</a></li>
      <li><a href="#">내가 쓴 리뷰</a></li>
      <li><a href="../mypage/my_reply">내가 쓴 댓글</a></li>
      <li><a href="#">예약 내역</a></li>
      <li><a href="#">환불 내역</a></li>
      <li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
    </ul>
  </aside>
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
  </div>
  <div class="btn-group">
   <button class="edit-btn" onclick="location.href='../mypage/my_update'">수정</button>
  </div>
  </main>
</div>
</body>
</html>