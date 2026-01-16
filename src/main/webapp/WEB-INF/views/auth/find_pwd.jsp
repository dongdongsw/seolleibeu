<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="content auth-wrapper" id="pwdFind">
	    <div class="container" style="display: flex; align-items: center; justify-content: center;">
	        <div class="row col-md-6">
	            <div class="col-md-12">
	                <div class="auth-card">
	                    <ul class="nav nav-tabs auth-tabs">
	                        <li><a href="/auth/find_id">아이디 찾기</a></li>
	                        <li class="active"><a href="#">비밀번호 찾기</a></li>
	                    </ul>
	
	                    <div class="row auth-form">
	                    	<div v-if="!pwdStore.pwdFindSuccess">
		                        <div class="col-md-8">
		                            <input type="text" class="form-control auth-input" style="color: black; position:relative; " placeholder="아이디" v-model="pwdStore.id">
		                            <p style="position: absolute; left:9%; top:77%; color: red;">{{pwdStore.idCheckCount === 0?'존재하지 않은 아이디 입니다.':''}}</p>
		                            <p style="position: absolute; left:9%; top:77%; color: green;">{{pwdStore.idCheckCount === 1?'아이디가 존재합니다.':''}}</p>
		                        </div>
		                        <div class="col-md-4" style="margin-top: 10px;">
		                            <button class="btn btn-default auth-sub-btn auth-dark-btn" style="padding: 14px 3px;" @click="pwdStore.idCheck()">아이디 확인</button>
		                            
		                        </div>
		                        
		                        <div class="col-md-8" style="margin-top: 10px;">
		                            <input type="text" class="form-control auth-input" style="color: black;" placeholder="이메일" v-model="pwdStore.email">
		                            <p style="position: absolute; left:9%; top:77%; color: red;">{{pwdStore.emailCheckCount === 0?'존재하지 않은 이메일 입니다.':''}}</p>
		                            <p style="position: absolute; left:9%; top:77%; color: green;">{{pwdStore.emailCheckCount === 1?'이메일이 존재합니다.':''}}</p>
		                        </div>
		                        <div class="col-md-4" style="margin-top: 10px;">
		                            <button class="btn btn-default auth-sub-btn auth-dark-btn" style="padding: 14px 3px;" @click="pwdStore.emailCheck()" v-if="pwdStore.emailCheckCount!==1">이메일 검사</button>
		                            <button class="btn btn-default auth-sub-btn auth-dark-btn" style="padding: 14px 3px;" @click="pwdStore.emailSend()" v-if="pwdStore.emailCheckCount===1">인증번호 전송</button>
		                        </div>
		
		                        <div class="col-md-8" style="margin-top: 10px;">
		                            <input type="text" class="form-control auth-input" style="color: black;" placeholder="인증번호">
		                        </div>
		                        <div class="col-md-4" style="margin-top: 10px;">
		                            <button class="btn btn-default auth-sub-btn auth-dark-btn" @click="pwdStore.emailCodeCheck()">확인</button>
		                        </div>
		
		                        <div class="col-md-12 text-center">
		                            <button class="btn btn-default auth-main-btn auth-dark-btn" @click="pwdStore.pwdDataCheck()">비밀번호 재설정</button>
		                        </div>
							</div>
							<div v-if="pwdStore.pwdFindSuccess">

								<div class="col-md-9" style="margin-top: 10px; left: 12%">
									<input type="password" class="form-control auth-input" placeholder="새 비밀번호" v-model="pwdStore.pwd">
								</div>

								<div class="col-md-9" style="margin-top: 10px; left: 12%">
									<input type="password" class="form-control auth-input" placeholder="새 비밀번호 확인" v-model="pwdStore.pwd1">
								</div>

								<div class="col-md-12 text-center">
									<button class="btn btn-default auth-main-btn auth-dark-btn" @click="pwdStore.pwdChange()">비밀번호 변경</button>
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
		
		const pwdApp = createApp({
			setup(){
				pwdStore = useId_PwdStore()
				return {
					pwdStore
				}
			}
		})
		pwdApp.use(createPinia())
		pwdApp.mount("#pwdFind")
	</script>
</body>
</html>