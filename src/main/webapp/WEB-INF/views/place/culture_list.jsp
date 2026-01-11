<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/course.css" rel="stylesheet">
<style>
.custom-select option[disabled] {
    display: none;
}
</style>
</head>
<body>
    <div class="page-header">
        <!-- page header -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h2 class="page-title">문화/체험</h2>
                        <p>연극/뮤지컬 & 전시 & 액티비티</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.page header -->
    <div class="content" id="culture_list">
        <div class="container">
        	<div class="type-select" style=" margin-left: 5px;">
	   			<input type="radio" name="type" value="name" v-model="store.column">이름
   				<input type="radio" name="type" value="addr" v-model="store.column">주소
	   		</div>
		   	<div class="input-group" style="margin: 0px; padding-top:10px;">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-describedby="basic-addon2" 
						style="border-radius: 15px 0px 0px 15px; color: gray;" v-model="store.keyword" ref="keywordRef" @keyup.enter="store.search(keywordRef)">
				<span class="input-group-addon" id="basic-addon2" style="border-radius: 0px 15px 15px 0px;">
					<button @click="store.search(keywordRef)" style="border: none; background-color: white;"><i class="fa fa-search"></i></button>
				</span>
			</div>
			<div style="float: right; margin-top: -25px;">
			    <select class="btn" style="background-color: white; border-radius: 15px; padding: 5px 10px; margin-right: 10px;" v-model="store.selected" @change="store.changeSelected">
			        <option value="p.pno" selected disabled hidden>정렬기준</option>
			        <option value="p.created_at">최신순</option>
			        <option value="p.hit">인기순</option>
			        <option value="f_count">즐겨찾기순</option>
			        <option value="l_count">좋아요순</option>
			        <option value="r_count">리뷰순</option>
			    </select>
			</div>
            <div class="row" style="margin-top: 10px;">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" v-for="(vo, index) in store.culList" :key="index">
                    <div class="project-img mb30 thumbnail">
                        <a :href="'/place/culture/detail_before?pno='+vo.pno" class="imghover">
                        	<img :src="vo.thumbnail" class="img-responsive" alt="Interior Design Website Templates Free Download" style="width: 235px; height: 250px;">
                        	<div class="caption">
                        		<h4 class="text-center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{vo.name}}</h4>
                        		<p style="font-size: 12px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{vo.addr}}</p>
                        		<p style="font-size: 12px;" class="text-right">예매 가능</p>
                        	</div>
                        </a>
                    </div>
                	
                </div>
            </div>
            <div class="row">
                <div class="st-pagination">
                    <ul class="pagination">
                        <li v-if="store.startPage>1"><a @click="store.movePage(store.startPage-1)">이전</a></li>
                        <li v-for="i in store.range"><a :class="i === store.curpage ? 'active' : ''" @click="store.movePage(i)">{{i}}</a></li>
                        <li v-if="store.endPage<store.totalpage"><a @click="store.movePage(store.endPage+1)">다음</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script src="/vuejs/axios.js"></script>
    <script src="/vuejs/place/cultureStore.js"></script>
    <script>
      const { createApp, onMounted, ref } = Vue
      const { createPinia } = Pinia
      
      const cultureApp = createApp({
    	  setup() {
    		  const keywordRef = ref(null)
    		  const store = useCultureStore()
    		  
    		  onMounted(()=> {
    			  store.cultureListData()
    		  })
    		  
    		  return {
    			  store,
    			  keywordRef
    		  }
    	  }
      })
      cultureApp.use(createPinia())
      cultureApp.mount('#culture_list')
    </script>
</body>
</html>