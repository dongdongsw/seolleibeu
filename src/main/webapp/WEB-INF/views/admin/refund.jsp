<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="admin_refund">
	<div id="wrapper">
		<div class="container-fluid">
			<div class="card shadow mb-4" style="margin-top: 16px;">
				<div class="card-header py-3 d-flex justify-content-between align-items-center">
				   <h6 class="m-0 font-weight-bold text-primary">환불 조회</h6>
				    <div class="search-wrapper">
				        <div class="input-group search-bar">
				            <input type="text" class="form-control bg-light border-0 small"
				                placeholder="Search for..." aria-label="Search"
				                aria-describedby="basic-addon2" v-model="store.name" @keyup.enter="store.find(nameRef)">
				            <div class="input-group-append">
				                <button class="btn btn-primary" @click="store.find(nameRef)">
				                    <i class="fas fa-search fa-sm"></i>
				                </button>
				            </div>
				        </div>
				    </div>
				</div>
				<div style="height:630px;">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th style="width: 5%">번호</th>
										<th style="width: 10%">사용자 이름</th>
										<th style="width: 40%">제목</th>
										<th style="width: 10%">상태</th>
										<th style="width: 10%">환불 금액</th>
										<th style="width: 10%">환불 요청일</th>
										<th style="width: 5%">환불 사유</th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(vo,index) in store.list" :key="index">
										<td>{{vo.rf_id}}</td>
										<td>{{vo.name}}</td>
										<td>{{vo.pname}}</td>
										<td>{{vo.rf_status}}</td>
										<td>{{vo.rf_amount}}원</td>
										<td>{{vo.reqday}}</td>
										<td class="text-center">
											<div class="dropdown">
												<a href="#" data-toggle="dropdown"> <i
													class="fas fa-ellipsis-h"></i>
												</a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal" @click="store.vo=vo">상세보기</a>
												</div>
											</div>
											 
										</td>
									</tr>
								</tbody>
							</table>
							<div class="dataTables_wrapper" style="position: absolute; top: 90%; left: 40%;">
								<div class="dataTables_paginate paging_simple_numbers">
									<ul class="pagination justify-content-center">
										<li class="page-item" v-if="store.startPage>1"><a class="page-link" @click="store.pageChange(store.startPage-1)">이전</a></li>
										<li :class="i==store.curpage?'page-item active':'page-item'" v-for="i in store.range"><a class="page-link" @click="store.pageChange(i)">{{i}}</a></li>
										<li class="page-item" v-if="store.endPage<store.totalpage"><a class="page-link" @click="store.pageChange(store.endPage+1)">다음</a></li>
								    </ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog" v-if="store.vo.rf_id && store.vo">
				<div class="modal-content" style="width: 700px;">
					<div class="modal-header">
						<h4 class="modal-title">환불 사유</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<textarea rows="5" cols="68" v-model="store.vo.rf_msg" readonly></textarea>
					</div>
					<div class="modal-footer">
					  <div v-if="store.vo.rf_status==='환불 대기'">
						<button type="button" class="btn btn-default" data-dismiss="modal" @click="store.adminRefundUpdate(store.vo.rf_id,store.vo.uno,'환불 승인')">환불 승인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" @click="store.adminRefundUpdate(store.vo.rf_id,store.vo.uno,'환불 실패')">환불 실패</button>
					  </div>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<script src="https://unpkg.com/vue-demi"></script>
	<script src="https://unpkg.com/pinia@2/dist/pinia.iife.prod.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/refund/admin_refund.js"></script>
	<script>
	 const {createApp,onMounted,ref} = Vue
	 const {createPinia} = Pinia
	 
	 const adminApp=createApp({
		 setup(){
			 const store=useAdminRefundStore()
			 const nameRef=ref(null)
			 
			 onMounted(()=>{
				 store.adminRefundListData()
			 })
			 return {
				 store,nameRef
			 }
		 }
	 })
	 adminApp.use(createPinia())
	 adminApp.mount('#admin_refund')
	</script>
</body>
</html>