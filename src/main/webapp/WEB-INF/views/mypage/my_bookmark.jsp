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
      <li><a href="../mypage/my_bookmark" class="active">북마크</a></li>
      <li><a href="#">나의 코스</a></li>
      <li><a href="#">내가 쓴 리뷰</a></li>
      <li><a href="../mypage/my_reply">내가 쓴 댓글</a></li>
      <li><a href="#">예약 내역</a></li>
      <li><a href="#">환불 내역</a></li>
      <li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
    </ul>
  </aside>
  <main class="mypage-main">
    <h2>북마크</h2>
    <h3>총<span style="color:#FF472E;"> 0 </span>건</h3>
    <div class="info-card">
      <table>
        <tr>
          <td width="20%">
           <img src="#" style="width: 150px;height: 100px">
          </td>
          <td width="40%" style="padding-left: 50px;padding-bottom: 80px;">홍대 데이트</td>
          <td width="15%"></td>
          <td width="15%"></td>
          <td width="10%">
           <a href="#" class="btn btn-sm btn-danger">X</a>
          </td>
        </tr>
      </table>
    </div>
</main>
</div>
</body>
</html>