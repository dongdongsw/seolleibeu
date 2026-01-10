<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/course.css" rel="stylesheet">
<style type="text/css">

</style>
</head>
<body>
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h1 class="page-title">추천 코스</h1>
						<p>
							설레이브 유저가 직접 추천하는 데이트 코스,<br> 설렘 가득한 데이트를 즐겨보세요!
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="content" id="course_list">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="row">
						<div class="list-head">
							<div class="widget widget-search col-md-3">

									<div class="input-group" style="width: 420px">
									<input type="text" class="form-control" ref="keywordRef" v-model="store.keyword" @keyup.enter="store.find(keywordRef)"
										placeholder="검색어를 입력하세요." aria-describedby="basic-addon2">
									<span class="input-group-addon" id="basic-addon2" @click="store.find(keywordRef)"><i class="fa fa-search"></i></span>
								</div>
							</div>
							<div class="col-md-9 text-right head" style="margin-top: 30px;">
								<h4>
									<a @click="store.sortFunc('최신순')" :class="store.sort=='최신순'? 'bold':''">최신순</a>
								</h4>
								&nbsp;&nbsp;<span style="margin-bottom: 10px">|</span>&nbsp;&nbsp;
								<h4>
									<a @click="store.sortFunc('인기순')" :class="store.sort=='인기순'? 'bold':''">인기순</a>
								</h4>
							</div>
						</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" v-for="(vo, index) in store.course_list" :key="index">
								<div class="post-block">
									<div>
										<a :href="'/course/detail?cno='+vo.cno">
										<img class="post-block-img"
											:src="vo.pvo.thumbnail">
										</a>
									</div>
									<div>
										<h1>
											<a :href="'/course/detail?cno='+vo.cno" class="title">{{vo.title}}</a>
										</h1>
										<p class="meta">
											<span class="meta-date"> {{vo.dbday}} </span> <span
												class="meta-author">By <a href="#" class="meta-link">{{vo.uvo.name}}</a></span>
										</p>
										<p class="meta">
											<span class="meta-date"> 조회수</span>
											<span class="meta-author"><a href="#" class="meta-link">{{vo.hit}}</a></span>&nbsp;
											<span class="meta-date"> 댓글수</span>
											<span class="meta-author"><a href="#" class="meta-link">{{vo.replycount}}</a></span>
										</p>
										<div class="post-content">
											<p class="clamp-3">{{vo.content}}</p>
										</div>
									</div>
								</div>
								<hr>
							</div>
							
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="st-pagination">
								<ul class="pagination">
									<li v-if="store.startPage>1" @click="store.movePage(store.startPage-1)">
										<a class="page-link">이전</a>
									</li>
									<li v-for="i in store.range" >
										<a :class="i==store.curpage?'page-link active':'page-link'" @click="store.movePage(i)">{{i}}</a>
									</li>
									<li v-if="store.endPage<store.totalpage">
										<a class="page-link" @click="store.movePage(store.endPage+1)">다음</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/course/courseListStore.js"></script>
	<script>
		const {createApp, onMounted, ref} = Vue
		const {createPinia} = Pinia
		const app=createApp({
			setup() {
				const store=useCourseListStore()
				const keywordRef=ref(null)
				onMounted(()=>{
					store.dataRecv()
				})
				
				return {
					store,
					keywordRef
				}
			}
		})
		app.use(createPinia())
		app.mount("#course_list")
	</script>
</body>
</html>