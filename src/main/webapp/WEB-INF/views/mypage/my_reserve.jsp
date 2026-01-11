<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 리뷰</title>
</head>
<body>
	<div class="content auth-wrapper" style="margin-top: -17px;">
		<div class="container">
			<div class="row">
				<div class="mypage-sizing">
					<div class="col-lg-9 col-md-9 col-sm-12" id="myreserve_list">
						<main class="mypage-main">
							<h2>내 예매 내역</h2>
							<div class="info-card">
								<div v-if="store.rvList.length > 0">
									<div class="post-block my-course-item" style="margin-bottom:0" v-for="(vo, index) in store.rvList" :key="index">
										<!-- 왼쪽 이미지 -->
										<div class="course-thumb">
											<img :src="vo.pvo.thumbnail" style="width: 80px; height: 80px;">
										</div>

										<!-- 가운데 정보 -->
										<div class="mypage-reply">
											<h4 class="reply-title">장소명</h4>
											<p style="margin-bottom: 10px;"><b>가격  </b>{{vo.form_price}} 원 &nbsp;<b>옵션정보  </b>{{vo.rv_option1}} / {{vo.rv_option2}}</p>
											<div class="course-meta">
												예약 등록일시 : <span class="date">{{vo.createday}}</span>
											</div>
										</div>

										<!-- 오른쪽 버튼 -->
										<div class="course-actions">
											<a href="/reserve/reserve_detail" class="btn btn-xs">예약 상세내역</a>
										</div>
									</div><hr>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="st-pagination">
											<ul class="pagination">
												<li v-if="store.startPage>1"><a @click="store.movePage(store.startPage-1)">이전</a></li>
												<li v-for="i in store.range" :key="i"><a :class="i === store.curpage ? 'active' : ''" @click="store.movePage(i)">{{i}}</a></li>
												<li v-if="store.endPage<store.totalpage"><a @click="store.movePage(store.endPage+1)">다음</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div v-else>
									<p>예매 내역이 없습니다</p>
								</div>
							</div>
						</main>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-12" style="margin-top: 80px;">
						<div class="sidenav">
							<ul class="listnone">
								<li><a href="../mypage/my_info">내 정보</a></li>
								<li><a href="../mypage/my_favorite">즐겨찾기</a></li>
								<li><a href="../mypage/my_bookmark">북마크</a></li>
								<li><a href="../mypage/my_course">나의 코스</a></li>
								<li><a href="../mypage/my_review">내가 쓴 리뷰</a></li>
								<li><a href="../mypage/my_reply">내가 쓴 댓글</a></li>
								<li><a href="../mypage/my_reserve" class="active">예매 내역</a></li>
								<li><a href="../mypage/my_refund">환불 내역</a></li>
								<li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/vuejs/axios.js"></script>
    <script src="/vuejs/reserve/reserveStore.js"></script>
    <script>
    	const { createApp, onMounted } = Vue
    	const { createPinia } = Pinia
    	
    	const myreserveApp = createApp({
    		setup() {
    			const store = useReserveStore()
    			
    			onMounted(()=> {
    				store.reserveListData()
    			})
    			
    			return {
    				store
    			}
    		}
    	})
    	myreserveApp.use(createPinia())
    	myreserveApp.mount('#myreserve_list')
    </script>
</body>
</html>