//const {defineStore} = Pinia
const useMypagePwd=Pinia.defineStore('mypagePwd',{
	state:()=>({
		pwd:'',
		error:''
	}),
	actions:{
		async checkPwd(){
			if (this.pwd.trim() === '') {
		        this.error = '비밀번호를 입력하세요';
		        return;
		      }
		          const res = await axios.post('/mypage/mypagePwd', null, {
		            params: {
		              pwd: this.pwd
		            }
		          });
			  if (res.data === true) {
			            location.href = '/mypage/my_deleteModal';
			          } 					else {
					        this.error = '비밀번호가 틀렸습니다'
					        this.pwd = ''
					      }
					    }
					  }
					})
