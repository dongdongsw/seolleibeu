<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

						 
						<div class="detailborder">
							<div class="detailinline">
								<div class="detailpadding">
									
										<div class="detailmenu" v-for="(menu, index) in store.pvo.menuList">
											<div style="font-weight: 500;">{{menu.name}}</div>
											<div style="margin-top: 6px;">{{menu.price}}</div>
										</div>
									
								</div>

								<div id="myCarousel" class="carousel slide" data-ride="carousel">
									<!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
										<li data-target="#myCarousel" data-slide-to="1"></li>
										<li data-target="#myCarousel" data-slide-to="2"></li>
										<li data-target="#myCarousel" data-slide-to="3"></li>
										<li data-target="#myCarousel" data-slide-to="4"></li>
										<li data-target="#myCarousel" data-slide-to="5"></li>
										<li data-target="#myCarousel" data-slide-to="6"></li>
									</ol>

									<!-- Wrapper for slides -->
									<div class="carousel-inner" v-for="(imgs, index) in store.pvo.imgList" :key="index">
										<div class="item active">
											<img src="/images/post-img.jpg" alt="aaa">
										</div>
										<div class="item">
											<img src="/images/post-img.jpg" alt="bbb">
										</div>
										<div class="item">
											<img src="/images/post-img.jpg" alt="ccc">
										</div>
										<div class="item">
											<img src="/images/post-img.jpg" alt="ddd">
										</div>
										<div class="item">
											<img src="/images/post-img.jpg" alt="eee">
										</div>
										<div class="item">
											<img src="/images/post-img.jpg" alt="fff">
										</div>
										<div class="item">
											<img src="/images/post-img.jpg" alt="ggg">
										</div>
										<div class="item">
											<img src="/images/post-img.jpg" alt="hhh">
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
									<!-- <img src="/images/post-img.jpg" style="opacity: 1; border: 2px solid #000;"
										data-target="#myCarousel" data-slide-to="0" class="imagefocus">  -->
									<img :src="imgs.img" style="opacity: 0.6;"
										data-target="#myCarousel" :data-slide-to="index" class="imagefocus"> 
									<!-- <img src="/images/post-img.jpg" style="opacity: 0.6;"
										data-target="#myCarousel" data-slide-to="2" class="imagefocus"> 
									<img src="/images/post-img.jpg" style="opacity: 0.6;"
										data-target="#myCarousel" data-slide-to="3" class="imagefocus"> 
									<img src="/images/post-img.jpg" style="opacity: 0.6;"
										data-target="#myCarousel" data-slide-to="4" class="imagefocus"> 
									<img src="/images/post-img.jpg" style="opacity: 0.6;"
										data-target="#myCarousel" data-slide-to="5" class="imagefocus"> 
									<img src="/images/post-img.jpg" style="opacity: 0.6;"
										data-target="#myCarousel" data-slide-to="6" class="imagefocus"> 
									<img src="/images/post-img.jpg" style="opacity: 0.6;"
										data-target="#myCarousel" data-slide-to="7" class="imagefocus"> -->
									</div>
								</div>
							</div>
						</div>
	