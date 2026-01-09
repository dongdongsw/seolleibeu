<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="detailborder"  style="margin-bottom: 20px;">
	<div class="detailinline">
		<div class="detailpadding" v-for="(imgs, index) in store.pvo.imgList" :key="index">
			<img :src="imgs.img" onerror="this.src='/images/noimage.png'" style="width: 900px; padding-left: 130px;">
		</div>
	</div>
</div>
</body>
</html>