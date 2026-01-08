<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row detail">
		<div class="col-lg-12">
			<div style="border: 1px solid #e3dfdc; border-top: none; border-radius: 0 0 5px 5px; padding: 20px;">
				<div style="display:inline; width: 1155px; ">
					<div style="display:flex; flex-wrap:wrap; gap:12px; width:100%;  margin-bottom: 60px; margin-left: 32px; padding-top: 40px;">
						<p>{{store.pvo.intro}}</p>
					</div>
					<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 60%; left: 20%; margin-bottom: 30px;">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="index" :class="{active : index === 0}" v-for="(imgs, index) in store.pvo.imgList" :key="index"></li>
						</ol>
						
						<!-- Wrapper for slides -->
						<div class="carousel-inner" >
							<div class="item" :class="{active : index === 0}" v-for="(imgs, index) in store.pvo.imgList" :key="index">
								<img :src="imgs.img" onerror="this.src='/images/noimage.png'">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
					<div class="detailsubimages">
						<div  v-for="(imgs, index) in store.pvo.imgList" :key="index">
							<img :src="imgs.img" onerror="this.src='/images/noimage.png'" data-target="#myCarousel" :data-slide-to="index" class="imagefocus" @click="selectedIndex = index" 
								:style="{ opacity : index === selectedIndex ? 1 : 0.6, border: index === selectedIndex ? '2px solid #000' : 'none'}">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>