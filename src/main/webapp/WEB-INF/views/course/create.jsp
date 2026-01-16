<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="referrer" content="no-referrer">
<title>설레이브 - 코스 생성</title>
<link href="/css/style.css" rel="stylesheet">
<link href="/css/course.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/vue-demi"></script>
<script src="https://unpkg.com/pinia@2/dist/pinia.iife.prod.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="tab-content" id="course_insert">
		<!-- STEP 1 -->
		<div id="step1" class="tab-pane fade in active">
			<div class="course-container">
				<div class="choose-main">
					<div class="side-menu">
						<div style="height: 50px"></div>
						<div class="menu active text-center">
							STEP 1<br>장소 선택
						</div>
						<div class="menu text-center">
							STEP 2<br>상세 내용
						</div>
					</div>
					<div class="choose-left">

						<div class="place-main">
							<div class="place-search">
								<div class="input-group">
									<input type="text" class="form-control" ref="keywordRef" v-model="store.keyword" @keyup.enter="store.find(keywordRef)"
										placeholder="장소명 또는 주소를 검색하세요." aria-describedby="basic-addon2">
									<span class="input-group-addon" id="basic-addon2" @click="store.find(keywordRef)"><i class="fa fa-search"></i></span>
								</div>
								<div class="cate text-center">
									<button @click="store.cateButton('명소')" :style="store.type=='명소'?'color:#d2cfcb':''">
										명소
									</button>  
									<button @click="store.cateButton('액티비티')" :style="store.type=='액티비티'?'color:#d2cfcb':''">
										액티비티
									</button>
									<button @click="store.cateButton('연극/뮤지컬')" :style="store.type=='연극/뮤지컬'?'color:#d2cfcb':''"> 
										연극/뮤지컬
									</button> 
									<button @click="store.cateButton('전시')" :style="store.type=='전시'?'color:#d2cfcb':''">
										전시
									</button> 
									<button @click="store.cateButton('카페')" :style="store.type=='카페'?'color:#d2cfcb':''">
										카페
									</button> 
									<button @click="store.cateButton('한식')" :style="store.type=='한식'?'color:#d2cfcb':''">
										한식
									</button> 
									<button @click="store.cateButton('양식')" :style="store.type=='양식'?'color:#d2cfcb':''">
										양식
									</button> 
									<button @click="store.cateButton('일식')" :style="store.type=='일식'?'color:#d2cfcb':''">
										일식
									</button>  
								</div>
							</div>
							<div class="place-list">
								<div class="place-result">
									<h4>검색 결과</h4>
									<div class="list-scroll">
											<div class="place" v-for="(vo, index) in store.place_list.slice(0, 50)" :key="index">
												<div class="thumb">
													<img :src="vo.thumbnail" width="100px"
														height="102px">
												</div>
												<div class="card-right">
													<div class="place-info">
														<h5>{{vo.name}}</h5>

														<p>{{vo.addr}}</p>
														<p>{{vo.category}}</p>
													</div>
													<div class="btns" @click="store.select(vo.pno)">
														<button>
															<i class="fa fa-plus" aria-hidden="true"></i>
														</button>
													</div>
												</div>
											</div>
									</div>
								</div>
								<div class="place-choosed">
									<h4>선택된 장소</h4>
									<div class="list-scroll">
											<div class="place" v-for="(svo, index) in store.selected" :key="index">
												<div class="thumb">
													<img :src="svo.thumbnail" width="100px"
														height="102px">
												</div>
												<div class="card-right">
													<div class="place-info">
														<h5>{{svo.name}}</h5>

														<p>{{svo.addr}}</p>
														<p>{{svo.category}}</p>
													</div>
													<div class="btns" @click="store.remove(svo.pno)">
														<button>
															<i class="fa fa-minus" aria-hidden="true"></i>
														</button>
													</div>
												</div>
											</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="map" id="map"></div>
				</div>
				<div class="choose-bottom">
					<div class="start">
						<a class="btn btn-default" onclick="javascript:history.back()">취소</a>
					</div>
					<div class="cen"></div>
					<div class="end">
						<a class="btn btn-default" data-toggle="tab" :href="store.step_ok=='ok' ? '#step2':'#step1'" @click="store.step()">다음</a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- STEP 2 -->
		<div id="step2" class="tab-pane fade">
			<div class="course-container">
				<div class="choose-main">
					<div class="side-menu">
						<div style="height: 50px"></div>
						<div class="menu text-center">
							STEP 1<br>장소 선택
						</div>
						<div class="menu active text-center">
							STEP 2<br>상세 내용
						</div>
					</div>
					<div class="container create-form">
						<div class="col-md-6">
							<div class="form-group has-feedback">
								<label class="control-label">코스 제목</label> <input type="text" 
									class="form-control" placeholder="코스 제목을 입력하세요." ref="titleRef" v-model="store.title">
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="form-group">
								<label class="control-label">코스 설명</label>
								<textarea class="form-control" id="textarea" name="textarea" ref="contentRef" v-model="store.content"
									rows="12" placeholder="코스 설명을 작성하세요."></textarea>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="form-group">
								<label class="control-label" style="padding-right: 50px">공개 여부</label> 
								<label> 
									<input type="radio" name="open" value="Y" v-model="store.is_public"> 공개
								</label> &nbsp;&nbsp;&nbsp; 
								<label> 
									<input type="radio" name="open" value="N" v-model="store.is_public"> 비공개
								</label>
							</div>
							<p>공개 시 코스 게시판에 등록되고, 비공개 시 마이페이지에서 나만 볼 수 있습니다.</p>
						</div>
					</div>
				</div>
				<div class="choose-bottom">
					<div class="start">
						<a class="btn btn-default" onclick="javascript:history.back()">취소</a>
					</div>
					<div class="cen"></div>
					<div class="end2">
						<a class="btn btn-default" data-toggle="tab" href="#step1">이전</a>
						<a class="btn btn-default" @click="store.courseInsert({titleRef, contentRef})">작성</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/vuejs/axios.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=500f9263086d9dabb5676152c0e94936&libraries=services"></script>	
	<script src="/vuejs/course/courseInsertStore.js"></script>
	<script src="/vuejs/course/courseInsert.js"></script>
</body>
</html>