<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="users_list">
	<div id="wrapper">
		<div class="container-fluid">
			<div class="card shadow mb-4" style="margin-top: 16px;">
				<div class="card-header py-3 d-flex justify-content-between align-items-center">
				   <h6 class="m-0 font-weight-bold text-primary">사용자 조회</h6>
				    <div class="search-wrapper">
				        <div class="input-group search-bar">
				            <input type="text" class="form-control bg-light border-0 small"
				                placeholder="Search for..." aria-label="Search" v-model="store.name" ref="nameRef" @keyup.enter="store.find(nameRef)"
				                aria-describedby="basic-addon2">
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
										<th style="width: 5%">사진</th>
										<th style="width: 25%">아이디</th>
										<th style="width: 15%">이름</th>
										<th style="width: 10%">전화번호</th>
										<th style="width: 25%">이메일</th>
										<th style="width: 10%">가입일</th>
										<th style="width: 5%">상태</th>
										<th style="width: 5%"></th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(vo,index) in store.list" :key="index">
										<td><img class="img rounded-circle" src="/images/프로필 사진.png" style="width: 60px;height: 50px;"></td><!-- :src="vo.profile_img" -->
										<td>{{vo.id}}</td>
										<td>{{vo.name}}</td>
										<td>{{vo.phone}}</td>
										<td>{{vo.email}}</td>
										<td>{{vo.created_at.split('T')[0]}}</td>
										<td>{{vo.status}}</td>
										<td class="text-center">
											<div class="dropdown">
												<a href="#" data-toggle="dropdown"> <i
													class="fas fa-ellipsis-h"></i>
												</a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#">활동</a> <a
														class="dropdown-item text-danger" href="#">정지</a>
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
</div>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/vue-demi"></script>
<script src="https://unpkg.com/pinia@2/dist/pinia.iife.prod.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/vuejs/axios.js"></script>
<script src="/vuejs/admin/users.js"></script>
	<script>
	 const {createApp,onMounted,ref}=Vue
	 const {createPinia}=Pinia
	 const usersApp=createApp({
		 setup(){
			 const store=useUsersStore()
			 const nameRef=ref(null)
			 
			 onMounted(()=>{
				 store.usersListData()
			 })
			 return {
				 store,nameRef
			 }
		 }
	 })
	 usersApp.use(createPinia())
	 usersApp.mount('#users_list')
	</script>
</body>
</html>