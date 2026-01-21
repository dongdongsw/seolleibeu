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
	.content-reply {
		padding-top: 0;
	}
</style>
<script>
const SESSION_ID=Number('${sessionScope.uno}')
</script>
</head>
<body>
<div class="content-reply" id="reply_list">
	    <div class="container">
	  		<div class="row">
		  		<h2>댓글 {{rStore.replycount}}</h2>
				<hr style="margin-top: 10px; color:black">
	  		</div>
	    </div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 100px;">
					<table class="table" v-for="(rvo,index) in rStore.reply_list" :key="index">
					  <tr>
					   <td class="text-left" width="80%" style="display: flex;">
					   <div style="margin-right: 10px">
					   	<img :src="rvo.profile_img ? rvo.profile_img : '/profile/profile.png'" width="30" height="30" style="border-radius: 50px">
					   </div>
					   <div style="display: flex; justify-content: center; align-items: center">
					   	  <p>{{rvo.name}}</p>
					   </div>
					   
					   </td>
					   <td class="text-right">
					     {{rvo.dbday}}
					   </td>
					  </tr>
					  <tr class="reply-content">
					    <td>
					     <div style="white-space: pre-wrap;background-color: white;border:none;text-align: left;margin-top: 10px;margin-bottom: 30px; margin-left: 80px">
					      {{rvo.cr_content}}
					     </div>
					    </td>
					    <td class="text-right">
					    <div style="margin-top: 50px;">
					     <span>
					      <button type="button" class="info-btn" v-if="rStore.sessionId===rvo.uno"
					       @click="rStore.toggleUpdate(rvo.id,rvo.cr_content)"
					      >
					      	{{rStore.upReplyNo===rvo.id?'취소':'수정'}}
					      </button>
					      <button type="button" class="info-btn" v-if="rStore.sessionId===rvo.uno"
					       @click="rStore.replyDelete(rvo.id)"
					      >삭제</button>
					     </span>
					    </div>
					  </td>
					  </tr>
					 
					 <tr v-if="rStore.upReplyNo===rvo.id">
					  <td colspan="2">
					   <textarea rows="5" class="comment-input" v-model="rStore.updateMsg[rvo.id]"></textarea>
					   <button type=button class="replyupdate-btn" @click="rStore.replyUpdate(rvo.id)"
					   >댓글수정</button>
					  </td>
					 </tr>

					</table>
					<table class="table" v-if="rStore.sessionId" style="margin-bottom: 100px;">
					 <tr>
					   <td>
					    <textarea rows="5" cols="70" class="comment-input" v-model="rStore.cr_content"></textarea>
					    <button type=button class="comment-btn" @click="rStore.replyInsert(writer_id)"
					    >댓글쓰기</button>
					   </td>
					  </tr>
					 </table>
				</div>
			</div>
		</div>
	</div>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/reply/replyStore.js"></script>
    <script type="text/javascript">
    
     const {createApp,onMounted} = Vue
     const {createPinia} = Pinia
     const replyApp=createApp({
    	 setup(){
    		 const rStore=useReplyStore();
    		 
    		 const params=new URLSearchParams(location.search)
    		 const cno=params.get('cno')
    		 
    		 onMounted(()=>{
    			 rStore.replyListData(cno)
    			 rStore.sessionId=SESSION_ID
    		 })
    		 
    		 return {
    			 rStore
    		 }
    	 }
     })
     replyApp.use(createPinia())
     replyApp.mount('#reply_list')
    </script>
</body>
</html>