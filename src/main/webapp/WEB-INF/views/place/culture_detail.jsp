<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/place/restaurant_detail.css" rel="stylesheet" />
</head>
<body>
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h2 class="page-title">문화/체험</h2>
                        <p>상세보기</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="height: 407px;">
                    <div class="mb40">
                    	<img src="/images/left-image.jpg" class="thumbnail" style="float: left; margin: 0px 30px 0px 0px; width: 300px; height: 280px;">
                    	<span class="meta-author">타입명 / 문화 & 체험</span>
                    	<h2 style="font-weight: bold;">장소 이름(name)</h2>
                    	<ul style="list-style: none;">
							<li><b>주소</b><span style="font-size: 14px; margin-left: 10px;">address</span></li>
							<li><b>교통정보</b><span style="font-size: 14px; margin-left: 10px;">parking</span></li>
							<li><b>관람연령</b><span style="font-size: 14px; margin-left: 10px;">rating</span></li>
							<li><b>상영시간</b><span style="font-size: 14px; margin-left: 10px;">runtime</span></li>
							<li><b>업체명</b><span style="font-size: 14px; margin-left: 10px;">company</span></li>
							<li><b>연락처</b><span style="font-size: 14px; margin-left: 10px;">phone</span></li>
							<li><b>영업시간</b><span style="font-size: 14px; margin-left: 10px;">hours</span></li>
						</ul>
						<br>
						<p style="color: #800020; font-size: 16px; margin: 10px;">
							- 예매 후 1시간 이내로 미 결제시 예매가 자동 취소되는 점 양해 부탁드립니다<br>
							- 이용 전 예약변경을 희망하실 경우 업체로 유선 연락 부탁드립니다<br>
							- 상영시에 음식물 섭취는 제한 되오니 이점 참고하여 이용 부탁드립니다
						</p>
						
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <!-- widget start -->
                    <div class="widget widget-recent-post">
                        <!-- widget recent post -->
                        <h3 class="widget-title"><b>티켓 예매</b></h3>
                        <ul class="listnone widget-recent-post">
                            <li>
                                <div class="option_date" style="font-weight: bold; min-height: 30px;">날짜 선택</div>
                            </li>
                            <li>
                                <div class="option_time" style="font-weight: bold; min-height: 30px;">시간 선택</div>
                            </li>
                            <li>
                                <div class="option_two" style="font-weight: bold; min-height: 30px;">옵션1 선택</div>
                            </li>
                            <li>
                                <div class="option_two" style="font-weight: bold; min-height: 30px;">옵션2 선택</div>
                            </li>
                        	<li>
		                        <div id="selected-option-output" style="margin-bottom: 35px; font-weight: bold; min-height: 30px;">선택옵션 출력</div>
							    <div style="display: flex; align-items: center; margin-bottom: -25px; margin-left: 75px;">
							        <span style="margin-right: 10px; font-size: 14px;"><b>수량</b></span>
							        <div style="display: flex; align-items: stretch; margin-right: 15px;">
							            <input type="text" id="qty_val" value="1" readonly="readonly" style="width: 38px; height: 32px; text-align: center; border: 1px solid #ccc; border-right: none; 
							                          padding: 0; margin: 0; font-size: 15px; background-color: #fff; outline: none;">
							            <div style="display: flex; flex-direction: column; width: 24px;">
							                <button type="button" onclick="changeQ(1)" style="width: 100%; height: 16px; line-height: 14px; font-size: 10px; padding: 0; 
							                               border: 1px solid #ccc; background: black; cursor: pointer; display: block; outline: none; color: white;">+</button>
							                <button type="button" onclick="changeQ(-1)" style="width: 100%; height: 16px; line-height: 14px; font-size: 10px; padding: 0; 
							                               border: 1px solid #ccc; border-top: none; background: black; cursor: pointer; display: block; outline: none; color: white;">-</button>
							            </div>
							        </div>
							        <button type="button" style="background-color: black; color: white; border: none; border-radius: 20px; 
							                       padding: 0 20px; height: 32px; font-weight: bold; font-size: 13px; cursor: pointer; outline: none;">예매하기</button>
							    </div>
						    </li>
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
            <div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#menu1">상세보기</a></li>
    <li><a data-toggle="tab" href="#menu2">리뷰</a></li>
  </ul>

  <div class="tab-content">
    <div id="menu1" class="tab-pane fade in active">
      탭1
    </div>
    <div id="menu2" class="tab-pane fade">
      <jsp:include page="restaurant_review.jsp"></jsp:include>
    </div>
  </div>
</div>
    		<div class="text-right" style="margin-top: 10px;">
   				<button class="btn btn-sm" style="background-color: black; color: white;" onclick="javasciprt:history.back()">목록</button>
   			</div>
   		</div>
	</div>
	
	
	
	
	<!-- 탭 -->
	
	
	
	
	<script>
		function changeQ(n) {
		    var el = document.getElementById('qty_val');
		    var v = parseInt(el.value) + n;
		    if (v >= 1) el.value = v;
		}
	</script>
</body>
</html>