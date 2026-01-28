const api=axios.create({
	timeout: 5000
})

const slowApi = axios.create({
  timeout: 90000
})