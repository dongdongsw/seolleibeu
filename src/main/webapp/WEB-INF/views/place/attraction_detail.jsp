<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="page-header">
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
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12" style="margin-bottom: 30px;">
                    <div class="mb40">
                   		<img src="/images/left-image.jpg" class="thumbnail" style="float: left; margin: 0px 30px 0px 0px; width: 300px; height: 280px;">
                   		<span class="meta-author">타입명 / 관광명소 </span> 
                    	<h2 style="font-weight: bold;">장소 이름(name)</h2>
                    	<ul style="list-style: none;">
							<li><b>주소</b><span style="font-size: 14px; margin-left: 10px;">address</span></li>
							<li><b>교통정보</b><span style="font-size: 14px; margin-left: 10px;">parking</span></li>
							<li><b>영업시간</b><span style="font-size: 14px; margin-left: 10px;">hours</span></li>
							<li><b>가격정보</b><span style="font-size: 14px; margin-left: 10px;">ticket</span></li>
							<li><b>문의전화</b><span style="font-size: 14px; margin-left: 10px;">phone</span></li>
						</ul>
                    </div>
                </div>
            </div>
            <div style="position: absolute; left: 67%;">
		    	<table class="table">
		    		<tbody>
			    		<tr>
			    			<td style="border: none;"><a><i class="fa fa-star-o" style="padding-top:1px; font-size: 22px; color: black;"></i></a></td>
			    			<td style="border: none;"></td>
			    			<td style="border: none;"><a><i class="fa fa-thumbs-o-up" style=" font-size: 22px; color: black;"></i></a></td>
			    			<td style="border: none;">1</td>
			    			<td style="border: none;"><i class="fa fa-eye" style="padding-top:1px; font-size: 22px; color: black;"></i></td>
			    			<td style="border: none;">1</td>
			    		</tr>
			    	</tbody>	    	
		    	</table>
		    </div>
            <div class="row detail">
				<ul class="nav nav-tabs" style=" width: 1100px;">
					<li class="active"><a href="#">상세보기</a></li>
					<li><a href="#">리뷰</a></li>
				</ul>
				<div style="border: 1px solid #e3dfdc; border-top: none; border-radius: 0 0 5px 5px; padding: 20px;">
			   		<div style="display:inline; width: 1155px; ">
						<div style="display:flex; flex-wrap:wrap; gap:12px; width:100%;  margin-bottom: 60px; margin-left: 32px; padding-top: 40px;">
							<p>소개...intro</p>
						</div>
						<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 60%; left: 20%; margin-bottom: 30px;">
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
							<div class="carousel-inner" >
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
            		</div>
        		</div>
    		</div>
    		<div class="text-right" style="margin-top: 10px;">
   				<button class="btn btn-sm" style="background-color: black; color: white;" onclick="javasciprt:history.back()">목록</button>
   			</div>
   		</div>
	</div>
</body>
</html>