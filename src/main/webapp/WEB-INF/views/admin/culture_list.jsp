<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .addr{
 	overflow: hidden;
 	text-overflow: ellipsis;
 	white-space: nowrap;
 }
 #dataTable {
  table-layout: fixed;
  width: 100%;
}
 .type {
 	font-size: 25px;
 }
</style>
</head>
<body>
<div id="culture_list">
	<div id="wrapper">
		<div class="container-fluid">
			<div class="card shadow mb-4" style="margin-top: 16px;">
				<div class="card-header py-3 d-flex justify-content-between align-items-center">
				   <h6 class="m-0 font-weight-bold text-primary">문화</h6>
				    <div class="search-wrapper">
				        <div class="input-group search-bar">
				            <input type="text" class="form-control bg-light border-0 small"
				                placeholder="Search for..." aria-label="Search"
				                aria-describedby="basic-addon2" v-model="store.name" ref="nameRef" @keyup.enter="store.find(nameRef)">
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
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th style="width: 4%">번호</th>
										<th style="width: 25%">이름</th>
										<th style="width: 38%">주소</th>
										<th style="width: 13%">전화번호</th>
										<th style="width: 7%">상태</th>
										<th style="width: 3%"></th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(vo,index) in store.list" :key="index">
										<td>{{vo.pno}}</td>
										<td :title="vo.name">{{vo.name}}</td>
										<td class="addr" :title="vo.addr">{{vo.addr}}</td>
										<td class="addr">{{vo.phone}}</td>
										<td>비공개</td>
										<td class="text-center">
											<div class="dropdown">
												<a href="#" data-toggle="dropdown"> <i
													class="fas fa-ellipsis-h"></i>
												</a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal" @click="store.modalDetailData(vo.pno)">상세보기</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="dataTables_wrapper" style="margin-top: 15px;">
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
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="width: 1100px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" v-if="store.detail">
				    <div>
				        <h5>{{store.detail.name}}</h5>
				    </div>
					    <div style="display: flex; gap:10px; align-items: flex-start;">
					        <div>
					            <img :src="store.detail.thumbnail" style="width: 350px; height: 250px;">
					        </div>
					        <div style="flex: 1;">
					            <table>
					                <tbody>
					               		<tr>
					                        <td style="color: black;" class="type">{{store.detail.type}}</td>
					                    </tr>
					                    <tr>
					                        <th width="15%">주소</th>
					                        <td width="85%">{{store.detail.addr}}</td>
					                    </tr>
					                    <tr>
					                        <th>전화번호</th>
					                        <td>{{store.detail.phone}}</td>
					                    </tr>
					                    <tr>
					                        <th>주차</th>
					                        <td>{{store.detail.parking}}</td>
					                    </tr>
					                    <tr>
					                        <th>이용등급</th>
					                        <td>{{store.detail.rating ?? '전연령'}}</td>
					                    </tr>
					                    <tr>
					                        <th>운영시간</th>
					                        <td>{{store.detail.hours}}</td>
					                    </tr>
					                    <tr>
					                        <th>회사</th>
					                        <td>{{store.detail.company ?? '없음'}}</td>
					                    </tr>
					                </tbody>
					            </table>
					        </div>
					    </div>
					</div>
							<div class="modal-footer">
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
	<script src="/vuejs/admin/culture.js"></script>
	<script>
	 const {createApp,onMounted,ref}=Vue
	 const {createPinia}=Pinia
	 const cultureApp=createApp({
		 setup(){
			 const store=useCultureStore()
			 const nameRef=ref(null)
			 
			 onMounted(()=>{
				 store.cultureListData()
				 store.modalDetailData()
			 })
			 return {
				 store,nameRef
			 }
		 }
	 })
	 cultureApp.use(createPinia())
	 cultureApp.mount('#culture_list')
	</script>
</body>
</html>