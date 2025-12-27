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
  <h2>정보 수정</h2>
  <div class="info-card">
    
    <form method="post" action="../mypage/update">
     <table class="update-info">
      <tr>
        <th>닉네임</th>
        <td><input type="text" name="nickname" id="nickname" required></td>
        <td><button class="btn btn-sm btn-danger">중복 확인</button></td>
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
        <td><button class="btn btn-sm btn-danger">중복 확인</button></td>
      </tr>
     </table>
    </form>
    <div class="btn-group">
     <button class="edit-btn save">저장</button>
    </div>
  </div>
</main>
</div>
</body>
</html>