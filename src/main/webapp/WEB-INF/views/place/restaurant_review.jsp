<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .rating-summary {
        background: #fff;
        border: 1px solid #e3dfdc;
        border-radius: 5px;
        padding: 40px 50px;
        margin-bottom: 30px;
        margin-left: 35px;
        margin-top: 20px;
        display: flex;
        gap: 80px;
        align-items: center;
        max-width: 1050px;
    }
    
    .rating-score {
        text-align: center;
        min-width: 200px;
    }
    
    .rating-number {
        font-size: 48px;
        font-weight: 700;
        margin-bottom: 10px;
        color: #333;
    }
    
    .rating-stars {
        margin-bottom: 10px;
    }
    
    .rating-stars i {
        color: #ffc107;
        font-size: 20px;
    }
    
    .rating-count {
        color: #666;
        font-size: 14px;
    }
    
    .rating-breakdown {
        flex: 1;
    }
    
    .rating-row {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 8px;
    }
    
    .rating-label {
        font-size: 14px;
        color: #666;
        min-width: 30px;
    }
    
    .rating-bar-container {
        flex: 1;
        height: 8px;
        background: #e9ecef;
        border-radius: 4px;
        overflow: hidden;
    }
    
    .rating-bar {
        height: 100%;
        background: #ffc107;
        border-radius: 4px;
        transition: width 0.3s ease;
    }
    
    .rating-percentage {
        font-size: 12px;
        color: #666;
        min-width: 35px;
        text-align: right;
    }
