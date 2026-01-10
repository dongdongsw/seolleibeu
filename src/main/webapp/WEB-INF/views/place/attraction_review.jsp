<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="border: 1px solid #e3dfdc; border-top: none; border-radius: 0 0 5px 5px; padding: 20px; margin-bottom: 50px;">
	<div class="rating-summary">
		<div class="rating-score">
        	<div class="rating-number">4.5</div>
        	<div class="rating-stars">
	            <i class="fa fa-star"></i>
	            <i class="fa fa-star"></i>
	            <i class="fa fa-star"></i>
	            <i class="fa fa-star"></i>
	            <i class="fa fa-star-half-o"></i>
        	</div>
        	<div class="rating-count">{{rstore.count }} 개</div>
    	</div>
    	<div class="rating-breakdown">
        	<div class="rating-row">
            	<span class="rating-label">5점</span>
           		<div class="rating-bar-container">
                	<div class="rating-bar" style="width: 75%;"></div>
    			</div>
    			<span class="rating-percentage">75%</span>
			</div>
			<div class="rating-row">
    			<span class="rating-label">4점</span>
    			<div class="rating-bar-container">
        			<div class="rating-bar" style="width: 15%;"></div>
    			</div>
    			<span class="rating-percentage">15%</span>
			</div>
			<div class="rating-row">
    			<span class="rating-label">3점</span>
   				<div class="rating-bar-container">
        			<div class="rating-bar" style="width: 6%;"></div>
    			</div>
    			<span class="rating-percentage">6%</span>
			</div>
			<div class="rating-row">
    			<span class="rating-label">2점</span>
    			<div class="rating-bar-container">
        			<div class="rating-bar" style="width: 2%;"></div>
    			</div>
    			<span class="rating-percentage">2%</span>
			</div>
			<div class="rating-row">
			    <span class="rating-label">1점</span>
			    <div class="rating-bar-container">
			        <div class="rating-bar" style="width: 2%;"></div>
	            </div>
	            <span class="rating-percentage">2%</span>
	        </div>
	    </div>
	</div>
	<div style="display:inline; width: 1155px;" id="reviewApp">
		<div style="display:flex; flex-wrap:wrap; gap:12px; width:100%;  margin-bottom: 10px; margin-left: 32px; padding-top: 40px;">
			<div class="container">
	      		<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    					<div class="comment-area">
        					<div class="row">
            					<div class=" col-lg-12 col-md-12">
									<ul class="comment-list">
									    <li v-for="(vo,index) in rstore.list" :key="index">
									        <div class="comment-body">
									            <div class="comment-author"><img :src="profile_img" alt class="img-circle"></div>
									            <div class="comment-info">
									                <div class="comment-header rating-stars">
									                    <h3 class="comments-title">{{vo.name}}&nbsp;
									                    <!-- 리뷰 별점 -->
									                    <span class="rating-star" v-if="vo.r_score != null">
														  <i class="fa fa-star"
														     v-for="n in rstore.starCount(vo.r_score).full"
														     :key="'f'+n"></i>
														  <i class="fa fa-star-half-o"
														     v-if="rstore.starCount(vo.r_score).half"></i>
														  <i class="fa fa-star-o"
														     v-for="n in rstore.starCount(vo.r_score).empty"
														     :key="'e'+n"></i>
														</span>
									                    </h3>
									                    <div class="meta"> <span class="meta-date">{{vo.dbday}}</span> </div>
									                </div>
									                <div class="comment-content">
									                    <p>{{vo.r_content}}</p>
									                    <div class="text-right" style="margin-right: 60px;">
                                                      		<span class="review-more" @click="openModal">더보기</span>
                                                      	</div>
                                                  	</div>
                                              	</div>
                                         	 </div>
                                     	 </li>
                                 	 </ul>
                              	</div>
                          	</div>
                      	</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="st-pagination">
						<ul class="pagination">
							<li><a href="#">이전</a></li>
							<li><a href="#" class="active">1</a></li>
							<li><a href="#">다음</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>