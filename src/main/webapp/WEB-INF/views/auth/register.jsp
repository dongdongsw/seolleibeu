<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div class="content auth-wrapper" id="register">
	    <div class="container" style="display: flex; align-items: center; justify-content: center; ">
	        <div class="row" style="width: 50%; height: 70vh;">
	            <div class="col-lg-12 col-md-12" style="height: 120vh;">
	
	                <div class="auth-card register-card" style="height: 110vh;">
	
	                    <div class="auth-logo text-center mb-4" >
	                        <h1>회원가입</h1>
	                    </div>
	
	                        <div class="row" style="margin-bottom: 20px; position: relative;">
	                            <div class="col-md-8">
	                                <input type="text" class="form-control auth-input" style="color: black;" placeholder="아이디 (영문/숫자, 6~12자)" v-model="registerStore.id">
	                            </div>
	                            <div class="col-md-4">
	                                <button type="button" class="btn btn-default auth-cancel-btn auth-dark-btn" 
	                                	@click="registerStore.idCheck">중복 검사</button>
	                            </div>
	                            <p style="position: absolute; left:6%; top:80%; color: green;">{{registerStore.idCheckCount === 0?'사용가능한 아이디입니다.':''}}</p>
	                            <p style="position: absolute; left:6%; top:80%; color: red;">{{registerStore.idCheckCount === 1?'이미 존재하는 아이디 입니다.':''}}</p>
	                            <p style="position: absolute; left:6%; top:80%; color: red;">{{registerStore.idCheckCount === 3?'아이디 형식을 지켜주세요.':''}}</p>
	                        </div>
	
	                        <div class="form-group">
	                            <input type="password" class="form-control auth-input" style="color: black;" placeholder="비밀번호 (8~20자/영문/숫자/특수문자)" v-model="registerStore.pwd">
	                        </div>
	
	                        <div class="form-group"  style="margin-bottom: 30px; position: relative;">
	                            <input type="password" class="form-control auth-input" style="color: black;" placeholder="비밀번호 재입력 (8~20자/영문/숫자/특수문자)" v-model="registerStore.pwd1">
	                            <p style="position: absolute; left:3%; top:100%; color: red;">{{registerStore.pwd !== '' && registerStore.pwd !== ''&& registerStore.pwdCheckCount !== 3 && registerStore.pwd !== registerStore.pwd1?'비밀번호가 일치하지 않습니다.':''}}</p>
                            	<p style="position: absolute; left:3%; top:100%; color: green;">{{registerStore.pwd !== '' && registerStore.pwd !== '' && registerStore.pwdCheckCount !== 3 && registerStore.pwd === registerStore.pwd1?'비밀번호가 일치합니다.':''}}</p>
                            	<p style="position: absolute; left:3%; top:100%; color: red;">{{registerStore.pwd !== '' && registerStore.pwd !== '' && registerStore.pwdCheckCount === 3?'비밀번호 형식을 지켜주세요.':''}}</p>
	                        </div>
							
							
							
	                        <div class="row"  style="margin-bottom: 20px;  position: relative;">
	                            <div class="col-md-8">
	                                <input type="text" class="form-control auth-input" style="color: black;" placeholder="닉네임" v-model="registerStore.name">
	                            </div>
	                            <div class="col-md-4">
	                                <button type="button" class="btn btn-default auth-cancel-btn auth-dark-btn" 
	                                	@click="registerStore.nickNameCheck(registerStore.nickname)">중복 검사</button>
	                            </div>
	                            <p style="position: absolute; left:6%; top:80%; color: green;">{{registerStore.nickNameCheckCount === 0?'사용가능한 닉네임입니다.':''}}</p>
	                            <p style="position: absolute; left:6%; top:80%; color: red;">{{registerStore.nickNameCheckCount === 1?'이미 존재하는 닉네임 입니다.':''}}</p>
	                        </div>
	
	                        <div class="form-group">
	                            <input type="email" class="form-control auth-input" style="color: black;" placeholder="이메일 입력" v-model="registerStore.email">
	                        </div>
	
	                        <div class="row" style="margin-bottom: 20px; position: relative;">
	                            <div class="col-md-8">
	                                <input type="text" class="form-control auth-input" style="color: black;" placeholder="인증번호 입력" v-model="registerStore.emailCode">
	                            </div>
	                            <div class="col-md-4">
	                                <button type="button" class="btn btn-default auth-cancel-btn auth-dark-btn" 
	                                	style="padding:14px 17px;" @click="registerStore.emailCheck()" v-if="registerStore.emailCheckCount===2">이메일 검사</button>
	                                <button type="button" class="btn btn-default auth-cancel-btn auth-dark-btn" 
	                                	style="padding:14px 17px;" @click="registerStore.emailSend()" v-if="registerStore.emailCheckCount === 0 && registerStore.emailCodeCheckCount === 2 && registerStore.emailCodeSuccess !== 1">인증번호 전송</button>
	                                <button type="button" class="btn btn-default auth-cancel-btn auth-dark-btn" 
	                                	style="padding:14px 17px;" @click="registerStore.emailCodeCheck()" v-if="registerStore.emailCodeCheckCount === 1">인증번호 확인</button>
	                            </div>
	                            <p v-if="registerStore.emailCheckCount === 1 && registerStore.emailCodeSuccess === 2 && registerStore.emailCodeCheckCount === 2" style="position: absolute; left:7%; top:81.5%; color: green;">
								  이메일이 이미 존재합니다.
								</p>
	                            <p v-if="registerStore.emailCodeCheckCount === 1 && registerStore.emailCodeSuccess === 2" style="position: absolute; left:7%; top:81.5%; color: green;">
								  이메일 전송에 성공하였습니다.
								</p>
								<p v-if="registerStore.emailCodeCheckCount === 3 && registerStore.emailCodeSuccess === 2" style="position: absolute; left:7%; top:81.5%; color: red;">
								  이메일 전송에 실패했습니다.
								</p>
	                            <p style="position: absolute; left:7%; top:81.5%; color: red;">{{registerStore.emailCodeSuccess === 3?'인증번호가 일치하지 않습니다.':''}}</p>
	                            <p style="position: absolute; left:7%; top:81.5%; color: green;">{{registerStore.emailCodeSuccess === 1?'인증번호가 일치합니다.':''}}</p>
	                        </div>
	
								<h3 style="color: #b7b6b7; margin-left: 5px;">전화번호</h3>
	
	                        <div class="form-group phone-group" style="margin-left: 5px;" >
	                            <select class="form-control phone-select" style="height: 30px; color: black;" v-model="registerStore.phone1">
	                                <option>010</option>
	                                <option>011</option>
	                                <option>031</option>
	                            </select>
	                            <span style="font-size: 30px; margin-bottom: 20px;">-</span>
	                            <input type="text" class="form-control phone-input" maxlength="4" 
	                            	style="height: 30px; color: black;" v-model="registerStore.phone2">
	                            <span style="font-size: 30px; margin-bottom: 20px;">-</span>
	                            <input type="text" class="form-control phone-input" maxlength="4" 
	                            	style="height: 30px; color: black;" v-model="registerStore.phone3">
	                        </div>
	
	                        <div class="terms">
	                        	<label>
	                                <input type="checkbox" true-value="Y" false-value="N" v-model="registerStore.option1"> 만 14세 이상입니다.(필수)
	                            </label>
	                            <label>
	                                <input type="checkbox" true-value="Y" false-value="N" v-model="registerStore.optional_agree"> 이용약관(선택)
	                                <a type="button" data-toggle="modal" data-target="#terms_1">더보기</a>
	                            </label>
	                            <label>
	                                <input type="checkbox" true-value="Y" false-value="N" v-model="registerStore.option2"> 개인정보 수집 및 이용동의(필수)
	                                <a type="button" data-toggle="modal" data-target="#terms_2">더보기</a>
	                            </label>
	                            <label>
	                                <input type="checkbox" true-value="Y" false-value="N" v-model="registerStore.option3"> 개인정보 제3자 제공 동의(필수)
	                                <a type="button" data-toggle="modal" data-target="#terms_3">더보기</a>
	                            </label>
	                        </div>
	
	                        <div class="text-center mt-4">
	                            <button type="button" class="btn btn-default auth-cancel-btn auth-dark-btn" 
	                            	style="color: white; text-decoration: none; margin-top:20px;" @click="registerStore.handleRegisterClick()">회원가입</button>
	                            <button type="button" class="btn btn-default auth-cancel-btn auth-dark-btn" 
	                            	style="color: white; text-decoration: none; margin-top:20px;" onclick="javascript:history.back()">취소</button>
	                            
	                        </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<jsp:include page="terms_1.jsp"></jsp:include>
	<jsp:include page="terms_2.jsp"></jsp:include>
	<jsp:include page="terms_3.jsp"></jsp:include>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/auth/registerStore.js"></script>
	
	<script>
		const {createApp, onMounted} = Vue
		const {createPinia} = Pinia
		
		const registerApp = createApp({
			setup(){
				const registerStore = useRegisterStore()
				
				
				
				return{
					registerStore
				}
			}
		})
		registerApp.use(createPinia())
		registerApp.mount("#register")
	</script>
</body>
</html>
