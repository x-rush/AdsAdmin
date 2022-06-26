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
		ptList:[],
		product:{
			name:"",
			price:""
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
			
			// 获取商品类别 集合
			this.getPTList();
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
			
			vm.showList = false;
            vm.title = "修改";
			
			vm.getEntity(id);
			
		},
		del: function () {

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
				    url: "/sys/product/delete",
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
			var url = vm.product.id == null ? "/sys/product/save" : "/sys/product/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.product),
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

		getEntity: function(id){
			var params = {};
			
			params.id = id;
			
			$.get("/sys/product/selectOne",params, function(r){
				vm.user = r.user;
			});
		},
		getPTList: function(){// 获取商品类别集合
			$.get("/sys/producttype/selectAll", function(r){
				vm.ptList = r.list;
			});
		},
		toPage: function(page){
			
			this.pagenum = page;
			
			vm.reload();
			
		},
		reload: function (event) {
			vm.showList = true;
			var params = {};
			
			params.page = this.pagenum;
			params.limit = this.page.pageSize;
			params.title = this.q.title;
			
			$.get("/sys/product/list",params, function(r){
				vm.entitylist = r.page.list;
				vm.page = r.page;
			});
			
			
		}
	}
});