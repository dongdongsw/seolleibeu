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
<div class="content auth-wrapper" style="margin-top: -17px;">
  <div class="container">
    <div class="row">
	  <div class="mypage-sizing">
      <!-- 메인 -->
      <div class="col-lg-9 col-md-9 col-sm-12">
        <main class="mypage-main">
          <h2>회원 탈퇴</h2>
		
          <div class="info-card">
		  <form method="post" action="../mypage/my_password">
		   <table class="password-info">
		    <tr>
		     <td>비밀번호 입력 :</td>
		     <td>
		      <input type="password" id=pwdInfo>
		     </td>
		     <td><button class="info-btn">확인</button></td>
		    </tr>
		   </table>
		  </form>
		  </div>
        </main>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-12" style="margin-top: 80px;">
        <div class="sidenav">
          <ul class="listnone">
            <li><a href="../mypage/my_info">내 정보</a></li>
            <li><a href="../mypage/my_favorite">즐겨찾기</a></li>
            <li><a href="../mypage/my_bookmark">북마크</a></li>
            <li><a href="../mypage/my_course">나의 코스</a></li>
            <li><a href="../mypage/my_review">내가 쓴 리뷰</a></li>
            <li><a href="../mypage/my_reply">내가 쓴 댓글</a></li>
            <li><a href="../mypage/my_reserve">예매 내역</a></li>
            <li><a href="../mypage/my_refund">환불 내역</a></li>
            <li><a href="../mypage/my_pwd_delete"  class="active">회원 탈퇴</a></li>
          </ul>
        </div>
      </div>
	</div>
    </div>
  </div>
</div>
</body>
</html>