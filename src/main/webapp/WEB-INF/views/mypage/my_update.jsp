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
	  <div class="mypage-sizing">
      <!-- 메인 -->
      <div class="col-lg-9 col-md-9 col-sm-12">
        <main class="mypage-main" id="mypage_update">
          <h2>회원 정보</h2>
		
          <div class="info-card" style="margin-left: -40px;">
            <div class="profile" style="margin-bottom: 20px;">
              <img src="${empty sessionScope.profile ? '../images/profile.png' : sessionScope.profile}">
            </div>

            <div style="flex:1;">
                <div class="form-wrap">

			  <div class="form-row">
			    <label>닉네임</label>
			    <div class="field">
			      <input v-model="store.name" @keyup.enter="store.mypagNameChk">
			      <button class="info-btn" @click="store.mypagNameChk">중복 확인</button>
			      <span class="check-msg"
			            :class="{ ok: store.nameChecked }">
			        {{ store.nameMsg }}
			      </span>
			    </div>
			  </div>
			
			  <div class="form-row">
			    <label>비밀번호</label>
			    <div class="field">
			      <input type="password"
			             v-model="store.password"
			             @input="store.mypagePwd">
			    </div>
			  </div>
			
			  <div class="form-row">
			    <label>비밀번호 확인</label>
			    <div class="field">
			      <input type="password"
			             v-model="store.passwordConfirm"
			             @input="store.mypagePwd">
			      <span class="check-msg"
			            :class="{ ok: store.passwordChecked }">
			        {{ store.passwordMsg }}
			      </span>
			    </div>
			  </div>
			
			  <!-- 연락처 -->
			  <div class="form-row">
			    <label>연락처</label>
			    <div class="field">
			      <input v-model="store.phone" @keyup.enter="store.mypagPhoneChk">
			      <button class="info-btn" @click="store.mypagPhoneChk">중복 확인</button>
			      <span class="check-msg"
			            :class="{ ok: store.phoneChecked }">
			        {{ store.phoneMsg }}
			      </span>
			    </div>
			  </div>
			
			</div>
              
                <button style="margin-left: 650px;margin-top: 80px;" class="info-btn" @click="store.save">저장</button>
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
<script src="/vuejs/mypage/mypage_update.js"></script>
<script type="text/javascript">
	const {createApp,onMounted} = Vue
	const {createPinia} = Pinia
	const mypageUpdateApp=createApp({
		 setup(){
			 const store = useInfoUpdateStore()
			 return {
				 store
			 }
		 }
	})
	mypageUpdateApp.use(createPinia())
	mypageUpdateApp.mount('#mypage_update')
</script>
</body>
</html>