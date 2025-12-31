<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mypage.css" rel="stylesheet">
<style type="text/css">
	.reply-box {
		width: 100%;
		height: 500px;
		border: 2px solid #333;
	}
	tr {
		border-top: 1px solid #ddd;
		border-bottom: none !important;
	}
	td {
		border-top: none !important;
	}
	.reply-content {
		border-top: none !important;
	}
</style>
</head>
<body>
<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<table class="table">
					  <c:forEach begin="0" end="5">
					  <tr>
					   <td class="text-left" width="80%" style="display: flex;">
					   <div style="margin-right: 10px">
					   	<img src="/images/user-pic-1.jpg" width="30" height="30" style="border-radius: 50px">
					   </div>
					   <div style="display: flex; justify-content: center; align-items: center">
					   	  <p>닉네임</p>
					   </div>
					   
					   </td>
					   <td class="text-right">
					     2025.12.31
					   </td>
					  </tr>
					  <tr class="reply-content">
					    <td>
					     <div style="white-space: pre-wrap;background-color: white;border:none;text-align: left;margin-top: 10px;margin-bottom: 30px; margin-left: 80px">첫 데이트하기 좋은 코스</div>
					    </td>
					    <td class="text-right">
					    <div style="margin-top: 50px;">
					     <span>
					      <button type="button" href="#" class="info-btn" id="reply">수정</button>
					      <button type="button" class="info-btn">삭제</button>
					     </span>
					    </div>
					  </td>
					  </tr>
					  
					  </c:forEach>
					</table>
					<table class="table">
					 <tr>
					  <td>
					   <!-- <textarea row="5" cols="70" style="float: left"></textarea> -->
					   <textarea rows="5" cols="70" class="comment-input"></textarea>
					   <button type=button class="comment-btn">댓글쓰기</button>
					  </td>
					 </tr>
					 
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>