$(function () {
    vm.query();
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			username: null
		},
		showList: true,
		title:null,
		roleList:{},
		user:{
			username:"",
			password:"",
			email:"",
			mobile:"",
			status:1,
			roleIdList:[]
		},
		userlist:[],
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
			
			vm.roleList = {};
			vm.user = {status:1,roleIdList:[]};
			
			//获取角色信息
			this.getRoleList();
		},
		update: function () {
			
			var arr = $("input[name='userIds'][type='checkbox']:checked");
			
			// 只有长度是1的时候 才是合法的
			if(arr.length!=1){
				alert("请选择一条信息进行修改!");				
				return ;
			}
			
			var userId = arr[0].value;
			
			
			
			if(userId == null){
				return ;
			}
			
			vm.showList = false;
            vm.title = "修改";
			
			vm.getUser(userId);
			//获取角色信息
			this.getRoleList();
		},
		del: function () {
//			var userIds = getSelectedRows();
			// 找到 被选中的 checkbox 
			
			var arr = $("input[name='userIds'][type='checkbox']:checked");
			
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
				    url: "/sys/user/delete",
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
			var url = vm.user.userid == null ? "/sys/user/save" : "/sys/user/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.user),
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

		getUser: function(userId){
			var params = {};
			
			params.userid = userId;
			
			$.get("/sys/user/selectOne",params, function(r){
				vm.user = r.user;
			});
		},
		getRoleList: function(){
			$.get("../sys/role/select", function(r){
				vm.roleList = r.list;
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
			params.username = this.q.username;
			
			$.get("/sys/user/list",params, function(r){

				vm.userlist = r.page.list;
				vm.page = r.page;
			});
			
			
		}
	}
});