<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/course.css" rel="stylesheet">
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
	   			<input type="radio" name="type" value="제목" checked="checked"><span style="margin-left: 4px;">제목</span>
   				<input type="radio" name="type" value="주소"><span style="margin-left: 4px;">주소</span>
	   		</div>
		   	<div class="input-group" style="margin: 0px; top:10px;">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-describedby="basic-addon2" style="border-radius: 15px 0px 0px 15px;">
				<span class="input-group-addon" id="basic-addon2" style="border-radius: 0px 15px 15px 0px;">
					<i class="fa fa-search"></i>
				</span>
			</div>
			<div class="dropdown" style="float: right; margin-top: -25px;">
				<button class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="background-color: white; border-radius: 15px; padding: 5px 10px; margin-right: 10px;">정렬기준
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" style="min-width: 80px;">
					<li><a href="#" @click="arrayChange('lowprice')">낮은가격순</a></li>
					<li><a href="#" @click="arrayChange('topprice')">높은가격순</a></li>
					<li><a href="#" @click="arrayChange('popular')">인기순</a></li>
					<li><a href="#" @click="arrayChange('recent')">최신순</a></li>
				</ul>
			</div>
			<div style="margin-top: 20px;">	
			<%-- <c:forEach begin="0" end="3">	 --%>	
	            <div class="row" style="margin-top: 10px;" >
	            	<%-- <c:forEach begin="0" end="3"> --%>
		                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"  v-for="(rvo,index) in store.resList" :key="index">
		                    <div class="project-img mb30 thumbnail">
		                        <a href="/place/restaurant/detail" class="imghover">
		                        	<img :src="rvo.thumbnail" class="img-responsive" alt="Interior Design Website Templates Free Download">
		                        	<div class="caption">
		                        		<h4 class="text-center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{rvo.name}}</h4>
		                        		<p style="font-size: 12px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{rvo.addr}}</p>
		                        	</div>
		                        </a>
		                    </div>
		                    <a><i class="fa fa-star" style="position:absolute; left:77%; top:5%; padding-top: 1px; font-size: 30px; color: gold;"></i></a>
		                </div>
	                <%-- </c:forEach> --%>
	            </div>
            <%-- </c:forEach> --%>
           </div> 
            <div class="row">
                <div class="st-pagination">
                    <ul class="pagination">
                        <li v-if="store.startPage > 1" @click="store.movePage(store.startPage-1)"><a >이전</a></li>
                        <li v-for="i in store.range"><a :class="i === store.curpage?'active':''" @click="store.movePage(i)">{{i}}</a></li>
                        <li v-if="store.endPage < store.totalpage" @click="store.movePage(store.endPage+1)"><a >다음</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    					
<script src="/vuejs/place/restaurantStore.js"></script>
<script src="/vuejs/axios.js"></script>
<script>
	const {createApp, onMounted} = Vue
	const {createPinia} = Pinia

	const restaurantApp = Vue.createApp({
		setup(){
			const store = useRestaurantStore()
			onMounted(()=>{
				store.restaurantListData()
			})
			
			return {
				store
			}
		}
	})
	restaurantApp.use(createPinia())
	restaurantApp.mount("#restaurant_list")

</script>
</body>
</html>