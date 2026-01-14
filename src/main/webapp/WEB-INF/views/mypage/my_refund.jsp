<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 댓글</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<div class="content auth-wrapper" style="margin-top: -17px;">
		<div class="container" id="my_refund">
			<div class="row">
				<div class="mypage-sizing">
					<div class="col-lg-9 col-md-9 col-sm-12">
						<main class="mypage-main">
							<h2>환불 내역</h2>
							<div class="row">
								<table class="table">
								</table>
								<table class="table">
									<thead>
										<tr>
											<th width="10%" class="text-center">번호</th>
											<th width="50%" class="text-center">상품명</th>
											<th width="10%" class="text-center">상태</th>
											<th width="15%" class="text-center">요청일</th>
											<th width="15%" class="text-center">완료일</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(vo,index) in store.list" :key="index">
											<td width="10%" class="text-center">{{vo.rf_id}}</td>
											<td width="50%" class="text-left">{{vo.pname}}</td>
											<td width="10%" class="text-center">{{vo.rf_status}}</td>
											<td width="15%" class="text-center">{{vo.reqday}}</td>
											<td width="15%" class="text-center">{{vo.doneday ? vo.doneday : '-'}}</td>
										</tr>
									</tbody>
								</table>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="st-pagination">
										<ul class="pagination">
											<li v-if="store.startPage>1"><a href="#" @click="store.pageChange(store.startPage-1)">이전</a></li>
											<li v-for="i in store.range" :class="i==store.curpage?'active':''"><a href="#" class="active" @click="store.pageChange(i)">1</a></li>
											<li v-if="store.endPage<store.totalpage" @click="store.pageChange(store.endPage+1)"><a href="#">다음</a></li>
										</ul>
									</div>
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
								<li><a href="../mypage/my_reserve">예매 내역</a></li>
								<li><a href="../mypage/my_refund" class="active">환불 내역</a></li>
								<li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/refund/my_refund.js"></script>
	<script>
	 const {createApp,onMounted} = Vue
	 const {createPinia} = Pinia
	 
	 const refundApp=createApp({
		 setup(){
			 const store=useRefundStore()
			 
			 onMounted(()=>{
			 	store.refundListData()
		 	})
		 	return {
				 store
			 }
		 }
	 })
	 refundApp.use(createPinia())
	 refundApp.mount('#my_refund')
	</script>
</body>
</html>
