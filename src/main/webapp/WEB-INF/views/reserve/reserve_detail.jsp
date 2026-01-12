<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.testimonial-block {
	margin: 0px auto;
}

.reserve-info ul {
	list-style: none;
	padding: 0;
}

.reserve-info li {
	font-size: 18px;
	margin-bottom: 3px;
	display: flex;
	align-items: center;
}

.reserve-info .label {
	display: inline-block;
	width: 120px;
	padding: 8px 12px;
	border-radius: 4px;
	font-weight: bold;
	color: black;
	flex-shrink: 0;
}

.reserve-info .value {
	margin-left: 10px;
	font-size: 18px;
	flex: 1;
	word-break: keep-all;
}

.reserve-info hr {
	margin: 10px 0;
	border-top: 1px solid #ddd;
}

.reserve-layout {
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
	gap: 50px;
}

.reserve-content {
	flex: 0 0 550px;
}

.reserve-thumbnail {
	width: 300px;
	height: 100%;
	margin: 30px 0px 0px 0px;
	flex-shrink: 0;
	border: 2px solid #ddd;
	border-radius: 8px;
	overflow: hidden;
	background-color: #f9f9f9;
	display: flex;
	align-items: center;
	justify-content: center;
}

.reserve-thumbnail img {
	width: 300px;
	height: 100%;
	object-fit: cover;
}
</style>
</head>
<body>
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h1 class="page-title">예매</h1>
                        <p>상세 보기</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="testimonial-block bg-light pinside30 mb30" style="padding: 10px; width: 960px;" id="reserved_detail">
								<div class="post-block" style="margin-top: 20px;">
									<div class="reserve_detail">
										<div class="reserve-layout">
											<div class="reserve-content">
												<div class="reserve-info">
													<ul>
														<li>
															<span class="label">컨텐츠명</span>
															<span class="value">{{store.rvvo.pvo.name}}</span>
														</li>
														<li>
															<span class="label">예약상태</span>
															<span class="value">{{store.rvvo.rv_status}}<a class="btn btn-default btn-sm" style="margin-left: 10px;" v-if="store.rvvo.rv_status === '예약대기'" @click="requestPayment()">결제하기</a></span>
														</li>
														<li>
															<span class="label">업체명</span>
															<span class="value">{{store.rvvo.pvo.company}}</span>
														</li>
														<li>
															<span class="label">주소</span>
															<span class="value">{{store.rvvo.pvo.addr}}</span>
														</li>
														<li>
															<span class="label">문의전화</span>
															<span class="value">{{store.rvvo.pvo.phone}}</span>
														</li>
													</ul><hr>
													<ul>
														<li>
															<span class="label">예약옵션</span>
															<span class="value"> 
																<span v-if="store.rvvo.opday">{{store.rvvo.opday}}&nbsp;</span>
																<span v-if="store.rvvo.rv_time">{{store.rvvo.rv_time}}&nbsp;</span>
																<span v-if="store.rvvo.rv_option">{{store.rvvo.rv_option}}</span>
															</span> 
														</li>
														<li>
															<span class="label">금액</span>
															<span class="value">{{store.rvvo.form_price}} 원 x {{store.rvvo.rv_amount}} = {{(store.rvvo.rv_price * store.rvvo.rv_amount).toLocaleString()}} 원</span>
														</li>
													</ul><hr>
													<ul>
														<li>
															<span class="label">닉네임</span>
															<span class="value">{{store.rvvo.nickname}}</span>
														</li>
														<li>
															<span class="label">연락처</span>
															<span class="value">{{store.rvvo.phone}}</span>
														</li>
														<li>
															<span class="label">이메일</span>
															<span class="value">{{store.rvvo.email}}</span>
														</li>
													</ul><hr>
													<ul>
														<li>
															<span class="label">결제금액</span>
															<span class="value" v-if="store.rvvo.rv_status === '예약완료'">20,000원</span>
														</li>
														<li>
															<span class="label">결제수단</span>
															<span class="value" v-if="store.rvvo.rv_status === '예약완료'">카드결제</span>
														</li>
														<li>
															<span class="label">결제일시</span>
															<span class="value" v-if="store.rvvo.rv_status === '예약완료'">2025-12-31 17:28:25</span>
														</li>
													</ul>
												</div>
											</div>
											<div class="reserve-thumbnail">
												<img :src="store.rvvo.pvo.thumbnail">
											</div>
										</div>
									</div>
								</div>
								<div class="row text-right" style="margin-right: 1px; margin-bottom: 10px;">
									<a class="btn btn-default btn-sm" @click="store.reserveExposureChange(store.rvvo.rvno)">예매내역 삭제</a>&nbsp;
									<a href="../mypage/review_create" class="btn btn-default btn-sm">리뷰 작성</a>&nbsp;
									<a href="javascript:history.back()" class="btn btn-default btn-sm">목록</a>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
        </div>
    </div>
    <script src="/vuejs/axios.js"></script>
    <script src="/vuejs/reserve/reserveStore.js"></script>
    <!-- <script src="https://js.tosspayments.com/v2/standard"> -->
    <script>
	    const { createApp, onMounted } = Vue
	    const { createPinia } = Pinia
	    
	    const reserveDetailApp = createApp({
	    	setup() {
	    		const store = useReserveStore()
	    		const params = new URLSearchParams(location.search)
	    		const rvno = params.get('rvno')
	    		
	    		onMounted(()=> {
	    			store.reserveDetailData(rvno)
	    		})
	    		
	    		return {
	    			store
	    		}
	    	}
	    })
	    reserveDetailApp.use(createPinia())
	    reserveDetailApp.mount('#reserved_detail')
    </script>
</body>
</html>