 $(function () {
    vm.query();
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		
		q:{
			title: null
		},
		showList: true,
		title:null,
		salelistgoods:{
			id : "", 
			code : "", 
			goodsid : "", 
			model : "", 
			name : "", 
			num : "", 
			price : "", 
			total : "", 
			unit : "", 
			salelistid : "", 
			typeid : "", 
			addtime : ""
		},
		entitylist:[],
		page:{
			totalCount:0,
			pageSize:3,
			totalPage:0,
			currPage:1
		},
		pagenum : 1
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			
		},
		update : function(){
			var arr = $("input[name='ids'][type='checkbox']:checked");
			// 只有长度是1的时候 才是合法的
			if(arr.length!=1){
				alert("请选择一条信息进行修改!");				
				return ;
			}
			var saleListGoodsId = arr[0].value;
			
			if(saleListGoodsId == null){
				return ;
			}
			
			vm.showList = false;
			
            vm.title = "修改";
			vm.getSaleListGoods(saleListGoodsId);
			
		},
		getSaleListGoods: function(saleListGoodsId){
			var params = {};
			
			params.id = saleListGoodsId;
			
			$.get("/sys/salelistgoods/selectOne",params, function(r){
				vm.salelistgoods = r.salelistgoods;
			});
		},
		del: function () {

			var arr = $("input[name='ids'][type='checkbox']:checked");
			
			var ids = new Array();
			
			$.each(arr,function(index,obj){
				var id = obj["value"];
				ids[index] = id;
			});
			

			if(ids.length<1){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "/sys/salelistgoods/delete",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								
								//$("input[name='ids'][type='checkbox']").attr("checked","false");
								
								$("input[name='ids'][type='checkbox']").removeAttr("checked");
								
                                vm.reload();
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		saveOrUpdate: function (event) {
			var url = vm.salelistgoods.id == "" ? "/sys/salelistgoods/save" : "/sys/salelistgoods/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.salelistgoods),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		toPage: function(page){
			if(page<1){
				page=1;
			}
			if(page>=vm.page.totalPage){
				page=vm.page.totalPage
			}
			this.pagenum = page;
			
			vm.reload();
			
		},
		reload: function (event) {
			vm.showList = true;
			var params = {};
			
			params.page = this.pagenum;
			params.limit = this.page.pageSize;
			params.title = this.q.title;
			
			$.get("/sys/salelistgoods/list",params, function(r){
				vm.entitylist = r.page.list;
				vm.page = r.page;
			});
			
			
		}
	}
});