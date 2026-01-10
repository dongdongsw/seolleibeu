<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/course.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/place/restaurant_detail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="page-header" style="margin: 0px auto;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">관광명소</h2>
						<p>상세보기</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="padding-top: 100px;" id="attraction_detail">
		<div class="row">
			<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<div class="mb40">
					<img :src="store.pvo.thumbnail" class="thumbnail" style="float: left; margin: 0px 30px 0px 0px; width: 300px; height: 280px;">
					<span class="meta-author">{{store.pvo.type}} / 관광명소 </span> 
					<h2 style="font-weight: bold;">{{store.pvo.name}}</h2>
					<ul style="list-style: none;">
						<li><b>주소</b><span style="font-size: 14px; margin-left: 10px;">{{store.pvo.addr ? store.pvo.addr : '-'}}</span></li>
						<li><b>교통정보</b><span style="font-size: 14px; margin-left: 10px;">{{store.pvo.parking ? store.pvo.parking : '-'}}</span></li>
						<li><b>운영시간</b><span style="font-size: 14px; margin-left: 10px;">{{store.pvo.hours ? store.pvo.hours : '-'}}</span></li>
						<li><b>가격정보</b><span style="font-size: 14px; margin-left: 10px;">{{store.pvo.ticket ? store.pvo.ticket : '-'}}</span></li>
						<li><b>문의전화</b><span style="font-size: 14px; margin-left: 10px;">{{store.pvo.phone ? store.pvo.phone : '-'}}</span></li>
						<li><b>장소 등록일</b><span style="font-size: 14px; margin-left: 10px;">{{store.pvo.createday ? store.pvo.createday : '-'}}</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div style="position: absolute; left: 66%;">
			<table class="table">
				<tbody>
					<tr>
						<td style="border: none;"><a><i class="fa fa-star-o" style="padding-top:1px; font-size: 22px; color: black;"></i></a></td>
						<td style="border: none;">{{store.pvo.f_count}}</td>
						<td style="border: none;"><a><i class="fa fa-thumbs-o-up" style=" font-size: 22px; color: black;"></i></a></td>
						<td style="border: none;">{{store.pvo.l_count}}</td>
						<td style="border: none;"><i class="fa fa-eye" style="padding-top:1px; font-size: 22px; color: black;"></i></td>
						<td style="border: none;">{{store.pvo.hit}}</td>
					</tr>
				</tbody>	    	
			</table>
		</div>
		<div class="text-right" style="margin-top: 5px;">
			<button class="btn btn-sm" style="background-color: black; color: white;" onclick="javasciprt:history.back()">목록</button>
		</div><hr>
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#menu1">상세보기</a></li>
				<li><a data-toggle="tab" href="#menu2">리뷰</a></li>
			</ul>
			<div class="tab-content">
				<div id="menu1" class="tab-pane fade in active">
					<jsp:include page="${detailPage}"></jsp:include>
			    </div>
			    <div id="menu2" class="tab-pane fade">
					<jsp:include page="${reviewPage}"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<script src="/vuejs/axios.js"></script>
    <script src="/vuejs/place/attractionStore.js"></script>
    <script src="/vuejs/place/review.js"></script>
    <script>
      const { createApp, onMounted, ref } = Vue
      const { createPinia } = Pinia
      
      const attractionDetailApp = createApp({
    	  setup() {
    		  const store = useAttractionStore()
    		  const params = new URLSearchParams(location.search)
    		  const pno = params.get('pno')
    		  const selectedIndex = ref(0)
    		  
			  /* 리뷰 */
    		  const rstore = useReviewStore()
    		  
    		  onMounted(()=> {
    			  store.attractionDetailData(pno)
    			  
    			  /* 리뷰 */
    			  rstore.pno=pno
    			  rstore.curpage=1
    			  rstore.reviewListData()
    		  })
    		  
    		  return {
    			  store,
    			  selectedIndex,
    			  rstore
    		  }
    	  }
      })
      attractionDetailApp.use(createPinia())
      attractionDetailApp.mount('#attraction_detail')
    </script>
</body>
</html>