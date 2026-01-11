	/*const uploadArea = document.getElementById('uploadArea')
	const imageInput = document.getElementById('imageInput')
	const imagePreview = document.getElementById('imagePreview')
	const previewImg = document.getElementById('previewImg')
	const removeImage = document.getElementById('removeImage')*/
	const starWrappers = document.querySelectorAll('.star-wrapper')
	const ratingValue = document.getElementById('ratingValue')
	const ratingText = document.getElementById('ratingText')
	
	// 이미지 업로드 클릭
	/*uploadArea.addEventListener('click', () => {
		imageInput.click()
	})*/
	
	// 이미지 미리보기
	/*imageInput.addEventListener('change', (e) => {
		const file = e.target.files[0]
		if (file) {
			const reader = new FileReader()
			reader.onload = (e) => {
				previewImg.src = e.target.result
				uploadArea.style.display = 'none'
				imagePreview.style.display = 'block'
			}
			reader.readAsDataURL(file)
		}
	})*/
	
	// 이미지 삭제
	/*removeImage.addEventListener('click', () => {
		imageInput.value = ''
		uploadArea.style.display = 'block'
		imagePreview.style.display = 'none'
	})*/
	
	// 별점 선택 (0.5 단위)
	starWrappers.forEach(wrapper => {
		wrapper.addEventListener('click', (e) => {
			const rect = wrapper.getBoundingClientRect()
			const x = e.clientX - rect.left
			const isHalf = x < rect.width / 2
			const value = parseInt(wrapper.dataset.value)
			const rating = isHalf ? value - 0.5 : value
			
			ratingValue.value = rating
			ratingText.textContent = rating + '점'
			updateStars(rating)
		})
	})
	
	function updateStars(rating) {
		starWrappers.forEach(wrapper => {
			const value = parseInt(wrapper.dataset.value)
			const icon = wrapper.querySelector('i')
			
			if (value <= Math.floor(rating)) {
				icon.className = 'fa fa-star filled'
			} else if (value === Math.ceil(rating) && rating % 1 !== 0) {
				icon.className = 'fa fa-star-half-o filled'
			} else {
				icon.className = 'fa fa-star-o'
			}
		})
	}
	
	// 폼 제출 시 별점 체크
	document.getElementById('reviewForm').addEventListener('submit', (e) => {
		if (!ratingValue.value) {
			e.preventDefault()
			alert('별점을 선택해주세요.')
		}
	})