<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700"
	rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
<div class="page-header">
        <!-- page header -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h2 class="page-title">공지사항</h2>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="content auth-wrapper" >
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<main class="mypage-main" id="notice_list">
						<div class="row">
							<table class="table">
							</table>
							<table class="table table-hover">
								<thead>
									<tr>
										<th width="10%" class="text-center">번호</th>
										<th width="60%" class="text-center">제목</th>
										<th width="15%" class="text-center">작성일</th>
										<th width="15%" class="text-center">조회수</th>
									</tr>
								</thead>
								<tbody>
									<!-- 공지사항 목록 반복 -->
										<tr style="cursor: pointer;" v-for="notice in store.notice_list" :key="notice.n_id"  @click="goDetail(notice.n_id)">
											<td class="text-center">{{notice.n_id}}</td>
											<td class="text-left">
												{{notice.n_title}}
											</td>
											<td class="text-center">{{notice.created_at}}</td>
											<td class="text-center">{{notice.hit}}</td>
										</tr>
									
								</tbody>
							</table>
							
							<!-- 페이지네이션 -->
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="st-pagination">
									<ul class="pagination">
										<li v-if="store.startPage>1"><a class="nav-link"
											@click="store.movePage(store.startPage-1)">&laquo;</a></li>
										<li v-for="i in store.range"
											:class="i===store.curpage?'active':''"><a
											class="nav-link" @click="store.movePage(i)">{{i}}</a></li>
										<li v-if="store.endPage<store.totalpage"><a
											class="nav-link" @click="store.movePage(store.endPage+1)">&raquo;</a></li>
									</ul>
								</div>
							</div>
						</div>
					</main>
				</div>
			</div>
		</div>
	</div>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/notice/noticeStore.js"></script>
    <script type="text/javascript">
     const {createApp,onMounted} = Vue
     const {createPinia} = Pinia
     const noticeApp=createApp({
    	 setup(){
    		 const store=useNoticeStore();
    		 
    		 const goDetail = (n_id) => {
    			 location.href = '/notice/detail?n_id=' + n_id
    		    }
    		 
    		 const params=new URLSearchParams(location.search)
    		 
    		 onMounted(()=>{
    			 store.noticeListData()
    		 })
    		 
    		 return {
    			 store,
    			 goDetail
    		 }
    	 }
     })
     noticeApp.use(createPinia())
     noticeApp.mount('#notice_list')
    </script>
</body>
</html>