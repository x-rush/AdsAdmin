$(function () {
    vm.query();
});


//为overflowlist测试JS  （html同）
//测试好用后复制到JS  
var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			overflownumber: ""
		},
		showList: true,
		title:null,
		
		user:{
			id:null,
			overflownumber:"",
			userid:"",
			remarks:""
		},
		
		list_OverFlowList:[],
		page:{
			totalCount:0,
			pageSize:10,
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
		
		back : function() {
			vm.showList = false;
		},
		
		//添加
		save: function(){
			
			var param={};
			param.overflownumber = this.user.overflownumber;
			param.remarks = this.user.remarks;
			param.userid = this.user.userid;
			$.get("/sys/overflowlist/save",param, function(data){
				if(data.code == 0){
					alert('操作成功', function(){	
					vm.reload();
					vm.showList = true;
					vm.user={			
							id:null,
							overflownumber:"",
							remarks:"",
							userid:""
					};
					});
				}
                else{
                	alert("添加失败");
                	vm.showList = false;
                }
			});
		},
		
		//选中修改信息
		update: function () {
			vm.showList = false;

			var ids = $("input[type='checkbox'][name='overFlowListIds']:checked");
			
			if( ids.length != 1 ){
				alert("请选中一条信息!");
				vm.showList = true;
				return ;
			}
			
			var param={};
			param.id = ids[0].value;
			
			$.get("/sys/overflowlist/update",param, function(data){
				if(data.code == 0){
					vm.user = data.entity;
				}
                else{
                	vm.showList = false;
                }
			});
		},
		
		//删除（目前为逻辑删除）
		del: function () {

			var id_value =[];//定义一个数组    
            $("input[name='overFlowListIds'][type='checkbox']:checked").each(function(){
            	//遍历每一个名字为overFlowListIds的复选框，其中选中的执行函数 
            	id_value.push($(this).val());//将选中的值添加到数组id_value中    
            });
            if(id_value.length < 1 ){
            	alert("请选择信息删除");
            }else{
            	confirm('确定要删除选中的记录？', function(){
              	  $.ajax({
        				type : "POST",
        				url : "/sys/overflowlist/delete",
        				contentType: "application/json;charset=UTF-8",
        				data : JSON.stringify(id_value),
        				success : function(data) {
        					if(data){
        						vm.reload();
        						alert("删除成功");
        					}else{
        						alert("删除失败");
        					}
        				},
        			});
                }); 
            }   	
		},
		
		//选中所有 尚未实现
//		all : function() {
		
//		},
		
		//保存或修改
		saveOrUpdate: function (event) {
			var url = vm.user.id == null ? "/sys/overflowlist/save" : "/sys/overflowlist/doupdate";
			$.get(url,vm.user, function(r){
				if(r.code == 0){
					alert('操作成功', function(){
						vm.user={			
								id:null,
								overflownumber:"",
								remarks:"",
								userid:""
						};
						vm.reload();
						vm.showList = true;
					});
				}
                else{
                	vm.showList = false;
                }
			});
		},
		
		//分页
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
		
		//查询列表
		reload : function() {
			
			vm.showList = true;
			var params = {};
			params.overflownumber = this.q.overflownumber;
			params.page = this.pagenum;
			params.limit = this.page.pageSize;
			$.get("/sys/overflowlist/list",params, function(data){
				
				vm.list_OverFlowList = data.page.list;			
				vm.page = data.page;
			});
		}
	}
});