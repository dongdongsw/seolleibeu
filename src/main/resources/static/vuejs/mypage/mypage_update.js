const useInfoUpdateStore = Pinia.defineStore('info_update', {
  state: () => ({
    name: '',
    password: '',
    passwordConfirm: '',
    phone: '',

    nameChecked: false,
    phoneChecked: false,
    passwordChecked: false,

    nameMsg: '',
    phoneMsg: '',
    passwordMsg: ''
  }),

  actions: {
	initUserInfo() {
	    this.name = USER_INFO.name
	    this.phone = USER_INFO.phone
		this.nameChecked = true
		this.phoneChecked = true
	},
    // 닉네임 중복확인
    async mypagNameChk() {
      if (this.name.trim() === '') {
        this.nameMsg = '닉네임을 입력하세요'
        this.nameChecked = false
        return
      }

      const res = await axios.get('/mypage/mypagNameChk', {
        params: { name: this.name }
      })

      if (res.data) {
        this.nameChecked = true
        this.nameMsg = '사용 가능한 닉네임입니다'
      } else {
        this.nameChecked = false
        this.nameMsg = '이미 사용 중인 닉네임입니다'
      }
    },

    // 연락처 중복확인
    async mypagPhoneChk() {
      if (this.phone.trim() === '') {
        this.phoneMsg = '연락처를 입력하세요'
        this.phoneChecked = false
        return
      }

      const res = await axios.get('/mypage/mypagPhoneChk', {
        params: { phone: this.phone }
      })

      if (res.data) {
        this.phoneChecked = true
        this.phoneMsg = '사용 가능한 번호입니다'
      } else {
        this.phoneChecked = false
        this.phoneMsg = '이미 사용 중인 번호입니다'
      }
    },

    // 비밀번호 확인
    mypagePwd() {
      if (this.password.trim() === '' || this.passwordConfirm.trim() === '') {
        this.passwordMsg = '비밀번호를 입력하세요'
        this.passwordChecked = false
        return
      }

      if (this.password !== this.passwordConfirm) {
        this.passwordMsg = '비밀번호가 동일하지 않습니다'
        this.passwordChecked = false
      } else {
        this.passwordMsg = '비밀번호가 일치합니다'
        this.passwordChecked = true
      }
    },

    // 저장 전 확인
    canSubmit() {
      if (!this.nameChecked) {
        alert('닉네임 중복확인을 해주세요')
        return false
      }
      if (!this.passwordChecked) {
        alert('비밀번호를 확인해주세요')
        return false
      }
      if (!this.phoneChecked) {
        alert('연락처 중복확인을 해주세요')
        return false
      }
      return true
    },
	
	async save() {
	      if (!this.canSubmit()) return

	      await axios.post('/mypage/update', {
	        name: this.name,
	        phone: this.phone,
	        pwd: this.password
	      })

	      alert('회원 정보가 수정되었습니다')
	      location.href = '/mypage/my_info'
	    }
	  }
	})