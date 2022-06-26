$(function () {
    vm.query();
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			name: null,
			//退货单号
			returnnumber :null,
		},
		//显示商品信息
		showList: true,
		title:null,
		//退货单
		returnlist:{},
		//退货单商品
		returnlistgoods:{
			id:"",
//			code:"",
			model:"",
			name:"",
			num:"",
			price:"",
			total:"",
			unit:""		
		},
		entitylist:[],
		page:{
			totalCount:0,
			pageSize:5,
			totalPage:0,
			currPage:1
		},
		pagenum : 1
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add : function() {
			vm.showList = false;
			vm.title = "新增";	
		},
		//修改
		update: function () {
			var arr = $("input[name='ids'][type='checkbox']:checked");

			if (arr.length != 1) {
				alert("请选择一种信息进行修改操作!");
				return;
			}

			var id = arr[0].value;
			if(id == null){
				return ;
			}
			vm.getEntity(id);
			vm.showList = false;
            vm.title = "修改";
			
		},
		//删除
		del: function () {
			var arr = $("input[name='ids'][type='checkbox']:checked");

			var ids = new Array();
			//遍历赋值id
			$.each(arr, function(index, obj) {
//				 alert(obj["value"]);
				var id = obj["value"];
				ids[index] = id;
			});

			if (ids.length < 1) {
				return;
			}
			
			confirm('确定要删除选中的商品？', function() {
				$.ajax({
				type: "POST",
			    url: "/sys/returnlistgoods/delete",
			    data: JSON.stringify(ids),
			    success: function(r){
			    	if(r.code == 0){
						alert('操作成功', function(index){
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
		
		//获取用户信息
	getEntity: function(id){
		alert(id)
		var params = {};
		params.id = id;
		$.get("/sys/returnlistgoods/selectOne",params, function(r){
			vm.returnlistgoods = r.returnlistgoods;
		});
	},

		//页面设置
		toPage: function(page){
			
			this.pagenum = page;
			
			vm.reload();			
		},
		//加载页面信息
		reload: function (event) {
			vm.showList = true;
			var params = {};
			
			params.page = this.pagenum;
			params.limit = this.page.pageSize;
			params.name = this.q.name;

			//退货商品信息（退货单号）
			$.get("/sys/returnlistgoods/list", params, function(r) {
				vm.entitylist = r.page.list;
				vm.page = r.page;
			});
		},
		saveOrUpdate: function (event) {
			var url = vm.returnlistgoods.id == "" ? "/sys/returnlistgoods/save" : "/sys/returnlistgoods/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.returnlistgoods),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							$("input[name='ids'][type='checkbox']").removeAttr("checked");
							
//							vm.entitylist = index.page.list;
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		
		
		
	}
});