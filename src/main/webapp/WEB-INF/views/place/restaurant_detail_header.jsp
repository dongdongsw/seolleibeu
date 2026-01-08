<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="page-header" style="margin: 0px auto;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">음식점</h2>
						<p>상세페이지</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<div class="author-post" >

						<!-- author post -->
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<div class="author-img">
									<img :src="store.pvo.thumbnail" class="" alt="">
								</div>
							</div>
							<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">

								<div class="author-header">
									<div class="author-bio">
										<h2 class="author-title">no.{{store.pvo.pno}}장소명(실제 데이터 들어갈 곳)</h2>

										<div class="meta mb0">
											<span class="meta-author">{{store.pvo.type}} / {{store.pvo.category}}</span>
										</div>
									</div>

								</div>
								<br>
								<div class="address-wrap">
									<div class="author-bio" style="width: 100%; display: flex;">
										<h5 class="project-title" >주소</h5>
										<span class="project-content">{{store.pvo.addr}}</span>
									</div>
									<div class="author-bio" style="width: 100%; display: flex;">
										<h5 class="project-title">전화</h5>
										<span class="project-content">{{store.pvo.phone}}</span>
									</div>
									<div class="author-bio" style="width: 100%; display: flex;">
										<h5 class="project-title">좌석</h5>
										<span class="project-content">{{store.pvo.seat}}</span>
									</div>
									<div class="author-bio" style="width: 100%; display: flex;">
										<h5 class="project-title">주차</h5>
										<span class="project-content">{{store.pvo.parking}}</span>
									</div>
									<div class="author-bio" style="width: 100%; display: flex;">
										<h5 class="project-title">운영시간</h5>
										<span class="project-content">{{store.pvo.hours}}</span>
									</div>
									<div class="author-bio" style="width: 100%; display: flex;">
										<h5 class="project-title">장소 생성 날짜</h5>
										<span class="project-content">{{store.pvo.created_at}}</span>
									</div>
								</div>
								<br>
								<br>
								<p>{{store.pvo.intro}}</p>

							</div>
							<div style="position: absolute; left: 80%; top: 1%;">
						    	<table class="table">
						    		<tbody>
							    		<tr>
							    			<td style="border: none;"><a><i class="fa fa-star-o" style="padding-top:1px; font-size: 22px; color: black;"></i></a></td>
							    			<td style="border: none;"></td>
							    			<td style="border: none;"><a><i class="fa fa-thumbs-o-up" style=" font-size: 22px; color: black;"></i></a></td>
							    			<td style="border: none;">{{store.pvo.l_count}}</td>
							    			<td style="border: none;"><i class="fa fa-eye" style="padding-top:1px; font-size: 22px; color: black;"></i></td>
							    			<td style="border: none;">{{store.pvo.hit}}</td>
							    		</tr>
							    	</tbody>	    
						    	</table>
						    </div>
						</div>
						<hr>
					</div>
