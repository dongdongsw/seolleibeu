
const useRegisterStore = defineStore('register',{
	state:()=>({
		emailCode:'', // 이메일 인증번호
		nickname:'', // 닉네임
		id:'', // 아이디
		pwd:'', // 비밀번호
		email: '', //이메일
		phone1:'', // 010
		phone2:'', // 중간 전화번호
		phone3:'', // 끝 전화번호
		option1:0, // 만 14세 이상입니다.(필수)
		option2:0, // 이용약관(선택)
		option3:0, // 개인정보 수집 및 이용동의(필수)
		option4:0,  // 개인정보 제3자 제공 동의(필수)
		nickNameCheckCount:0 // 닉네임 중복 검사
	}),
	actions:{
		async register(){
			await api.post('/auth/registe_vue/',{
				
			})
		},
		async idCheck(){
			await api.get('/auth/idCheck_vue/',{
				params:{
					
				}
			})
			
		},
		async pwdCheck(){
			await api.get('/auth/pwdCheck_vue/',{
				params:{
					
				}
			})
		},
		async nickNameCheck(nickname){
			const result = await api.get('/auth/nickNameCheck_vue/',{
				params:{
					nickname:nickname
				}
			})
			console.log(result.data)
			this.nickNameCheckCount = result.data.nickNameCheckCount
			
		},
		async emailSend(){
			await api.get('/auth/emailSend_vue/',{
				params:{
					
				}
			})
		},
		handleRegisterClick(){
			// 조건문
		}
	}
})