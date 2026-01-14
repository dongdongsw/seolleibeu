const {defineStore} = Pinia

const useAdminRefundStore=defineStore('adimin_refund',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		endPage:0,
		totalpage:0
	})
})