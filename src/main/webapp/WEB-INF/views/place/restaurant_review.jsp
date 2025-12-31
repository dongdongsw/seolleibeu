<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


			   <div style="border: 1px solid #e3dfdc; border-top: none; border-radius: 0 0 5px 5px; padding: 20px;">
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
			   <div style="display:inline; width: 1155px;" id="reviewApp">
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
                                                  <div class="comment-author"><img src="/images/user-pic-1.jpg" alt class="img-circle"></div>
                                                  <div class="comment-info">
                                                      <div class="comment-header">
                                                          <h3 class="comments-title">Jerry Graf&nbsp;<span class="rating-star">★★★★</span></h3>
                                                          <div class="meta"> <span class="meta-date">April 24, 2020</span> </div>
                                                      </div>
                                                      <div class="comment-content">
                                                          <p>Cras ut lorem vitae orci sollicitudin pharetra. In vel scelerisque mi. Pellentes que eu imperdiet tortor. </p>
                                                          <div class="text-right more" style="margin-right: 60px;">
                                                          <span class="review-more" @click="openModal">더보기</span>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </div>
                                          </li>
                                      </ul>
                                      <ul class="comment-list">
                                          <li>
                                              <div class="comment-body">
                                                  <div class="comment-author"><img src="/images/user-pic-3.jpg" alt class="img-circle"></div>
                                                  <div class="comment-info">
                                                      <div class="comment-header">
                                                          <h3 class="comments-title">James Howard&nbsp;<span class="rating-star">★★★★</span></h3>
                                                          <div class="meta"> <span class="meta-date">April 23, 2020</span> </div>
                                                      </div>
                                                      <div class="comment-content">
                                                          <p>Pellentesque gravida convallis hendrerit. Cras pharetra ultricies tempus. Quisque et pretium ante, nec ullamcorper lorem. </p>
                                                          <div class="text-right" style="margin-right: 60px;">
                                                          <span class="review-more" @click="openModal">더보기</span>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </div>
                                          </li>
                                      </ul>
                                      <ul class="comment-list">
                                          <li>
                                              <div class="comment-body">
                                                  <div class="comment-author"><img src="/images/user-pic-3.jpg" alt class="img-circle"></div>
                                                  <div class="comment-info">
                                                      <div class="comment-header">
                                                          <h3 class="comments-title">James Howard&nbsp;<span class="rating-star">★★★★</span></h3>
                                                          <div class="meta"> <span class="meta-date">April 23, 2020</span> </div>
                                                      </div>
                                                      <div class="comment-content">
                                                          <p>Pellentesque gravida convallis hendrerit. Cras pharetra ultricies tempus. Quisque et pretium ante, nec ullamcorper lorem. </p>
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
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">다음</a></li>
										</ul>
									</div>
								</div>
		            	  </div>
		          		</div>
					</div>
					
				</div>
            </div></div></div></div>
    <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.js"></script>
    <!-- 리뷰 더보기 모달창 -->
    <script>
     const reviewApp=Vue.createApp({
    	 data(){
    		 return {
    			 isModalOpen:false,
    			 modalData:{
    				
    			 }
    		 }
    	 },
    	 methods:{
    		 openModal(){
    			 this.modalData={writer:'김민석'}
    			 this.isModalOpen=true
    		 },
    		 closeModal(){
    			 this.isModalOpen=false
    			 this.modalData={}
    		 }
    	 }
     })
     reviewApp.mount('#reviewApp')
    </script>