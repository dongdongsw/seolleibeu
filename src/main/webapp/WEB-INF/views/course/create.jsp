<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
	.course-container {
		height: 100vh;
		display: block;
	}
	.choose-top {
		width: 100%;
		height: 7vh;
		background-color: #f8f6f2;
	}
	.choose-main {
		display: flex;
	}
	.choose-left {
		width: 34%;
		height: 90vh;
		display: flex;
	}
	.side-menu {
		width: 5%;
		height: 90vh;
	}
	.side-menu > .menu {
		color: #d2cfcb;
		font-weight: bold;
		width: 70px;
		margin: 20px 20px 20px 0;
	}
	.side-menu > .active {
		color: #f999b7;
	}
	
	.info-main {
		width: 95%;
		height: 90vh;
	}
	.place-main {
		width: 100%;
	}
	.place-search {
		width: 100%;
		height: 20%;
	}
	.place-list {
		width: 100%;
		height: 80%;
		display: flex;
	}
	.place-result {
		width: 50%;
	}
	.place-choosed {
		width: 50%;	
	}
	.map {
		width: 60%;
		height: 90vh;
		margin-left: 10px;
	}
	.choose-bottom {
		width: 100%;
		height: 10vh;
		background-color: #f8f6f2;
	}
	.input-group {
		width: 350px;
		margin: 0px auto;
		padding-top: 50px;
	}
	.input-group > .form-control {
		border-right: none;
	}
	.input-group-addon {
		background-color: white;
	}
	.cate {
		margin-top: 20px;
	}
	.cate > span {
		width: 80px;
		height: 30px;
		padding: 10px;
		margin: 5px;
		background-color: #f8f6f2;
		border-radius: 15px;
		box-shadow: 0 2px 5px rgba(0,0,0,0.12);
    	transition: all 0.2s ease;
	}
	.menus {
		margin-top: 100px !important;
	}
	.place {
		width: 90%;
		height: 110px;
		border-radius: 10px;
		box-shadow: 0 2px 5px rgba(0,0,0,0.12);
    	transition: all 0.2s ease;
    	margin: 0px auto;
    	margin-bottom: 8px;
    	display: flex;
	}
	h4 {
		height: 3%;
		margin-left: 20px;
	}
	.list-scroll {
		height: 90%;
		overflow-y: auto; 
  		overflow-x: hidden;
  		
	}
	.thumb > img {
		border-radius: 10px;
		margin: 4px 0 0 4px;
	}
	.place-info {
		margin-left: 10px;
	}
	.btns {
		height: 25px;
		height: 25px;
	}
	.card-right .btns {
		margin-left: auto;
	}
	.btns > button {
		background-color: #90e0ef;
		border: none;
		color: white;
		border-radius: 5px;
		width: 25px;
		height: 25px;
		font-weight: 1000;
		margin-right: 15px;
	}
	.card-right {
		display: flex; align-items: center; width: 100%;
	}
	.btn-default {
		background-color: black;
		color: white;
		font-weight: bold;	
		font-size: 15px;
	}
	.choose-bottom {
		display: flex;
	}
	.start {
		width: 10%;
		align-content: center;
		margin-left: 70px;
	}
	.cen {
		width: 80%;
	}
	.end {
		width: 10%;
		align-content: center;
		margin-left: 30%;
	}
	.end2 {
		width: 10%;
		align-content: center;
	}
	.container {
		width: 900px;
	}
	.form-group {
		margin-top: 40px;
	}
	.col-lg-12 > p {
		margin-left: 30px;
		font-size: 12px;
	}
	.control-label {
		font-size: 15px;
	}
