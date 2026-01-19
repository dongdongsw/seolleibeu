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
										<li data-target="#myCarousel" data-slide-to="index" 
											:class="{active : store.selectedImgIndex  === index}" v-for="(imgs, index) in store.pvo.imgList" 
											:key="index"></li>
										
									</ol>

									<!-- Wrapper for slides -->
									<div class="carousel-inner" style="height: 500px;">
										<div class="item" :class="{active : store.selectedImgIndex  === index}"  
											v-for="(imgs, index) in store.pvo.imgList" :key="index">
											<img :src="imgs.img" style="height: 500px; width: 660px;">
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
									<img :src="imgs.img"
										data-target="#myCarousel" :data-slide-to="index" class="imagefocus"
										:style="{ opacity : store.selectedImgIndex  === index ? 1 : 0.6,
												border: store.selectedImgIndex  === index ? '2px solid #000' : none}"  @click="store.imageClick(index)"> 
									</div>
								</div>
							</div>
						</div>
	