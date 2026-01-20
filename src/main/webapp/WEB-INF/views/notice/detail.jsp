<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<style>
	.notice-detail-header {
		border-bottom: 2px solid #333;
		padding-bottom: 20px;
		margin-bottom: 20px;
	}
	.notice-title {
		font-size: 24px;
		font-weight: bold;
		margin-bottom: 15px;
		color: #333;
	}
	.notice-info {
		color: #666;
		font-size: 14px;
	}
	.notice-info span {
		margin-right: 20px;
	}
	.notice-content {
		min-height: 400px;
		padding: 30px 20px;
		line-height: 1.8;
		font-size: 15px;
		color: #333;
	}
	.notice-footer {
		border-top: 1px solid #ddd;
		padding-top: 20px;
		margin-top: 40px;
	}
	.btn-list {
		float: right;
	}
	.notice-nav {
		margin-top: 30px;
		border-top: 1px solid #ddd;
	}
	.notice-nav-item {
		padding: 15px 0;
		border-bottom: 1px solid #eee;
	}
	.notice-nav-label {
		font-weight: bold;
		width: 80px;
		display: inline-block;
	}
	.notice-nav-title {
		color: #333;
		text-decoration: none;
	}
	.notice-nav-title:hover {
		color: #007bff;
		text-decoration: underline;
	}
	.back {
		background-color: #ffffff;
		padding: 40px;
		border-radius: 8px;
		box-shadow: 0 2px 4px rgba(0,0,0,0.1);
	}
	body {
		background-color: #f8f6f2;
	}
</style>
</head>

<body>

	<div class="content auth-wrapper" style="margin-top: 30px;">
		<div class="container back">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<main class="mypage-main" id="notice_detail">
						<div class="notice-detail-header">
							<div class="notice-title">
								{{store.detail.n_title}}
							</div>
							<div class="notice-info">
								<span><i class="fa fa-user"></i> 관리자</span>
								<span><i class="fa fa-calendar"></i> {{store.detail.created_at}}</span>
								<span><i class="fa fa-eye"></i> 조회수 {{store.detail.hit}}</span>
							</div>
						</div>

						<div class="notice-content">
							{{store.detail.n_content}}
						</div>
						 <div class="notice-footer">
						   <button class="btn btn-secondary" @click="goList">목록</button>
						 </div>
					</main>
				</div>
			</div>
		</div>
	</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const header = document.querySelector('header') || document.querySelector('.header') || document.querySelector('.navbar');
    
    if(header) {
        // 초기 상태 - 검은색 텍스트
        header.style.color = '#333';
        const links = header.querySelectorAll('a');
        links.forEach(link => link.style.color = '#333');
        
        // 스크롤 이벤트
        window.addEventListener('scroll', function() {
            if(window.scrollY > 50) {
                header.classList.add('scrolled');
                header.style.backgroundColor = '#000';
                header.style.color = '#fff';
                links.forEach(link => link.style.color = '#fff');
            } else {
                header.classList.remove('scrolled');
                header.style.backgroundColor = 'transparent';
                header.style.color = '#333';
                links.forEach(link => link.style.color = '#333');
            }
        });
    }
});
</script>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/notice/noticeStore.js"></script>
    <script type="text/javascript">
     const {createApp,onMounted} = Vue
     const {createPinia} = Pinia
     const noticeApp=createApp({
    	 setup(){
    		 const store=useNoticeStore();
    		 
    		 const params = new URLSearchParams(location.search)
    		 const n_id = params.get('n_id')
    		 
    		 const goList = () => {
		      location.href = '/notice/list'
		    }

    		 onMounted(()=>{
    			 store.noticeDetailData(n_id)
    		 })
    		 
    		 return {
    			 store,
    		     goList
    		 }
    	 }
     })
     noticeApp.use(createPinia())
     noticeApp.mount('#notice_detail')
    </script>
</body>
</html>