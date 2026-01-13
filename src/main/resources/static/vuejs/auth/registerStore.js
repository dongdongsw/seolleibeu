const {defineStore} = Pinia

const useRegisterStore = defineStore('register',{
	state:()=>({
		emailCode:'', // 이메일 인증번호
		name:'', // 닉네임
		id:'', // 아이디
		pwd:'', // 비밀번호
		pwd1:'', // 비밀번호 재입력
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
		nickNameCheckCount:2, // 닉네임 중복 검사
		idCheckCount:2, // 아이디 중복 검사
		emailCheckCount:2, // 이메일 중복 검사
		emailCodeCheckCount:2,
		emailCodeSuccess:2
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
			location.href="/"
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
		async nickNameCheck(){
			const result = await api.get('/auth/nickNameCheck_vue/',{
				params:{
					name:this.name
				}
			})
			console.log(result.data)
			this.nickNameCheckCount = result.data.nickNameCheckCount
			
		},
		async emailCheck(){
			const result = await api.get('/auth/emailCheck_vue/',{
				params:{
					email:this.email
				}
			})
			console.log(result.data)
			this.emailCheckCount = result.data.emailCheckCount
			
			
		},
		async emailSend(){
			const result = await api.get('/auth/emailSend_vue/',{
				params:{
					email:this.email
				}
			})
			this.emailCodeCheckCount = result.data.emailCodeCheckCount
		},
		async emailSend(){
				const result = await api.get('/auth/emailCode_vue/',{
					params:{
						emailCode:this.emailCode
					}
				})
				this.emailCodeSuccess = result.data.emailCodeSuccess
			},
		handleRegisterClick(){
			
			if(this.option1 === 'Y' && this.option2 === 'Y' && this.option3 === 'Y'){
				this.required_agree = 'Y'
			}
			// 조건문
			if(this.idCheckCount === 0){ // 1
				
				if(this.pwd !== '' || this.pwd !== ''){ // 2
					
					if(this.pwd === this.pwd1){ // 3
				
						if(this.idCheckCount === 0){ // 4
							
							if(this.nickNameCheckCount === 0){ // 5
								
								if(this.emailCheckCount === 0){ // 6
									
									//if(this.emailCodeCheckCount === 1){// 7
										
										if(this.phone1 !== '' && (this.phone2 !== ''  && this.phone2.length === 4) && 
											(this.phone3 !== '' && this.phone3.length === 4)){ // 8
											
											if(this.required_agree === 'Y'){ // 9
												
												this.register()
											} // 9
											else{ 
												alert('필수 약관에 동의해주세요!')
											}
										}// 8
										else{
											alert('전화번호를 입력해주세요!');
										}	
									//} // 7
									//else{
									//	alert('이메일 인증번호 인증을 완료해주세요!');
									//}
								} // 6
								else{
									alert('이메일의 중복 검사를 해주세요!');
								}
							} // 5
							else{
								alert('닉네임 중복체크 해주세요!');
							}
						} // 4
						else{
							alert('아이디 중복체크 해주세요!');
						}
					} // 3
					else{
						alert('비밀번호가 일치하지 않습니다!');
					}
				} // 2
				else{
					alert('비밀번호를 입력해주세요!');
				}
			} // 1
			else{
				alert('아이디 중복 검사를 해주세요!');
			}
		}
	}
})