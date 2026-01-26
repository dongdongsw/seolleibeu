<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="referrer" content="no-referrer">
<title>나의 코스</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700"
	rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>

<body>

	<div class="content auth-wrapper" style="margin-top: 0px;" >
		<div class="container">
			<div class="row">
				<div class="mypage-sizing">
					<div class="col-lg-9 col-md-9 col-sm-12" id="mypage_favorite">
						<main class="mypage-main">
							<h2>나의 즐겨찾기</h2>
							<div class="info-card text-center" style="margin: 0; padding: 0" v-if="store.fList == ''">
							<p style="margin-top: 250px;">등록된 즐겨찾기가 없습니다.</p>
						</div>
							<div class="row" style="margin-top: 30px;" v-if="store.fList !== ''">
					                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" v-for="(fvo,index) in store.fList" :key="index">
					                    <div class="project-img mb30 thumbnail">
					                        <a :href="'/place/' + store.routeType(fvo.pvo.type) + '/detail?pno=' + fvo.pvo.pno" class="imghover">
					                        	<img :src="fvo.pvo.thumbnail" class="img-responsive" style="height:200px; ">
					                        </a>
					                    </div>
					                    <h4 class="text-center" style="position:absolute; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;
					                    	left: 10%; top:87%; width: 80%">
					                    	{{fvo.pvo.name}}
					                    </h4>
					                    <a @click.prevent="store.favoriteCancel(fvo.pvo.pno)" style="cursor: pointer;">
					                    	<i class="fa fa-star" style="position:absolute; left:77%; top:7%; padding-top: 1px; font-size: 22px; color: gold;"></i>
					                    </a>
					                </div>
					                
				            </div>
				            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 0px;">
								<div class="st-pagination" style="position:absolute; left:32%; top: 2.5%;">
									<ul class="pagination">
										<li v-if="store.startPage > 1"><a @click="store.movePage(store.startPage-1)">이전</a></li>
										<li v-for="i in store.range"><a :class="i === store.curpage?'active':''" @click="store.movePage(i)">{{i}}</a></li>
										<li v-if="store.endPage < store.totalpage"><a @click="store.movePage(store.endPage+1)">다음</a></li>
									</ul>
								</div>
							</div>
						</main>
						<div class="st-pagination" style="position: absolute; left:70%; top: 2.5%;">
							<ul class="pagination">
								<li><a href="#" style="border-radius: 15px;" @click="store.categoryFilter('restaurant')" :class="store.category=='restaurant'?'active':''">음식점</a></li>
								<li><a href="#" style="border-radius: 15px;" @click="store.categoryFilter('culture')" :class="store.category=='culture'?'active':''">문화/체험</a></li>
								<li><a href="#" style="border-radius: 15px;" @click="store.categoryFilter('attraction')" :class="store.category=='attraction'?'active':''">관광명소</a></li>
							</ul>
						</div>
					</div>

					<div class="col-lg-3 col-md-3 col-sm-12" style="margin-top: 80px;">
						<div class="sidenav">
							<ul class="listnone">
								<li><a href="../mypage/my_info">내 정보</a></li>
								<li><a href="../mypage/my_favorite"  class="active">즐겨찾기</a></li>
								<li><a href="../mypage/my_bookmark">북마크</a></li>
								<li><a href="../mypage/my_course">나의 코스</a></li>
								<li><a href="../mypage/my_review">내가 쓴 리뷰</a></li>
								<li><a href="../mypage/my_reply">내가 쓴 댓글</a></li>
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
	<script src = "/vuejs/axios.js"></script>
	<script src = "/vuejs/mypage/favoriteStore.js"></script>
	<script>
		const {createApp, onMounted} = Vue
		const {createPinia} = Pinia
		const mypageFavoriteApp = createApp({
			setup(){
				const store = useMypageFavoriteStore()
				
				
				onMounted(()=>{
					store.mypageFavoriteListData()
				})
				
				return{
					store
				}
			}
		})
		mypageFavoriteApp.use(createPinia())
		mypageFavoriteApp.mount("#mypage_favorite")
	</script>
</body>
</html>
