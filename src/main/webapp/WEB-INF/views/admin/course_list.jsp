<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .content {
 	white-space: nowrap;
 	overflow: hidden;
 	text-overflow: ellipsis;
 }
 #dataTable {
  table-layout: fixed;
  width: 100%;
}
a {
	cursor: pointer;
}
</style>
</head>
<body>
<div id="course_list">
	<div id="wrapper">
		<div class="container-fluid">
			<div class="card shadow mb-4" style="margin-top: 16px;">
				<div class="card-header py-3 d-flex justify-content-between align-items-center">
				   <h6 class="m-0 font-weight-bold text-primary">코스 조회</h6>
				    <div class="search-wrapper">
				        <div class="input-group search-bar">
				            <input type="text" class="form-control bg-light border-0 small"
				                placeholder="Search for..." aria-label="Search"
				                aria-describedby="basic-addon2" v-model="store.title" ref="titleRef" @keyup.enter="store.find(titleRef)">
				            <div class="input-group-append">
				                <button class="btn btn-primary" type="button" @click="store.find(titleRef)">
				                    <i class="fas fa-search fa-sm"></i>
				                </button>
				            </div>
				        </div>
				    </div>
				</div>
				  <div class="row">
				    <div style="margin-bottom: 20px;">
					<div class="card-body" style="min-height:80%; ">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th style="width: 5%" class="text-center">번호</th>
										<th style="width: 30%" class="text-center">제목</th>
										<th style="width: 43%" class="text-center">내용</th>
										<th style="width: 10%" class="text-center">등록일</th>
										<th style="width: 5%" class="text-center">상태</th>
										<th style="width: 7%" class="text-center"></th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(vo,index) in store.list" :key="index">
										<td class="text-center">{{vo.cno}}</td>
										<td :title="vo.title" class="text-center">{{vo.title}}</td>
										<td class="content" :title="vo.content">{{vo.content}}</td>
										<td class="text-center">{{vo.created_at.split('T')[0]}}</td>
										<td class="text-center">{{vo.is_public == 'Y'?'공개':'비공개'}}</td>
										<td class="text-center">																		
											<button type="submit" class="btn btn-primary" style="font-size: 10px;" @click="store.courseStatusUpdate(vo.cno,vo.is_public)">상태변경</button>
										</td>
									</tr>
								</tbody>
							</table>
					</div>
				</div>
				<div class="dataTables_wrapper" >
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
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/vue-demi"></script>
<script src="https://unpkg.com/pinia@2/dist/pinia.iife.prod.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/vuejs/axios.js"></script>
<script src="/vuejs/admin/course.js"></script>
	<script>
	 const {createApp,onMounted,ref}=Vue
	 const {createPinia}=Pinia
	 const courseApp=createApp({
		 setup(){
			 const store=useCourseStore()
			 const titleRef=ref(null)
			 
			 onMounted(()=>{
				 store.courseListData()
			 })
			 return {
				 store,titleRef
			 }
		 }
	 })
	 courseApp.use(createPinia())
	 courseApp.mount('#course_list')
	</script>
</body>
</html>