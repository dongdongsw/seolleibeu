<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
 <div class="d-flex justify-content-center">
	<div style="width: 1200px;" id="notice_detail">
		<div class="container-fluid">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-3">
			</div>
			<div class="card shadow mb-4">
				<div
					class="card-header py-3 d-flex justify-content-between align-items-center">
					<h6 class="m-0 font-weight-bold text-primary">공지사항 상세보기</h6>

				</div>
				<div class="card-body">
					<div class="mb-3">
						<div class="row">
							<div class="col-lg-12 mb-3">
							  <label class="small text-gray-700 font-weight-bold">제목</label>
							  <div class="form-control">{{store.detail.n_title}}</div>
							</div>
						</div>
					</div>
					<div class="mb-4">
						<div class="row">
							<div class="col-lg-12 mb-3">
								<label class="small text-gray-700 font-weight-bold">내용</label>
								<div class="form-control" style="min-height: 350px; white-space: pre-wrap;">{{store.detail.n_content}}</div>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-end">
						<a href="/admin/notice" class="btn btn-secondary mr-2">목록</a>
						<a :href="'/admin/notice_update?n_id=' + store.detail.n_id" class="btn btn-primary mr-2">수정</a>
						<button type="button" class="btn btn-danger" @click="deleteNotice(store.detail.n_id)">삭제</button>
					</div>
				</div>
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
     const noticeApp = createApp({
    	  setup() {
    	    const store = useNoticeStore()
    	    
    	    const params = new URLSearchParams(location.search)
			const n_id = params.get('n_id')

    	    const deleteNotice = async (n_id) => {
    	    	if (!confirm('정말 삭제하시겠습니까?')) return

    	    	  try {
    	    	    await store.noticeDelete(n_id)
    	    	    alert('삭제되었습니다.')
    	    	    location.href = '/admin/notice'
    	    	  } catch (e) {
    	    	    alert('삭제 중 오류가 발생했습니다.')
    	    	  }
    	    	}

    	    onMounted(() => {
    	      store.noticeDetailData(n_id)
    	    })

    	    return {
    	      store,
    	      deleteNotice
    	    }
    	  }
     })
     noticeApp.use(createPinia())
     noticeApp.mount('#notice_detail')
    </script>
</body>
</html>