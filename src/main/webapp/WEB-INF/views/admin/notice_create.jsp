<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 작성</title>
</head>
<body>
	<div class="container" id="notice_insert">
		<h1 class="page-title">
			<i class="fas fa-edit"></i>공지사항 작성
		</h1>
		<div class="card">
			<div class="card-header">공지사항 작성</div>
			<div class="card-body">
				<div class="form-group">
					<label for="title">제목<span style="color: #e74a3b;">*</span>
					</label> <input type="text" class="form-control" id="title" name="title" v-model="store.n_title"
						placeholder="제목을 입력하세요">
				</div>
				<div class="form-group">
					<label for="content">내용 <span style="color: #e74a3b;">*</span></label>
					<textarea class="form-control" id="content" name="content" v-model="store.n_content"
						placeholder="내용을 입력하세요"></textarea>
				</div>
				<div class="d-flex justify-content-center">
					<a href="/admin/notice" type="button"
						class="btn btn-secondary mr-3" style="width: 80px;"> <i
						class="fas fa-times"></i>&nbsp;취소
					</a>
					<button type="button" class="btn btn-primary" style="width: 80px;" @click="insertNotice">
						<i class="fas fa-check"></i>&nbsp;등록
					</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<script src="https://unpkg.com/vue-demi@0.14.6/lib/index.iife.js"></script>
	<script src="https://unpkg.com/pinia@2/dist/pinia.iife.prod.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/notice/noticeStore.js"></script>
    <script type="text/javascript">
     const {createApp,onMounted} = Vue
     const {createPinia} = Pinia
     const noticeApp=createApp({
    	 setup(){
    		const store = useNoticeStore()

   		    const insertNotice = async () => {
   		      if (!store.n_title.trim() || !store.n_content.trim()) {
   		        alert('제목과 내용을 입력하세요')
   		        return
   		      }

   		      await store.noticeInsert()
   		      location.href = '/admin/notice'
   		    }

   		    return {
   		      store,
   		      insertNotice
   		    }
   		  }
     })
     noticeApp.use(createPinia())
     noticeApp.mount('#notice_insert')
    </script>
</body>
</html>