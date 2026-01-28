<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<div class="content auth-wrapper" id="idFind">
	    <div class="container" style="display: flex; align-items: center; justify-content: center;">
	        <div class="row col-md-6">
	            <div class="col-md-12">
	                <div class="auth-card" style="position: relative;">
	                    <ul class="nav nav-tabs auth-tabs">
	                        <li class="active"><a href="#">아이디 찾기</a></li>
	                        <li><a href="/auth/find_pwd">비밀번호 찾기</a></li>
	                    </ul>
	
	                    <div class="row auth-form" style="position: relative;">
	                    	<div v-if="!idStore.idFindSuccess" >
		                        <div class="col-md-8">
		                            <input type="text" style="color: black;" class="form-control auth-input" placeholder="이메일" v-model="idStore.email">
		                        </div>
		                        <div class="col-md-4">
		                            <button type="button" class="btn btn-default auth-sub-btn auth-dark-btn" 
	                                	style="padding: 14px 3px;" @click="idStore.emailCheck()" v-if="idStore.emailCheckCount===2">이메일 검사</button>
	                                <button type="button" class="btn btn-default auth-sub-btn auth-dark-btn" 
	                                	style="padding: 14px 3px;" @click="idStore.emailSend()" v-if="idStore.emailCheckCount===1">인증번호 전송</button>
		                        </div>
		                        
								<p v-if="idStore.emailCodeCheckCount === 1 && idStore.emailCodeSuccess === 2" style="position: absolute; left:7%; top:55%; color: green;">
								  이메일 전송에 성공하였습니다.
								</p>
								<p v-if="idStore.emailCodeCheckCount === 3 && idStore.emailCodeSuccess === 2" style="position: absolute; left:7%; top:55%; color: red;">
								  이메일 전송에 실패했습니다.
								</p>
	                            <p style="position: absolute; left:7%; top:55%; color: red;">{{idStore.emailCodeSuccess === 3?'인증번호가 일치하지 않습니다.':''}}</p>
	                            <p style="position: absolute; left:7%; top:55%; color: green;">{{idStore.emailCodeSuccess === 1?'인증번호가 일치합니다.':''}}</p>
										
		                        <div class="col-md-8">
		                            <input type="text" style="color: black;" class="form-control auth-input" placeholder="인증번호" v-model="idStore.emailCode">
		                        </div>
		                        <div class="col-md-4">
		                            <button class="btn btn-default auth-sub-btn auth-dark-btn" @click="idStore.emailCodeCheck()">확인</button>
		                        </div>
		
		                        <div class="col-md-12 text-center" style=" padding-top: 40px;">
		                            <button class="btn btn-default auth-main-btn auth-dark-btn" @click="idStore.idSearch()">아이디 찾기</button>
		                        </div>
	                        </div>
	                        <div v-if="idStore.idFindSuccess">
								<div class="col-md-9" style="margin-top: 10px; left: 23%; top: 38%; position:absolute; ">
									<h1>아이디 : {{idStore.id}}</h1>
								</div>
								
								<div class="col-md-12 text-center" style="position:absolute; right:1%; top: 70%;">
									<a class="btn btn-default auth-main-btn auth-dark-btn"  href="/auth/login">로그인하러 가기</a>
								</div>
							</div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/auth/id_pwdStore.js"></script>
	<script>
		const {createApp, onMounted} = Vue
		const {createPinia} = Pinia
		
		const idApp = createApp({
			setup(){
				idStore = useId_PwdStore()
				return {
					idStore
				}
			}
		})
		idApp.use(createPinia())
		idApp.mount("#idFind")
	</script>
</body>
</html>