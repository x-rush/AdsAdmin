$(function () {
    vm.query();
});

var vm = new Vue({
	el : '#rrapp',
	data : {
		q : {
			//商品名查询
			name : null, 
		},
		//显示退货单信息div
		showList: true,
		title:null,
		//退货单
		returnlist:{
			id:"",
			returndate:"",
			returnnumber:"",
			supplierid:"",
			amountpaid:"",
			remarks:"",
			addtime:""
		},
		//退货单商品
		returnlistgoods:{
		},
		//退货单信息
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
		//添加
		add: function(){
			
			vm.showList = false;
			vm.title = "新增";
		},
		//修改
		update: function () {
			var arr = $("input[name='ids'][type='checkbox']:checked");
			var ids = new Array();
			// 只有长度是1的时候 才是合法的
			if(arr.length!=1){
				alert("请选择一条信息进行修改!");				
				return ;
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
				    url: "/sys/returnlist/delete",
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
		saveOrUpdate: function (event) {
			
			var url = vm.returnlist.id == "" ? "/sys/returnlist/save" : "/sys/returnlist/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.returnlist),
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
		getEntity: function(id){
			
			var params = {};
			params.id = id;
			
			$.get("/sys/returnlist/selectOne",params, function(r){
				vm.entitylist = r.returnlist;
				
				
			});
		},
		//设置分页
		toPage: function(page){
			if(page<1){
				page=1;
			}
			if(page>this.page.totalPage){
				page = this.page.totalPage;
			}
			this.pagenum = page;
			
		},
		//加载页面信息
		reload: function (event) {
			vm.showList = true;
			var params = {};
			params.page = this.pagenum;
			params.limit = this.page.pageSize;
			params.title = this.q.title;
			
			
			$.get("/sys/returnlist/list",params, function(r){
				
				vm.entitylist = r.page.list;
				vm.page = r.page;
			});
		},
//		returnlistclear:function(){
//			vm.returnlist.id = "";
//			vm.returnlist.returndate="";
//			vm.returnlist.returnnumber="";
//			vm.returnlist.supplierid="";
//			vm.returnlist.amountpaid="";
//			vm.returnlist.remarks="";
//			
//		},
//		//单号模糊查询限定条件
//		checkNumber:function(){
//			var re = /^[0-9A-Za-z]*$/;
//			var number = $("#returnnumber").val();
//			if(!re.test(number)){
//				alert("不能输入汉字。");
//				
//			} 
//			
//		}
		
	}
});