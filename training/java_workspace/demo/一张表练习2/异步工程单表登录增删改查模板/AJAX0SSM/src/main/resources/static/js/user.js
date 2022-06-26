
$(function(){
	
	//Model
	var data ={
		list:[],			//显示表格,表中的集合
		user:{},			//表单
		serachName:'',		//名字搜索
		currentPage:1,		//当前页数
		pageSize:5,			//每页的记录数
		pageCount:0,		//总页数
		totalCount:0		//总记录数
			
	};
	
	//ViewModel  
	var vm=new Vue({
		el:"#app",
		data:data,
		methods:{
			table:function(){
				
				axios.get('/a/table',{	//url				找控制器同时传三个参数过去
					params:{			//get请求传参
						//后台参数		//前端的参数
						serachName:this.serachName,		//名字搜索
						currentPage:this.currentPage,	//当前页数
						pageSize:this.pageSize			//每页的记录数
						
					}
				//服务器端回应成功调用
				}).then(function(res){	//res后台返回的数据(return map中的数据)
					//model数据	=	后台的数据
					vm.list = res.data.list;				//显示表格,表中的集合
					vm.totalCount=res.data.totalCount;		//总记录数
					vm.pageCount=res.data.pageCount;		//总页数
					vm.currentPage=res.data.currentPage;	//当前页数
					//后台的回调函数
					//后台给的回应(返回的集合存到Vue中因为Vue和html页面是双向绑定所以页面数据改变
				}).catch(function(err){
					console.log("请求失败");
					console.log(err);
				});
				
			},
			pageChange:function(page){
				vm.currentPage = page;
				vm.table();
			},
			edit:function(u){
				vm.user=u;
			},
			//删除一条
			del:function(username){
//				alert(username)
				axios.get("/a/delete",{
					params:{
						username:username
						
					}
					
				}).then(function(boo){
					alert("删除成功");
					vm.table();
				}).catch(function(err){
					console.log("请求失败");
					console.log(err);
				});
			},
			
			
			
			//添加和修改
			addAndUpdate:function(){
				axios.get('/a/addAndUpdate',{
					params:{
						username:vm.user.username,
						password:vm.user.password
					}
				}).then(function(res){
					if(res){
						
						alert("添加成功");
						vm.user={};
						vm.table();
					}else{
						
						alert("添加失败");
						vm.table();
					}
					
					
				}).catch(function(err){
					console.log("请求失败");
					console.log(err);
				});
			}
			
		}
		
	});
	
	
	//调用表格数据的方法
	
	vm.table();
	
	
});

