<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
</head>
<body>
<div style="border: 1px solid #e3dfdc; border-top: none; border-radius: 0 0 5px 5px; padding: 20px; margin-bottom: 50px;">
	
	<sec:authorize access="isAuthenticated()">
	<!-- 리뷰 작성 폼 -->
	<div class="review-write-box"  v-if="rstore.list.length===0">
		<div class="review-write-title">
			<i class="fa fa-pencil"></i> 리뷰 작성하기
		</div>
		<form id="reviewForm" method="post" enctype="multipart/form-data">
			<!-- 별점 -->
			 <div class="compact-rating-area">
		      <div class="compact-star-rating" id="starRating">
		        <span class="star-wrapper" v-for="n in 5" :key="n" :data-value="n" 
		          @click="(e) => {const rect = e.currentTarget.getBoundingClientRect(); const x = e.clientX - rect.left; rstore.r_score = x < rect.width / 2 ? n - 0.5 : n;}">
				  <i class="fa" :class="n <= Math.floor(rstore.r_score) ? 'fa-star' : (n === Math.ceil(rstore.r_score) && rstore.r_score % 1 !== 0 ? 'fa-star-half-o' : 'fa-star-o')"></i>
				</span>
		      </div>
		      <span class="compact-rating-text" id="ratingText">
		        {{ rstore.r_score === 0 ? '별점을 선택해주세요' : rstore.r_score + '점' }}
		      </span>
		    </div>
			<input type="hidden" name="rating" id="ratingValue" v-model="rstore.r_score">
			<!-- 리뷰 내용 -->
			<textarea class="compact-textarea" name="content" id="reviewContent" 
				placeholder="상품에 대한 솔직한 리뷰를 작성해주세요." 
				maxlength="500" required v-model="rstore.r_content" ref="cref"></textarea>
			<div style="text-align: right;">
				<button type="button" class="btn-submit-review" @click="rstore.reviewInsert()">
					<i class="fa fa-check"></i> 등록
				</button>
			</div>
		</form>
	</div>
  </sec:authorize>
	<!-- 리뷰 통계 -->
	<div class="rating-summary">
		<div class="rating-score">
        	<div class="rating-number">{{rstore.avg_score ? rstore.avg_score: '-'}}</div>
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
	
	<!-- 리뷰 목록 -->
	<div style="display:inline; width: 1155px;" id="reviewApp">
		<div style="display:flex; flex-wrap:wrap; gap:12px; width:100%;  margin-bottom: 10px; margin-left: 32px; padding-top: 40px;">
			<div class="container">
	      		<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    					<div class="comment-area">
        					<div class="row">
            					<div class=" col-lg-12 col-md-12">
									<ul class="comment-list">
									  <li v-if="rstore.list.length===0" class="text-center"><h3>리뷰가 없습니다.</h3></li>
									    <li v-for="(vo,index) in rstore.list" :key="index" v-if="rstore.list.length>0">
									        <div class="comment-body">
									            <div class="comment-author"><img :src="vo.profile_img ? vo.profile_img : '/images/noimage.png'" class="img-circle" style="width: 80px;height: 80px;"></div>
									            <div class="comment-info">
									                <div class="comment-header rating-stars">
									                    <h3 class="comments-title" :title="vo.name">{{vo.name}}&nbsp;
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
									                   <sec:authorize access="isAuthenticated()">
									                    <div class="text-left" style="margin-right: auto;">
                                                      		<a href="/mypage/my_review" v-if="sessionId===id">수정 / 삭제</a>
                                                      	</div>
                                                       </sec:authorize>
									                    <div class="meta"> <span v-if="vo.uday"> 수정일 : {{ vo.uday }} </span>
										    				<span v-else>작성일 : {{ vo.dbday }} </span></div>
									                </div>
									                <div class="comment-content">
									                    <p :title="vo.r_content">{{vo.r_content}}</p>
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
							<li v-if="rstore.startPage>1"><a href="#" @click="rstore.pageChange(rstore.startPage-1)">이전</a></li>
							<li :class="i==rstore.curpage?'active':''" v-for="i in rstore.range"><a href="#" @click="rstore.pageChange(i)">{{i}}</a></li>
							<li v-if="rstore.endPage<rstore.totalpage"><a href="#" @click="rstore.pageChange(rstore.endPage+1)">다음</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 리뷰 상세보기 모달 -->
		<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog" style="max-width: 600px;">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">리뷰 상세</h4>
		      </div>
		      
		      <div class="modal-body" v-if="rstore.detail">
		        <div style="margin-bottom: 20px;">
		          <p style="line-height: 1.6;">{{rstore.detail.r_content}}</p>
		        </div>
		        
		        <div class="text-center">
		          <img 
		            :src="rstore.detail.r_img || '/images/noimage.png'" 
		            style="max-width: 100%; max-height: 350px; border-radius: 4px;"
		          >
		        </div>
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>