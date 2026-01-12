const {defineStore} = Pinia

const useRegisterStore = defineStore('register',{
	state:()=>({
		emailCode:'', // 이메일 인증번호
		name:'', // 닉네임
		id:'', // 아이디
		pwd:'', // 비밀번호
		email: '', //이메일
		phone:'', // 전화번호 합친 것
		phone1:'', // 010
		phone2:'', // 중간 전화번호
		phone3:'', // 끝 전화번호
		required_agree:'N', // 필수 선택 결론
		optional_agree:'N', // 선택 결론
		option1:'N', // 만 14세 이상입니다.(필수)
		option2:'N', // 개인정보 수집 및 이용동의(필수)
		option3:'N',  // 개인정보 제3자 제공 동의(필수)
		nickNameCheckCount:0, // 닉네임 중복 검사
		idCheckCount:0, // 아이디 중복 검사
		emailCheckCount:0 // 이메일 중복 검사
	}),
	actions:{
		async register(){
			await api.post('/auth/register_vue/',{
				name:this.name,
				id:this.id,
				pwd:this.pwd,
				email:this.email,
				phone:`${this.phone1}-${this.phone2}-${this.phone3}`,
				required_agree:this.required_agree,
				optional_agree:this.optional_agree
			})
		},
		async idCheck(){
			const result = await api.get('/auth/idCheck_vue/',{
				params:{
					id:this.id
				}
			})
			console.log(result.data)
			this.idCheckCount = result.data.idCheckCount
		},
		async pwdCheck(){
			await api.get('/auth/pwdCheck_vue/',{
				params:{
					
				}
				
			})
		},
		async nickNameCheck(){
			const result = await api.get('/auth/nickNameCheck_vue/',{
				params:{
					name:this.name
				}
			})
			console.log(result.data)
			this.nickNameCheckCount = result.data.nickNameCheckCount
			
		},
		async emailSend(){
			const result = await api.get('/auth/emailCheck_vue/',{
				params:{
					email:this.email
				}
			})
			console.log(result.data)
			this.emailCheckCount = result.data.emailCheckCount
			
			if(this.emailCheckCount === 0){
				result = await api.get('/auth/emailSend_vue/',{
					params:{
						
					}
				})
			}
			else{
				// 이메일이 존재하면 알림 메시지
			}
		},
		handleRegisterClick(){
			// 조건문
		}
	}
})