</style>
</head>
<body>

	<div class="page-header">
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
			       
			       <div class="author-post" style="padding-left: 15px; width: 1155px;">
			       
			           <!-- author post -->
			           <div class="row">
			               <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
			                   <div class="author-img"> <img src="/images/author.jpg" class="" alt=""> </div>
			               </div>
			               <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
			               	   
			                   <div class="author-header">
			                       <div class="author-bio">
			                           <h2 class="author-title">no.(실제 키값 번호)장소명(실제 데이터 들어갈 곳)</h2>
			                           
			                           <div class="meta mb0"> <span class="meta-author">타입명(실제 데이터 들어갈 곳)/카테고리(실제 데이터 들어갈 곳)</span></div>
			                       </div>
			                       
			                   </div><br>
			                   <div class="address-wrap" style="  flex-direction: column;">
				                   <div class="author-bio" style="width: 100%; display: flex; ">
		                               <h5 class="project-title" style="padding-left: 1px; padding-top: 7px;">주소</h5>
		                               <span class="project-content" style="padding-left: 15px; font-weight: 300;">주소명(실제 데이터 들어갈 곳)</span>
		                           </div>
		                           <div class="author-bio" style="width: 100%; display: flex;">
		                               <h5 class="project-title" style="padding-left: 1px; padding-top: 7px;">전화</h5>
		                               <span class="project-content" style="padding-left: 15px; font-weight: 300;">전화번호(실제 데이터 들어갈 곳)</span>
		                           </div>
		                           <div class="author-bio" style="width: 100%; display: flex;">
		                               <h5 class="project-title" style="padding-left: 1px; padding-top: 7px;">좌석</h5>
		                               <span class="project-content" style="padding-left: 15px; font-weight: 300;">좌석(실제 데이터 들어갈 곳, 적당히 김)</span>
		                           </div>
		                           <div class="author-bio" style="width: 100%; display: flex;">
		                               <h5 class="project-title" style="padding-left: 1px; padding-top: 7px;">주차</h5>
		                               <span class="project-content" style="padding-left: 15px; font-weight: 300;">주차 정보(실제 데이터 들어갈 곳, 내용이 꽤 길음)</span>
		                           </div>
		                           <div class="author-bio" style="width: 100%; display: flex;">
		                               <h5 class="project-title" style="padding-left: 1px; padding-top: 7px;">운영시간</h5>
		                               <span class="project-content" style="padding-left: 15px; font-weight: 300;">시간(실제 데이터 들어갈 곳)</span>
		                           </div>
		                           <div class="author-bio" style="width: 100%; display: flex;">
		                               <h5 class="project-title" style="padding-left: 1px; padding-top: 7px;">장소 생성 날짜</h5>
		                               <span class="project-content" style="padding-left: 15px; font-weight: 300;">날짜(실제 데이터 들어갈 곳)</span>
		                           </div>
	                           </div>
	                           <br><br>
			                   <p>Mauris sit amet diam non nisl maximus porta vel at diam. Maecenas volutpat velit turpis, et scelerisque ipsum venenatis eu. Mauris et neque feugiat, pulvinar velit sed, lobortis neque. Nullam a felis laoisce luctust placerat molestie.</p>
			           </div>
					</div>
			    	<hr>
			   	</div>
			   	<div class="detail-wrap" style="width:1155px;">
			   	<ul class="nav nav-tabs" style=" width: 1155px;">
				  <li><a href="#">상세보기</a></li>
				  <li class="active"><a href="#">리뷰</a></li>
				</ul>
			   <div style="border: 1px solid #e3dfdc; border-top: none; border-radius: 0 0 5px 5px; padding: 20px;">
			   
			   <!-- 평점 요약 섹션 -->
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
			           <div class="rating-count">(1234개)</div>
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
			   <div style="display:inline; width: 1155px; ">
				<div style="display:flex; flex-wrap:wrap; gap:12px; width:100%;  margin-bottom: 60px; margin-left: 32px; padding-top: 40px;">
				<div class="container">
          	<div class="row">
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                          <div class="comment-area">
                              <div class="row">
                                  <div class=" col-lg-12 col-md-12">
                                      <ul class="comment-list">
                                          <li>
                                              <div class="comment-body">
                                                  <div class="comment-author"><img src="/images/user-pic-1.jpg" alt class="img-responsive"></div>
                                                  <div class="comment-info">
                                                      <div class="comment-header">
                                                          <h3 class="comments-title">Jerry Graf</h3>
                                                          <div class="meta"> <span class="meta-date">April 24, 2020</span> </div>
                                                      </div>
                                                      <div class="comment-content">
                                                          <p>Cras ut lorem vitae orci sollicitudin pharetra. In vel scelerisque mi. Pellentes que eu imperdiet tortor. </p>
                                                      </div>
                                                  </div>
                                              </div>
                                          </li>
                                      </ul>
                                      <ul class="comment-list">
                                          <li>
                                              <div class="comment-body">
                                                  <div class="comment-author"><img src="/images/user-pic-3.jpg" alt class="img-responsive"></div>
                                                  <div class="comment-info">
                                                      <div class="comment-header">
                                                          <h3 class="comments-title">James Howard</h3>
                                                          <div class="meta"> <span class="meta-date">April 23, 2020</span> </div>
                                                      </div>
                                                      <div class="comment-content">
                                                          <p>Pellentesque gravida convallis hendrerit. Cras pharetra ultricies tempus. Quisque et pretium ante, nec ullamcorper lorem. </p>
                                                      </div>
                                                  </div>
                                              </div>
                                          </li>
                                      </ul>
                                      <ul class="comment-list">
                                          <li>
                                              <div class="comment-body">
                                                  <div class="comment-author"><img src="/images/user-pic-3.jpg" alt class="img-responsive"></div>
                                                  <div class="comment-info">
                                                      <div class="comment-header">
                                                          <h3 class="comments-title">James Howard</h3>
                                                          <div class="meta"> <span class="meta-date">April 23, 2020</span> </div>
                                                      </div>
                                                      <div class="comment-content">
                                                          <p>Pellentesque gravida convallis hendrerit. Cras pharetra ultricies tempus. Quisque et pretium ante, nec ullamcorper lorem. </p>
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
          </div>
				</div>
				</div>
            </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    <div style="position: absolute ; top: 52%; left: 77%;">
    	<table class="table">
    		<tbody>
	    		<tr>
	    			<td style="border: none;"><a><i class="fa-regular fa-star" style="padding-top:1px; font-size: 22px; color: black;"></i></a></td>
	    			<td style="border: none;"></td>
	    		</tr>
	    		<tr>
	    			<td style="border: none;"><a><i class="fa-regular fa-thumbs-up" style=" font-size: 22px; color: black;"></i></a></td>
	    			<td style="border: none;">1</td>
	    		</tr>
	    		<tr>
	    			<td style="border: none;"><i class="fa-regular fa-eye" style="padding-top:1px; font-size: 22px; color: black;"></i></td>
	    			<td style="border: none;">1</td>
	    		</tr>
	    	</tbody>	    	
    	</table>
    </div>
</body>
</html>