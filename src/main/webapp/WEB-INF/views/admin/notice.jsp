<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
    color: inherit;
    text-decoration: none;
}

a:hover {
    text-decoration: none;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div class="container-fluid">
			<div class="card shadow mb-4" style="margin-top: 16px;">
				<div class="card-header py-3 d-flex justify-content-between align-items-center">
				   <h6 class="m-0 font-weight-bold text-primary">공지사항 조회</h6>
				    <div class="search-wrapper">
					<a href="/admin/notice_create" class="btn btn-xs btn-primary"><i
						class="fas fa-edit"></i>&nbsp;새글</a>
				    </div>
				</div>
				<div style="height:630px;">
					<div class="card-body" id="notice_list">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th style="width: 10%">번호</th>
										<th style="width: 50%">제목</th>
										<th style="width: 15%">작성자</th>
										<th style="width: 5%">조회수</th>
										<th style="width: 15%">작성일</th>
										<th style="width: 5%"></th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="notice in store.notice_list" :key="notice.n_id">
										<td>{{notice.n_id}}</td>
										<td><a :href="'/admin/notice_detail?n_id=' + notice.n_id">{{notice.n_title}}</a></td>
										<td>관리자</td>
										<td>{{notice.hit}}</td>
										<td>{{notice.created_at}}</td>
										<td class="text-center">
											<div class="dropdown">
												<a href="#" data-toggle="dropdown"> <i
													class="fas fa-ellipsis-h"></i>
												</a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" :href="'/admin/notice_update?n_id=' + notice.n_id">수정</a>
													<a class="dropdown-item text-danger"  @click.prevent="deleteNotice(notice.n_id)">삭제</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="dataTables_wrapper" style="position: absolute; top: 90%; left: 40%;">
								<div class="dataTables_paginate paging_simple_numbers">
									<ul class="pagination justify-content-center">
										<li v-if="store.startPage>1"><a class="page-link"
											@click="store.movePage(store.startPage-1)">&laquo;</a></li>
										<li v-for="i in store.range"
											:class="i===store.curpage?'page-item active':'page-item'"><a
											class="page-link" @click="store.movePage(i)">{{i}}</a></li>
										<li v-if="store.endPage<store.totalpage"><a
											class="page-link" @click="store.movePage(store.endPage+1)">&raquo;</a></li>
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
	<script src="https://unpkg.com/vue-demi@0.14.6/lib/index.iife.js"></script>
	<script src="https://unpkg.com/pinia@2/dist/pinia.iife.prod.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/notice/noticeStore.js"></script>
    <script type="text/javascript">
     const {createApp,onMounted} = Vue
     const {createPinia} = Pinia
     const noticeApp = createApp({
    	  setup() {
    	    const store = useNoticeStore()

    	    const deleteNotice = async (n_id) => {
    	      if (!confirm('정말 삭제하시겠습니까?')) return
    	      await store.noticeDelete(n_id)
    	      store.noticeListData()
    	    }

    	    onMounted(() => {
    	      store.noticeListData()
    	    })

    	    return {
    	      store,
    	      deleteNotice
    	    }
    	  }
     })
     noticeApp.use(createPinia())
     noticeApp.mount('#notice_list')
    </script>
</body>
</html>