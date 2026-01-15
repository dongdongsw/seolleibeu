<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 등록</title>
</head>
<body>
	<div id="wrapper">
		<div class="container-fluid">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-3">
			</div>
			<div class="card shadow mb-4">
				<div
					class="card-header py-3 d-flex justify-content-between align-items-center">
					<h6 class="m-0 font-weight-bold text-primary">장소 정보 입력</h6>
					<div>
						<a href="/admin/culture_list"
							class="btn btn-outline-secondary btn-xs">목록</a>
					</div>
				</div>
				<div class="card-body" id="restaurant_create">
					<div class="mb-3">
						<div class="row">
							<div class="col-lg-6 mb-3">
								<label class="small text-gray-700 font-weight-bold">장소명 (NAME)</label>
								<input type="text" name="name" class="form-control" v-model="store.vo.name" placeholder="예) 향미각" required>
							</div>
							<div class="col-lg-3 mb-3">
								<label class="small text-gray-700 font-weight-bold">카테고리 (CATEGORY)</label>
								<select name="category" class="form-control" v-model="store.vo.category" required>
									<option value="">선택</option>
									<option value="식당">식당</option>
								</select>
							</div>
							<div class="col-lg-3 mb-3">
								<label class="small text-gray-700 font-weight-bold">유형 (TYPE)</label>
								<input type="text" name="type" class="form-control" v-model="store.vo.type" placeholder="예) 한식, 카페, 주점 등" required>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 mb-3">
								<label class="small text-gray-700 font-weight-bold">주소 (ADDR)</label>
								<input type="text" name="addr" class="form-control" v-model="store.vo.addr" placeholder="에) 서울특별시 마포구 서교동 123-1">
							</div>
							<div class="col-lg-3 mb-3">
								<label class="small text-gray-700 font-weight-bold">업체명 (COMPANY)</label>
								<input type="text" name="company" class="form-control" v-model="store.vo.company" placeholder="예) 향미각 / 기획사명">
							</div>
							<div class="col-lg-3 mb-3">
								<label class="small text-gray-700 font-weight-bold">전화번호 (PHONE)</label>
								<input type="text" name="phone" class="form-control" v-model="store.vo.phone" placeholder="예) (02) 1234-1234">
							</div>
						</div>
					</div><hr>
					<div class="mb-3">
						<div class="row">
							<div class="col-lg-4 mb-3">
								<label class="small text-gray-700 font-weight-bold">운영시간 (HOURS)</label>
								<input type="text" name="hours" class="form-control" v-model="store.vo.hours" placeholder="예) 11:00~22:00 (매주 월 휴무)">
							</div>
							<div class="col-lg-4 mb-3">
								<label class="small text-gray-700 font-weight-bold">좌석/수용 (SEAT)</label>
								<input type="text" name="seat" class="form-control" v-model="store.vo.seat" placeholder="예) 40석 / 최대 100명">
							</div>
							<div class="col-lg-4 mb-3">
								<label class="small text-gray-700 font-weight-bold">주차 (PARKING)</label>
								<input type="text" name="parking" class="form-control" v-model="store.vo.parking" placeholder="예) 주차가능 등">
							</div>
						</div>
					</div>
					<hr>
					<div class="mb-3">
						<div class="row">
							<div class="col-lg-6 mb-3">
								<label class="small text-gray-700 font-weight-bold">대표 이미지 (THUMBNAIL)</label>
								<input type="file" name="thumbnailFile" class="form-control-file" accept="image/*" ref="thumbRef" required>
								<small class="form-text text-muted">업로드 후 서버에서 저장 경로/파일명을 THUMBNAIL 컬럼에 저장</small>
							</div>
							<div class="col-lg-6 mb-3">
								<label class="small text-gray-700 font-weight-bold">상세 이미지 (IMGS)</label>
								<input type="file" name="imgFiles" class="form-control-file" accept="image/*" ref="imgsRef" multiple>
								<small class="form-text text-muted">여러 장 업로드 후 저장 경로들을 | 로 합쳐 IMGS 컬럼에 저장하는 방식 추천</small>
							</div>
						</div>
					</div>
					<hr>
					<div class="mb-4">
						<div class="row">
							<div class="col-lg-6 mb-3">
								<label class="small text-gray-700 font-weight-bold">소개/설명 (INTRO)</label>
								<textarea name="intro" class="form-control" rows="8" v-model="store.vo.intro" placeholder="장소 소개, 특징, 안내 문구 등"></textarea>
							</div>
							<div class="col-lg-6 mb-3">
								<label class="small text-gray-700 font-weight-bold">메뉴/상세정보 (MENU)</label>
								<textarea name="menu" class="form-control" rows="8" v-model="store.vo.menu" placeholder="ex) 짜장면: 7,000원 | 짬뽕: 8,000원 등"></textarea>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-end">
						<a href="javascript:history.back()" class="btn btn-secondary mr-2" >취소</a>
						<button type="button" class="btn btn-primary" @click="onSubmit">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<script src="https://unpkg.com/vue-demi"></script>
	<script src="https://unpkg.com/pinia@2/dist/pinia.iife.prod.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="/vuejs/admin/restaurantCreateStore.js"></script>
	<script>
		const { createApp, ref } = Vue
		const { createPinia } = Pinia
		
		const resCreateApp = createApp({
			setup() {
				const store = useRestaurantCreateStore()
				
				const thumbRef = ref(null)
				const imgsRef = ref(null)
				
				const onSubmit = async()=> {
					try {
						const data = await store.submit(thumbRef.value, imgsRef.value)
						alert('등록 완료')
						location.href='/admin'
					} catch(ex) {
						console.log(ex)
						alert('등록 실패')
					}
				}
				
				return {
					store,
					thumbRef,
					imgsRef,
					onSubmit
				}
			}
		})
		resCreateApp.use(createPinia())
		resCreateApp.mount('#restaurant_create')
	</script>
</body>
</html>