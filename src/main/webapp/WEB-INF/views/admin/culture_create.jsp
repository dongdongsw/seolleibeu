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
				<div class="card-body">
					<form action="/admin/place/insert" method="post"
						enctype="multipart/form-data">
						<div class="mb-3">
							<div class="row">
								<div class="col-lg-6 mb-3">
									<label class="small text-gray-700 font-weight-bold">장소명 (NAME)</label>
									<input type="text" name="name" class="form-control" placeholder="예) 컨텐츠명" required>
								</div>
								<div class="col-lg-3 mb-3">
									<label class="small text-gray-700 font-weight-bold">유형 (TYPE)</label>
									<select name="category" v-model="selectedType" class="form-control" required>
										<option value="" hidden="">선택</option>
										<option value="culture">문화/체험</option>
										<option value="attraction">관광명소</option>
									</select>
								</div>
								<div class="col-lg-3 mb-3">
									<label class="small text-gray-700 font-weight-bold">상세분류 (TYPE2)</label>
									<select name="type" class="form-control" v-if="selectedType === 'culture'">
										<option value="" hidden="">선택</option>
										<option value="연극/뮤지컬">연극/뮤지컬</option>
										<option value="전시">전시</option>
										<option value="액티비티">액티비티</option>
									</select>
									<select name="type" class="form-control" v-if="selectedType === 'attraction'">
										<option value="" hidden="">선택</option>
										<option value="명소">명소</option>
										<option value="자연관광">자연관광</option>
										<option value="엔터테인먼트">엔터테인먼트</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6 mb-3">
									<label class="small text-gray-700 font-weight-bold">주소 (ADDR)</label>
									<input type="text" name="addr" class="form-control" placeholder="예) 서울특별시 마포구 서교동 123-1">
								</div>
								<div class="col-lg-3 mb-3">
									<label class="small text-gray-700 font-weight-bold">문의전화 (PHONE)</label>
									<input type="text" name="phone" class="form-control" placeholder="예) 010-1234-1234">
								</div>
								<div class="col-lg-3 mb-3">
									<label class="small text-gray-700 font-weight-bold">업체/주관 (COMPANY)</label>
									<input type="text" name="company" class="form-control" placeholder="예) SIST엔터테인먼트">
								</div>
							</div>
						</div><hr>
						<div class="mb-3">
							<div class="row" v-if="selectedType === 'culture'">
								<div class="col-lg-3 mb-3">
									<label class="small text-gray-700 font-weight-bold">운영시간 (HOURS)</label>
									<input type="text" name="hours" class="form-control" placeholder="예) 11:00~22:00 (매주 월 휴무)">
								</div>
								<div class="col-lg-3 mb-3">
									<label class="small text-gray-700 font-weight-bold">교통정보 (PARKING)</label>
									<input type="text" name="parking" class="form-control" placeholder="예) 오시는 길, 주차정보">
								</div>
								<div class="col-lg-3 mb-3">
									<label class="small text-gray-700 font-weight-bold">연령등급 (RATING)</label>
									<input type="text" name="rating" class="form-control" placeholder="예) 전체관람가, 만 11세이상 등">
								</div>
								<div class="col-lg-3 mb-3" >
									<label class="small text-gray-700 font-weight-bold">소요시간 (RUNTIME)</label>
									<input type="text" name="runtime" class="form-control" placeholder="예) 약 70분 등">
								</div>
							</div>
							<div class="row" v-if="selectedType === 'attraction'">
								<div class="col-lg-4 mb-3">
									<label class="small text-gray-700 font-weight-bold">운영시간 (HOURS)</label>
									<input type="text" name="hours" class="form-control" placeholder="예) 11:00~22:00 (매주 월 휴무)">
								</div>
								<div class="col-lg-4 mb-3">
									<label class="small text-gray-700 font-weight-bold">교통정보 (PARKING)</label>
									<input type="text" name="parking" class="form-control" placeholder="예) 오시는 길, 주차정보">
								</div>
								<div class="col-lg-4 mb-3" >
									<label class="small text-gray-700 font-weight-bold">입장료 (TICKET)</label>
									<input type="text" name="ticket" class="form-control" placeholder="예) 무료, 15,000원 등">
								</div>
							</div>
						</div><hr>
						<div class="mb-3">
							<div class="row">
								<div class="col-lg-6 mb-3">
									<label class="small text-gray-700 font-weight-bold">대표 이미지 (THUMBNAIL)</label>
									<input type="file" name="thumbnailFile" class="form-control-file" accept="image/*" required>
									<small class="form-text text-muted">업로드 후 서버에서 저장 경로/파일명을 THUMBNAIL 컬럼에 저장</small>
								</div>
								<div class="col-lg-6 mb-3">
									<label class="small text-gray-700 font-weight-bold">상세 이미지 (IMGS)</label>
									<input type="file" name="imgsFiles" class="form-control-file" accept="image/*" multiple>
									<small class="form-text text-muted">여러 장 업로드 후 저장 경로들을 | 로 합쳐 IMGS 컬럼에 저장하는 방식 추천</small>
								</div>
							</div>
						</div><hr>
						<div class="mb-3">
							<div class="row" v-if="selectedType === 'culture'">
								<div class="col-lg-4 mb-3">
									<label class="small text-gray-700 font-weight-bold">시작날짜 (OP_DATE)</label>
									<input type="date" name="op_date_start" class="form-control">
								</div>
								<div class="col-lg-4 mb-3">
									<label class="small text-gray-700 font-weight-bold">종료날짜 (OP_DATE)</label>
									<input type="date" name="op_date_end" class="form-control">
								</div>
								<div class="col-lg-4 mb-3">
									<label class="small text-gray-700 font-weight-bold">시간옵션 (OP_TIME)</label><br>
										<input type="checkbox" name="op_time" value="10:00" style="margin-left: 20px;">10:00
										<input type="checkbox" name="op_time" value="11:00" style="margin-left: 30px;">11:00
										<input type="checkbox" name="op_time" value="12:00" style="margin-left: 30px;">12:00
										<input type="checkbox" name="op_time" value="13:00" style="margin-left: 30px;">13:00
										<input type="checkbox" name="op_time" value="14:00" style="margin-left: 30px;">14:00
										<input type="checkbox" name="op_time" value="15:00" style="margin-left: 30px;">15:00<br>
										<input type="checkbox" name="op_time" value="16:00" style="margin-left: 20px;">16:00
										<input type="checkbox" name="op_time" value="17:00" style="margin-left: 30px;">17:00
										<input type="checkbox" name="op_time" value="18:00" style="margin-left: 30px;">18:00
										<input type="checkbox" name="op_time" value="19:00" style="margin-left: 30px;">19:00
										<input type="checkbox" name="op_time" value="20:00" style="margin-left: 30px;">20:00
										<input type="checkbox" name="op_time" value="21:00" style="margin-left: 30px;">21:00
								</div>
								<div class="col-lg-4 mb-3">
									<label class="small text-gray-700 font-weight-bold">옵션1 (OP_TYPE)</label>
									<input type="text" name="op_type[0]" class="form-control" placeholder="예) 대인">
									<label class="small text-gray-700 font-weight-bold">옵션1 가격 (OP_PRICE)</label>
									<input type="text" name="op_price[0]" class="form-control" placeholder="예) 30000">
								</div>
								<div class="col-lg-4 mb-3">
									<label class="small text-gray-700 font-weight-bold">옵션2 (OP_TYPE)</label>
									<input type="text" name="op_type[1]" class="form-control" placeholder="예) 소인">
									<label class="small text-gray-700 font-weight-bold">옵션2 가격 (OP_PRICE)</label>
									<input type="text" name="op_price[1]" class="form-control" placeholder="예) 20000">
								</div>
								<div class="col-lg-4 mb-3">
									<label class="small text-gray-700 font-weight-bold">옵션3 (OP_TYPE)</label>
									<input type="text" name="op_type[2]" class="form-control" placeholder="예) 유아">
									<label class="small text-gray-700 font-weight-bold">옵션3 가격 (OP_PRICE)</label>
									<input type="text" name="op_price[2]" class="form-control" placeholder="예) 15000">
								</div>
							</div>
							<div class="row" v-if="selectedType === 'attraction'">
								<div class="col-lg-12 mb-3">
									<label class="small text-gray-700 font-weight-bold">소개/설명 (INTRO)</label>
									<textarea name="intro" class="form-control" rows="8" placeholder="장소 소개, 특징, 안내 문구 등"></textarea>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<a href="/admin/place_list" class="btn btn-secondary mr-2">취소</a>
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