</style>
</head>
<body>
<div class="tab-content">

	<!-- STEP 1 -->
	<div id="step1" class="tab-pane fade in active">
		<div class="course-container">
			<div class="choose-main">
			    <div class="side-menu">
			        <div style="height: 50px"></div>
			    	<div class="menu active text-center">
			    		STEP 1<br>장소 선택
			    	</div>
			    	<div class="menu text-center">
			    		STEP 2<br>상세 내용
			    	</div>
			    </div>
				<div class="choose-left">
					
					<div class="place-main">
						<div class="place-search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="장소를 검색하세요." aria-describedby="basic-addon2">
                                <span class="input-group-addon" id="basic-addon2"><i class="fa fa-search"></i></span>
                            </div>
                            <div class="cate text-center">
                            	<span>명소</span>
                            	<span>액티비티</span>
                            	<span>연극/뮤지컬</span>
                            	<span>음식점</span>
                            </div>
						</div>
						<div class="place-list">
							<div class="place-result">
								<h4>검색 결과</h4>
								<div class="list-scroll">
								   <c:forEach begin="0" end="100">
								     <div class="place">
								     	<div class="thumb">
								     	  <img src="/images/test_map.png" width="100px" height="102px">
								     	</div>
								     	<div class="card-right">
									     	<div class="place-info">
									     	  <h5>장소이름장소이름</h5>

									     	   <p>주소주소주소주소</p>
									     	   <p>카테고리</p>
									     	</div>
									     	<div class="btns">
									     	  <button><i class="fa fa-plus" aria-hidden="true"></i></button>
									     	</div>
								     	</div>
								     </div>
								   </c:forEach>
								</div>
							</div>
				  			<div class="place-choosed">
				  			    <h4>선택된 장소</h4>
				  			    <div class="list-scroll">
				  					<c:forEach begin="0" end="100">
								     <div class="place">
								     	<div class="thumb">
								     	  <img src="/images/test_map.png" width="100px" height="102px">
								     	</div>
								     	<div class="card-right">
									     	<div class="place-info">
									     	  <h5>장소이름장소이름</h5>

									     	   <p>주소주소주소주소</p>
									     	   <p>카테고리</p>
									     	</div>
									     	<div class="btns">
									     	  <button><i class="fa fa-minus" aria-hidden="true"></i></button>
									     	</div>
								     	</div>
								     </div>
								   </c:forEach>
								</div>
				  			</div>
						</div>
					</div>
				</div>
				<div class="map">
					<img src="/images/test_map.png" width="100%" height="100%">
				</div>
			</div>
			<div class="choose-bottom">
			    <div class="start">
			        <a class="btn btn-default" onclick="javascript:history.back()">취소</a>
			    </div>
			    <div class="cen"></div>
			    <div class="end">
			    	<a class="btn btn-default" data-toggle="tab" href="#step2">다음</a>
			    </div>
			</div>
		</div>
	</div>
	<!-- STEP 2 -->
	<div id="step2" class="tab-pane fade">
		<div class="course-container">
		    <div class="choose-main">
			    <div class="side-menu">
			        <div style="height: 50px"></div>
			    	<div class="menu text-center">
			    		STEP 1<br>장소 선택
			    	</div>
			    	<div class="menu active text-center">
			    		STEP 2<br>상세 내용
			    	</div>	  
		      </div>
		      <div class="container">
		      <div class="col-md-6" style="margin-top: 150px">
                                            <div class="form-group has-feedback">
                                                <label class="control-label">코스 제목</label>
                                                    <input type="text" class="form-control" placeholder="코스 제목을 입력하세요." required>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label">코스 설명</label>
                                                <textarea class="form-control" id="textarea" name="textarea" rows="12" placeholder="코스 설명을 작성하세요."></textarea>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label" style="padding-right: 50px">공개 여부</label>
                                                <label>
												  <input type="radio" name="category" value="spot"> 공개
												</label>
												  &nbsp;&nbsp;&nbsp;
												<label>
												  <input type="radio" name="category" value="food"> 비공개
												</label>
                                            </div>
                                            <p>공개 시 코스 게시판에 등록되고, 비공개 시 마이페이지에서 나만 볼 수 있습니다.</p>
                                        </div>
                                       </div>
                                      </div>
			<div class="choose-bottom">
			    <div class="start">
			        <a class="btn btn-default" onclick="javascript:history.back()">취소</a>
			    </div>
			    <div class="cen"></div>
			    <div class="end2">
			    	<a class="btn btn-default" data-toggle="tab" href="#step1">이전</a>
			    	<a class="btn btn-default">작성</a>
			    </div>
			</div>
		</div>
	</div>
</div>

</body>
</html>