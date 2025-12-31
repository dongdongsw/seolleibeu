<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

						 
						<div class="detailborder">
							<div class="detailinline">
								<div class="detailpadding">
									<c:forEach begin="0" end="17">
										<div class="detailmenu">
											<div style="font-weight: 500;">아메리카노</div>
											<div style="margin-top: 6px;">4,000원</div>
										</div>
									</c:forEach>
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
									<div class="carousel-inner">
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
									<img src="/images/post-img.jpg" style="opacity: 1; border: 2px solid #000;"
										data-target="#myCarousel" data-slide-to="0" class="imagefocus"> 
									<img src="/images/post-img.jpg" style="opacity: 0.6;"
										data-target="#myCarousel" data-slide-to="1" class="imagefocus"> 
									<img src="/images/post-img.jpg" style="opacity: 0.6;"
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
										data-target="#myCarousel" data-slide-to="7" class="imagefocus">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="iconpackage">
		<table class="table">
			<tbody>
				<tr>
					<td style="border: none;"><a><i class="fa fa-star"
							style="padding-top: 1px; font-size: 22px; color: black;"></i></a></td>
					<td style="border: none;"></td>
				</tr>
				<tr>
					<td style="border: none;"><a><i class="fa fa-thumbs-up"
							style="font-size: 22px; color: black;"></i></a></td>
					<td style="border: none;">1</td>
				</tr>
				<tr>
					<td style="border: none;"><i class="fa fa-eye"
						style="padding-top: 1px; font-size: 22px; color: black;"></i></td>
					<td style="border: none;">1</td>
				</tr>
			</tbody>
		</table>
		<table class="table">
			<tbody>
				<tr>
					<td style="border: none;"><a><i class="fa fa-star-o" style="padding-top: 1px; font-size: 22px; color: black;"></i></a></td>
					<td style="border: none;"></td>
				</tr>
				<tr>
					<td style="border: none;"><a><i class="fa fa-thumbs-o-up" style="font-size: 22px; color: black;"></i></a></td>
					<td style="border: none;">1</td>
				</tr>
				<tr>
					<td style="border: none;"><i class="fa fa-eye" style="padding-top: 1px; font-size: 22px; color: black;"></i></td>
					<td style="border: none;">1</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>