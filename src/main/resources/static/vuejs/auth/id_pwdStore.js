const {defineStore} = Pinia

const useId_PwdStore = defineStore('id_pwd',{
	state:()=>({
		id:'',					// 아이디
		email:'',				// 이메일
		emailCode:'', 
		pwd:'', 				// 비밀번호 1번째 입력
		pwd1:'', 				// 비밀번호 2번쨰 입력	
		emailCheckCount:2, 		// 이메일 중복 검사
		emailCodeCheckCount:2,	// 이메일 전송 여부
		emailCodeSuccess:2,		// 이메일 인증성공 여부
		emailOfId: false,		// 이메일과 아이디가 같은 사용자인지
		idCheckCount:2,
		pwdCheckCount : 2,
		idFindSuccess: false, 	// 아이디 찾기 이메일 검사 완료시 true => 화면 전환을 위해서
		pwdFindSuccess: false,	// 비밀번호 찾기 이메일 검사, 아이디 검사 완료시 true => 화면 전환을 위해서
		foundId:'',
		pwdCheck:/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~@#$!%*?&])[a-zA-Z\d~@#$!%*?&]{8,20}$/ ,
		pwdChangeSuccess:'',
		emailMatched:null
	}),
	actions:{
		// 공용
		// 이메일로 중복 검사
		async emailCheck(){
			const result = await api.get('/auth/emailCheck_vue/',{
				params:{
					email:this.email
				}
			})
			this.emailCheckCount = result.data.emailCheckCount
			if(this.emailCheckCount === 1 && this.id){
			    await this.idFindOfemail()
			    this.emailMatchId()
			  }
		},
		async emailSend(){
			const result = await slowApi.post('/auth/email_send_vue/',{
				email:this.email
			})
			this.emailCheckCount = result.data.emailCheckCount
			this.emailCodeCheckCount = 1
		},
		async emailCodeCheck(){
			const result = await api.get('/auth/emailCode_check_vue/',{
				params:{
					emailCode:this.emailCode
				}
			})
			this.emailCodeSuccess = result.data.emailCodeSuccess
		},
		
		// 비밀번호 찾기 쪽
		async idCheck(){
			const result = await api.get('/auth/idCheck_vue/',{
				params:{
					id:this.id
				}
			})
			this.idCheckCount = result.data.idCheckCount
		},
		// 비밀번호 완료 누르면 실행되는 버튼
		async pwdChange(){

			// 공백 검사
			if (!this.pwd || !this.pwd1) {
				alert('비밀번호를 입력해주세요.')
				return
			}

			// 형식 검사
			if (!this.pwdCheck.test(this.pwd) || !this.pwdCheck.test(this.pwd1)) {
				this.pwdCheckCount = 3
				return
			}

			// 비밀번호 일치 검사
			if (this.pwd !== this.pwd1) {
				alert('비밀번호가 일치하지 않습니다.')
				return
			}

			const result = await api.post('/auth/pwdReset_vue/', {
				id: this.id,
				pwd: this.pwd
			})

			this.pwdChangeSuccess = result.data

			// 성공했을때
			if (this.pwdChangeSuccess === 'success') {
				const go = confirm('비밀번호 변경에 성공하셨습니다. 로그인 페이지로 이동하시겠습니까?')
				if (go) {
					window.location.href = '/auth/login'
				}
			}
		},
		// 이메일로 아이디 찾기
		async idFindOfemail(){
			const result = await api.get('/auth/find_id_vue/',{
				params:{
					email:this.email
				}
			})
			this.foundId = result.data
		},
		async emailMatchId(){
			if(this.id !== this.foundId){
				this.emailOfId = false
				this.emailCheckCount = 2
			}
			else{
				this.emailOfId = true
				
			}
		},
		// 아이디 찾기 누르면 실행되는 버튼
		async idSearch(){
			if(this.emailCheckCount === 1){ 
				if(this.emailCodeSuccess === 1){
					this.idFindSuccess = true
					this.idFindOfemail()
				}
				else{
					alert('이메일 인증번호 인증을 완료해주세요!');
				}
			}
			else{
				alert('이메일의 중복 검사를 해주세요!');
			}
		},
		// 비밀번호 재설정 누르면 검사하는 버튼 
		pwdDataCheck(){
			// 아이디 검사 했는지
			if(this.idCheckCount === 1){ 
				// 이메일 검사 했는지
				if(this.emailCheckCount === 1){ 
					if(this.emailOfId === true){
						// 이메일 코드 인증 했는지
						if(this.emailCodeSuccess === 1){
							this.pwdFindSuccess = true
						}
						else{
							alert('이메일 인증번호 인증을 완료해주세요!');
						}
					}
					else{
						this.pwdCheckCount = 3
						alert('아이디와 이메일이 일치하지 않습니다.');
					}
					
				}
				else{
					alert('이메일의 중복 검사를 해주세요!');
				}
			}
			else{
				alert('아이디 확인이 완료되지 않았습니다!')
			}
		}
		
	}
})