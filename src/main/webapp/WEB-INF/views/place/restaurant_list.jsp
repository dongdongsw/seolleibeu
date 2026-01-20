<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/course.css" rel="stylesheet">

<style type="text/css">
.page-header{
  background: linear-gradient(rgba(30, 30, 30, 0.7), rgba(30, 30, 30, 0.7)),  url(/images/asdf.jpg) no-repeat center;
  background-size: cover;
}
</style>
</head>
<body>
    <div class="page-header">
        <!-- page header -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h2 class="page-title">음식점</h2>
                        <p>목록</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.page header -->
    <div class="content" id="restaurant_list">
        <div class="container">
        	<div class="type-select" style="margin-bottom: -40px; margin-left: 5px;">
	   			<input type="radio" name="type" value="subject" checked="checked" v-model="store.radio"><span style="margin-left: 4px;">이름</span>
   				<input type="radio" name="type" value="address" v-model="store.radio"><span style="margin-left: 4px;">주소</span>
	   		</div>
		   	<div class="input-group" style="margin: 0px; top:50px; padding-top: 0px;">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-describedby="basic-addon2" 
					style="border-radius: 15px 0px 0px 15px; color:black;" v-model="store.keyword" ref="keywordRef"  @keyup.enter="store.keywordInput(keywordRef)">
				<span class="input-group-addon" id="basic-addon2" style="border-radius: 0px 15px 15px 0px;">
					<button @click="store.keywordInput(keywordRef)" style="border: none; background-color: white;">
						<i class="fa fa-search" ></i>
					</button> 
				</span>
			</div>
			<div class="dropdown" style="float: right; margin-top: -25px;">
				<button class="btn dropdown-toggle" type="button" data-toggle="dropdown" 
					style="background-color: white; border-radius: 15px; padding: 5px 10px; margin-right: 10px; margin-top: 50px;">정렬기준
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" style="min-width: 80px;">
					<li><a href="#" @click="store.arrayChange('favoritetop')">즐겨찾기 많은순</a></li>
					<li><a href="#" @click="store.arrayChange('liketop')">좋아요 많은순</a></li>
					<li><a href="#" @click="store.arrayChange('reviewtop')">리뷰 많은순</a></li>
					<li><a href="#" @click="store.arrayChange('hittop')">조회수 많은순</a></li>
					<li><a href="#" @click="store.arrayChange('recent')">최신순</a></li>
				</ul>
			</div>
			<div style="margin-top: 60px;">	
	            <div class="row" style="margin-top: 10px;" >
	                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"  v-for="(rvo,index) in store.resList" :key="index">
	                    <div class="project-img mb30 thumbnail">
	                        <a :href="'/place/restaurant/detail_before?pno=' + rvo.pno" class="imghover">
	                        <!-- "'/place/restaurant/detail_vue?pno='+rvo.pno" -->
	                        	<img :src="rvo.thumbnail" style="height: 250px;" class="img-responsive" alt="Interior Design Website Templates Free Download">
	                        	<div class="caption">
	                        		<h4 class="text-center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{rvo.name}}</h4>
	                        		<p style="font-size: 12px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{rvo.addr}}</p>
	                        	</div>
	                        </a>
	                    </div>
	                </div>
	            </div>
           </div> 
            <div class="row">
                <div class="st-pagination">
                    <ul class="pagination">
                        <li v-if="store.startPage > 1"><a @click="store.movePage(store.startPage-1)">이전</a></li>
                        <li v-for="i in store.range"><a :class="i === store.curpage?'active':''" @click="store.movePage(i)">{{i}}</a></li>
                        <li v-if="store.endPage < store.totalpage"><a @click="store.movePage(store.endPage+1)">다음</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    					
<script src="/vuejs/axios.js"></script>
<script src="/vuejs/place/restaurantStore.js"></script>
<script>
	const {createApp, onMounted, ref} = Vue
	const {createPinia} = Pinia

	const restaurantApp = Vue.createApp({
		setup(){
			
			const store = useRestaurantStore()
			const keywordRef = (null)
			
			
			onMounted(()=>{
				store.restaurantListData()
				
			})
			
			return {
				store,
				keywordRef
			}
		}
	})
	restaurantApp.use(createPinia())
	restaurantApp.mount("#restaurant_list")

</script>
</body>
</html>