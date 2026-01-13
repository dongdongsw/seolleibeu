<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 댓글</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700"
	rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>

<body>

	<div class="content auth-wrapper" style="margin-top: -17px;">
		<div class="container" id="reply_list">
			<div class="row">
			  <div class="mypage-sizing">
				<div class="col-lg-9 col-md-9 col-sm-12">
					<main class="mypage-main">
					  <div class="search search-row">
						  <h2 class="mypage-title">내가 쓴 댓글</h2>
						  <div class="input-group reply-search" style="margin-top: -40px;">
						    <input type="text" class="form-control"
						           placeholder="검색어를 입력하세요.">
						    <span class="input-group-addon">
						      <i class="fa fa-search"></i>
						    </span>
						  </div>
						</div>
						<div class="info-card" v-for="vo in store.list" :key="vo.cno">
								<div class="post-block my-course-item" style="margin-bottom:0">
									<!-- 왼쪽 이미지 -->
									<div class="course-thumb">
										<img :src="vo.thumbnail" style="width:80px; height: 80px">
									</div>

									<!-- 가운데 정보 -->
									<div class="mypage-reply">
										<h4 class="reply-title">{{vo.title}}</h4>
										<p style="margin-bottom: 10px">{{vo.cr_content}}</p>
										<div class="course-meta">
											댓글 쓴 날짜 : <span class="date">{{ vo.cr_update_at ? vo.cr_update_at : vo.cr_created_at }}</span>
										</div>
									</div>

									<!-- 오른쪽 버튼 -->
									<div class="course-actions">
										<a :href="'/course/detail?cno='+vo.cno" class="btn btn-xs">바로가기</a>
									</div>
								</div>
								<hr>
						</div>

					</main>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="st-pagination">
							<ul class="pagination">
                               <li v-if="store.startPage>1"><a class="nav-link" @click="store.movePage(store.startPage-1)">&laquo;</a></li>
						       <li v-for="i in store.range" :class="i===store.curpage?'active':''"><a class="nav-link" @click="store.movePage(i)">{{i}}</a></li>
						       <li v-if="store.endPage<store.totalpage"><a class="nav-link" @click="store.movePage(store.endPage+1)">&raquo;</a></li>
                            </ul>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-3 col-sm-12" style="margin-top: 80px;">
					<div class="sidenav">
						<ul class="listnone">
							<li><a href="../mypage/my_info">내 정보</a></li>
				            <li><a href="../mypage/my_favorite">즐겨찾기</a></li>
				            <li><a href="../mypage/my_bookmark">북마크</a></li>
				            <li><a href="../mypage/my_course">나의 코스</a></li>
				            <li><a href="../mypage/my_review">내가 쓴 리뷰</a></li>
				            <li><a href="../mypage/my_reply" class="active">내가 쓴 댓글</a></li>
				            <li><a href="../mypage/my_reserve">예매 내역</a></li>
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
	<script src="/vuejs/mypage/reply.js"></script>
    <script type="text/javascript">
     const {createApp,onMounted} = Vue
     const {createPinia} = Pinia
     const replyApp = createApp({
   	  	setup() {
   	    	const store = useReplyStore()
   	    		onMounted(() => {
   	      	store.replyMypage()
   	    })
   	    return {
   	    		store
   	    	}
   	  }
   	})
   	replyApp.use(createPinia())
   	replyApp.mount('#reply_list')
    </script>
</body>
</html>
