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
		
		q_customerreturnnumber:"",
		
		customerReturn:{
			amountpaid:"", //应付金额
			amountpayable:"",	//实付金额
	//		customerreturndate:"",	//前台插入日期 & 注册时间   俩时间貌似相同，需要sql取值
			customerreturnnumber:"",	//客户退货单
			remarks:"", //备注
			state:"", //是否支付
			customerid:"",	//关联客户id
			userid:"", //关联用户id
	//		addtime:"", //注册时间
			delflag:"", //逻辑删除
			id:null,
			roleIdList:[],
		},
		
		
		
		returnlist:[],
		
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
			
		//	vm.clear();
			
			vm.showList = false;
			vm.title = "新增";
			
			vm.roleList = {};
			vm.user = {status:1,roleIdList:[]};
			
			//获取角色信息
			this.getRoleList();
		},
		
		
		search : function(currPage) {
//			window.alert(time1);
			vm.q.currPage = currPage;
			
			var aa = vm.q_customerreturnnumber;
			
		//	alert(aa);
			
			
			var params = {"customerreturnnumber":aa};
			alert(params.customerreturnnumber);

				
			$.get("/sys/CustomerReturnList/search",params, function(r){
				
				vm.returnlist = r.list_product;
			});
			
			
				
				
				
					
					
			
			/*$.ajax({
				type : "post",
				url : "/sys/CustomerReturnList/search",
		//		contentType : "application/json;charset=UTF-8",
		//		data : JSON.stringify(vm.q),
				
				data:{ q_customerreturnnumber:aa },
				 
				success : function(data) {
					vm.returnlist = data.list_product;
		//			vm.totalPage = data.totalPage;
				},

			});*/
			
			
		},
		
		
		update: function () {
			
			var arr = $("input[name='id'][type='checkbox']:checked");
			
			// 只有长度是1的时候 才是合法的
			if(arr.length!=1){
				alert("请选择一条信息进行修改!");				
				return ;
			}
			
			var id = arr[0].value;
			
			var a=id;
		//	alert(a+" 当你看到这条说明a取值");
			
			
		//	vm.showList = true;
			var params = {"id":id};
			
		//	params.id = id;
			
			alert(params.id+"   222");
			
			$.get("/sys/CustomerReturnList/getOne",params, function(r){

				vm.customerReturn = r.list_product;
		//		vm.page = r.page;
			});
			
			
			
			/*$.ajax({
				type : "post",
				url : "/sys/CustomerReturnList/getOne",
				data : {
					id : id
				},
				success : function(data) {
					if (data.code == 0) {
						vm.customerReturn = data.customerReturn;
					} else {
					//	alert(a);
						alert(a+"更新失败！");
					}
				}
			});*/
			
			
			vm.showList = false;
            vm.title = "修改";
			
			vm.getUser(id);
			//获取角色信息
			this.getRoleList();
		},
		
		del: function () {
//			var userIds = getSelectedRows();
			// 找到 被选中的 checkbox 
			
			var arr = $("input[name='id'][type='checkbox']:checked");
			
			var ids = new Array();
			
			$.each(arr,function(index,obj){
//				alert(obj["value"]);
				var id = obj["value"];
				ids[index] = id;
			});
			

			if(ids.length<1){
				return ;
			}
			
			
			/*$.confirm({
				title:'Confirm!',
				content:"去人删除嘛嘛嘛",
				confirm:function(){
					$.alert('确认');
				},
				cancel:function(){
					$.alert('删除');
				}
			});
			*/
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "/sys/CustomerReturnList/delete",
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
			
	//		alert(vm.customerReturn.id);
			
			var url = vm.customerReturn.id == null ? "/sys/CustomerReturnList/save" : "/sys/CustomerReturnList/update";
			
			
			
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.customerReturn),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						console.log("哈哈，你又错了！");
						alert(r.msg);
					}
				}
			});
		},

		getUser: function(userId){
			var params = {};
			
			params.userId = userId;
			
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
			
			$.get("/sys/CustomerReturnList/list",params, function(r){
				vm.returnlist = r.list_product;
		//		vm.page = r.page;
			});
		},
		
		
		/*reload : function() {
			// 使用vue自带的请求方式

			// Jquery发送请求的方式 $.ajax $.post $.get

			$.ajax({
				// 请求方式
				type : "POST",
				// 请求的媒体类型
				// contentType: "application/json;charset=UTF-8",
				// 请求地址
				url : "/sys/CustomerReturnList/list",
				// 数据，json字符串
				// data : JSON.stringify(list),
				// 请求成功
				success : function(data) {
					// alert(data.list_product);
			//		vm.list_product = data.list_product;
					
			//		alert(data.list_product);
					vm.returnlist = data.list_product;
					// alert(vm.list_product);

					

				},

			});

		},*/
		
		
		clear: function () {
			amountpaid="";
			amountpayable="";
			customerreturnnumber="";
			remarks="";
			state=""; 
			customerid="";
			userid="";
			delflag="";
		}
		
		
		
		
		
	}
});













