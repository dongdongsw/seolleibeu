<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<script>
const SESSION_UNO = Number('${sessionScope.uno}')
</script>
</head>
<body>
<div class="content auth-wrapper" style="margin-top: 20px;" id="profile_mypage">
  <div class="container">
    <div class="row">
     <div class="mypage-sizing">
      <!-- 메인 -->
      <div class="col-lg-9 col-md-9 col-sm-12">
        <main class="mypage-main">
          <h2>회원 정보</h2>
      
          <div class="info-card" style="gap:40px;">
            <div class="profile" style="margin-bottom: 20px;">
              <img id="profileImg" src="${empty vo.profile_img ? '/profile/profile.png' : vo.profile_img}" @click="$refs.fileInput.click()" />
              <input type="file" ref="fileInput" accept="image/*" @change="handlerFile" style="display:none">
              <button class="info-btn" style="margin-left:340px;margin-top:5px;" @click="$refs.fileInput.click()">프로필 변경</button>
            </div>

            <div style="flex:1;">
              <table class="info-table" style="margin-left: 250px;">
                <tr><th>아이디</th><td>${vo.id}</td></tr>
                <tr><th>닉네임</th><td>${vo.name}</td></tr>
                <tr><th>이메일</th><td>${vo.email}</td></tr>
                <tr><th>연락처</th><td>${vo.phone}</td></tr>
                <tr><th>가입일</th><td>${createdAtFormatted}</td></tr>
                <tr><th>최근 수정일</th><td>${updatedAtFormatted}</td></tr>
              </table>
              
                <button type="button" class="info-btn" style="margin-left: 650px;" onclick="location.href='../mypage/my_pwd_update'">수정</button>
            </div>
          </div>
        </main>
      </div>
     
      <div class="col-lg-3 col-md-3 col-sm-12" style="margin-top: 80px;">
        <div class="sidenav">
          <ul class="listnone">
            <li><a href="../mypage/my_info" class="active">내 정보</a></li>
            <li><a href="../mypage/my_favorite">즐겨찾기</a></li>
            <li><a href="../mypage/my_bookmark">북마크</a></li>
            <li><a href="../mypage/my_course">나의 코스</a></li>
            <li><a href="../mypage/my_review">내가 쓴 리뷰</a></li>
            <li><a href="../mypage/my_reply">내가 쓴 댓글</a></li>
            <li><a href="../mypage/my_reserve">예매 내역</a></li>
            <li><a href="../mypage/my_refund">환불 내역</a></li>
            <li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
          </ul>
        </div>
      </div>
   </div>
    </div>
  </div>
</div>
<script src="/vuejs/axios.js"></script>
<script type="text/javascript">
Vue.createApp({
     methods: {
       handlerFile(e) {
         const file = e.target.files[0]
         if (!file) return

         const formData = new FormData()
         formData.append("profile", file)

         axios.post("/mypage/profile_upload_ok", formData)
           .then(res => {
             const img = document.getElementById("profileImg")
             img.src = res.data + "?t=" + Date.now()
           })
           .catch(err => {
             console.error(err)
             alert("프로필 업로드 실패")
           })
       }
     }
   }).mount("#profile_mypage")
  </script>
</body>
</html>