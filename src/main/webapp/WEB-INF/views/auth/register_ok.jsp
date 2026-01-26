<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <title>회원가입 완료</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 3 CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- Font Awesome (아이콘) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .complete-box {
            max-width: 360px;
            margin: 100px auto;
            background: #fff;
            padding: 30px 20px;
            text-align: center;
            border-radius: 4px;
            position: absolute;
		    top: 30%;
		    left: 50%;
		    transform: translate(-50%, -50%);
        }
        .check-circle {
            width: 80px;
            height: 80px;
            border: 3px solid #fa6c66;
            border-radius: 50%;
            margin: 0 auto 20px;
            line-height: 74px;
        }
        .check-circle i {
            font-size: 40px;
            color: #fa6c66;
        }
        .btn-orange {
            background-color: #fa6c66;
            border-color: #fa6c66;
            color: #fff;
        }
        .btn-orange:hover {
            background-color: #fa6c99;
            border-color: #fa6c99;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="complete-box">
    <div class="check-circle">
        <i class="fa fa-check"></i>
    </div>

    <h3><strong>회원가입이 완료되었습니다.</strong></h3>
    <p class="text-muted" style="font-size: 20px;">
        지금 바로 로그인하고<br>
			다양한 서비스를 이용해보세요.
    </p>
	<br>
	<br>
	<br>
    <a href="/auth/login" class="btn btn-orange btn-block">
        로그인하러 가기
    </a>
</div>

</body>
</html>