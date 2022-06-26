$(function() {
	vm.query();
});

var vm = new Vue({
	el : '#rrapp',
	data : {
		q : {
			name:""
		},
		showList : true, // 显示页面
		title : null,
		// roleList:{},
		model : {
			
			id : null,
			tid : "",
			name : "",
			price : "",
			userid : ""

		},
		list_modelList : {},
		page : {
			totalCount : 0,
			pageSize : 5,
			totalPage : 0,
			currPage : 1
		},
		pagenum : 1
	},
	methods : {
		query : function() {
			vm.reload();
		},
		
		add : function() {
			vm.showList = false;
			
			vm.title = "新增";
		},
		
		
		
		save : function() {
			vm.showList = true;
			var param={};
			param.tid = this.model.tid;
			param.name = this.model.name;
			param.price = this.model.price;
			param.userid = this.model.userid;		
			$.get("/sys/model/save",param,function(data) {
					if (data.code == 0) {
						alert("添加成功");
						vm.showList = false;
						vm.reload();
						vm.model = {
							id : "",
							tid : "",
							name : "",
							price : "",
							userid : "",
                        }
					} else {
						alert("添加失败");
						vm.showList = true;
					}
			});
			
		},
		

		update: function () {
			var ids = $("input[type='checkbox'][name='bb']:checked");
			if( ids.length != 1 ){
				alert("请选中一条信息!");
				return;
			}
				vm.showList = false;
			
				var param={};
			    
				param.id = ids[0].value;
			
			$.get("/sys/model/update",param, function(data){
				if(data.code == 0){
					vm.model = data.entity;
//					user.id=param.id
				}
                else{
                	vm.showList = false;
                }
			});
		},
		
		
		
		dels : function() {
			var ids = [];
            $("input[name='bb'][type='checkbox']:checked").each(function() {
				ids.push($(this).val());
			});
			if (ids.length < 1) {
				return;
			}else{
			confirm('确定要删除选中的记录？', function() {
				$.ajax({
					type : "POST",
					url : "/sys/model/dels",
					data : JSON.stringify(ids),
					success : function(data) {
						if (data) {
							alert('操作成功', function(index) {
								vm.reload();
							});
						} else {
							alert(data.msg);
						}
					}
				});
			});
			}
		},
		
search : function() {
		
			var name=vm.q.name;
      $.ajax({
	            type : "POST",
	            url : "/sys/model/search",
	            contentType: "application/json;charset=UTF-8",
	            data : JSON.stringify(vm.q),
	            success : function(data) {
	                vm.list_modelList = data.list_modelList;
//	                vm.totalPage = data.totalPage;
            },
	           
	        });
	
		},
		
		toPage: function(page){	
			
			if(page<=1){
				page=1;
			}
			if(page>=vm.page.totalPage){
				page=vm.page.totalPage
			}
			vm.pagenum = page;
			vm.reload();		
		},
		
	
		saveOrupdate: function (event) {
			var url = vm.model.id == null ? "/sys/model/save" : "/sys/model/doupdate";

			$.get(url,vm.model, function(r){
				if(r.code == 0){
					alert('操作成功', function(){
						vm.reload();
						vm.showList = true;
//						console.log(r);
					});
				}
                else{
                	vm.showList = false;
                	
                }
			});
		},

		
		reload : function(event) {
			vm.showList = true;
			var params = {};
			params.name = this.q.name;//模糊查询
			 params.page = this.pagenum;
			 params.limit = this.page.pageSize;
//alert(params);
			$.get("/sys/model/list", params,function(r) {
				
				vm.list_modelList = r.page.list;
//				vm.list_colorList = r.list_colorList;
				 vm.page = r.page;
			});

		}
	}
});