const {defineStore} = Pinia

const useId_PwdStore = defineStore('id_pwd',{
	state:()=>({
		id:'',					// 아이디
		email:'',				// 이메일
		emailCode:'', 
		pwd:'', 				// 비밀번호 1번째 입력
		pwd1:'', 				// 비밀번호 2번쨰 입력	
		emailCheckCount:2 		// 이메일 중복 검사
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
			console.log(result.data)
			this.emailCheckCount = result.data.emailCheckCount
		},
		async emailSend(){
			const result = await api.get('',{
				params:{
					
				}
			})
		},
		async emailCodeCheck(){
			const result = await api.get('',{
				params:{
					
				}
			})
		},
		
		// 비밀번호 찾기 쪽
		async idCheck(){
			const result = await api.get('/auth/idCheck_vue/',{
				params:{
					id:this.id
				}
			})
			console.log(result.data)
			this.idCheckCount = result.data.idCheckCount
		},
		// 비밀번호 완료 누르면 실행되는 버튼
		async pwdChange(){
			if(this.pwd === this.pwd1 && this.pwd !== '' || this.pwd1 !== ''){
				await api.post('/auth/pwdReset_vue/',{
					id:this.id,
					pwd:this.pwd
				})
			}	
			else{
				// 나중에 삭제할거임
				alert('비밀번호가 공백이거나 다름')
			}
		},
		// 아이디 찾기 누르면 실행되는 버튼
		idSearch(){
			
		},
		// 비밀번호 재설정 누르면 검사하는 버튼 
		pwdDataCheck(){
			
		}
		
	}
})