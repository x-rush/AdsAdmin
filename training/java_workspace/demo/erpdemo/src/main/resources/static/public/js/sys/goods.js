$(function () {
    vm.reload();
});

var vm = new Vue({
	el:'#goods',
	data:{
		q_name:"",
		showList: true,
		title:null,
		roleList:{},
		goods:{
			id:null,
			typeid:"",
			code:"",
			name:"",
			model:"",
			unit:"",
			lastpurchasingprice:"",
			sellingprice:"",
			minnum:"",
			producer:"",
			message:""
		},
		goodsList:[],
		list_goods:[],
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
//			alert(vm.q.name.length);
			var pagenum = vm.pagenum;
			var name = vm.q_name;
//			alert(name);
			$.ajax({
				type:"GET",
				url:"/goods/search",
				data:{
					name:name,
				},
				success : function(result) {
					vm.list_goods = result.list_goods;
				},
			});
//			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			
			vm.roleList = {};
			vm.user = {status:1,roleIdList:[]};
			
			//获取角色信息
			this.getRoleList();
		},
		update: function () {
			
			var arr = $("input[name='ids'][type='checkbox']:checked");
			
			// 只有长度是1的时候 才是合法的
			if(arr.length!=1){
				alert("请选择一条信息进行修改!");				
				return ;
			}
			
			var id = arr[0].value;
			
			
			if(id == null){
				return ;
			}
			
//			alert(id);
			
			$.ajax({
				type:"GET",
				url:"/goods/getOne",
				data:{
					id:id,
				},
				success:function(result){
					vm.goods = result.goods;
				}
			});
			
			vm.showList = false;
            vm.title = "修改";
			
			/*vm.getGoods(id);
			//获取角色信息
			this.getRoleList();*/
		},
		del: function () {
//			var userIds = getSelectedRows();
			// 找到 被选中的 checkbox 
			
			var arr = $("input[name='ids'][type='checkbox']:checked");
			
			var ids = new Array();
			
			$.each(arr,function(index,obj){
//				alert(obj["value"]);
				var id = obj["value"];
				ids[index] = id;
			});
			

			if(ids.length<1){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "/goods/del",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								
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
			console.log(vm.goods.id );
			var url = vm.goods.id == null ? "/goods/save" : "/goods/update";
			var param={};
			param.id = vm.goods.id;
			param.typeid = vm.goods.typeid;
			param.code = vm.goods.code;
			param.name = vm.goods.name;
			param.model = vm.goods.model;
			param.unit = vm.goods.unit;
			param.lastpurchasingprice = vm.goods.lastpurchasingprice;
			param.sellingprice = vm.goods.sellingprice;
			param.minnum = vm.goods.minnum;
			param.producter = vm.goods.producter;
			
			
			
//			$.get(url,param,function(r){
//				if(r.code === 0){
//					alert('操作成功', function(index){
//						vm.reload();
//					});
//				}
//			});
			
			$.ajax({
				type: "POST",
			    url: url,
//			    data: {
//			    	param:param,
//			    },
			    data: JSON.stringify(param),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}
				}
			});
			vm.reload();
		},

		toPage: function(page){
			
			this.pagenum = page;
			
			vm.reload();
			
		},
		reload: function (/*event*/) {
			vm.showList = true;
			$.ajax({
				type : "POST",
				url : "/goods/show",
				success : function(result){
					vm.list_goods = result.list_goods;
//					console.log(vm.list_goods);
				}
			})
			
			/*var params = {};
			params.page = this.pagenum;
			params.limit = this.page.pageSize;
			params.name = this.q.name;
			
			$.get("/goods/list",params, function(r){
				vm.goodsList = r.page.list;
				vm.page = r.page;
			});*/
			
			
		}
	}
});