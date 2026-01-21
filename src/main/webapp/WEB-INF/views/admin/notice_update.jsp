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
	<div class="container" id="notice_update">
		<h1 class="page-title">
			<i class="fas fa-edit"></i> 공지사항 수정
		</h1>
		<div class="card">
			<div class="card-header">공지사항 수정</div>
			<div class="card-body">
				<div class="form-group">
					<label for="title"> 제목 <span style="color: #e74a3b;">*</span>
					</label> <input type="text" class="form-control" id="title" name="title" v-model="store.detail.n_title"
						placeholder="제목을 입력하세요">
				</div>
				<div class="form-group">
					<label for="content"> 내용 <span style="color: #e74a3b;">*</span>
					</label>
					<textarea class="form-control" id="content" name="content" v-model="store.detail.n_content"
						placeholder="내용을 입력하세요"></textarea>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-secondary" onclick="javascript:history.back()">
						<i class="fas fa-times"></i> 취소
					</button>
					<button type="button" class="btn btn-primary" @click="updateNotice">
						<i class="fas fa-check"></i> 등록
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
   		     const params = new URLSearchParams(location.search)
   		     const n_id = params.get('n_id')

   		     const updateNotice = async () => {
   		      await store.noticeUpdate(store.detail.n_id)
   		      location.href = '/admin/notice_detail?n_id=' + store.detail.n_id
   		     }

   		     onMounted(() => {
   		      store.noticeDetailData(n_id)
   		     })

   		     return {
   		      store,
   		      updateNotice
   		    }
   		  }
     })
     noticeApp.use(createPinia())
     noticeApp.mount('#notice_update')
    </script>
</body>
</html>