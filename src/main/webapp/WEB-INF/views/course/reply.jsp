<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700"
	rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="../css/mypage.css" rel="stylesheet">
<style type="text/css">
	.reply-box {
		width: 100%;
		height: 500px;
		border: 2px solid #333;
	}
</style>
</head>
<body>
<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<table class="table">
					  <tr>
					   <td class="text-left" width="80%">
					   닉네임 &nbsp;|&nbsp; 2026-01-01
					   </td>
					   <td class="text-right" width="20%">
					    <button type="button" href="#" class="info-btn" id="reply">수정</button>
					    <button type="button" class="info-btn">삭제</button>
					   </td>
					  </tr>
					  <tr>
					    <td colspan="2" class="text-left">
					     <div style="white-space: pre-wrap;background-color: white;border:none;text-align: left;margin-top: 30px;margin-bottom: 30px;">첫 데이트하기 좋은 코스</div>
					    </td>
					  </tr>
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