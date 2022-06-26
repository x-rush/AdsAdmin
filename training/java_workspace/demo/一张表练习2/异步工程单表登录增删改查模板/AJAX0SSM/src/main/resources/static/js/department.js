
$(function(){
	
	//Model	JSON数据		后台返回的参数
	var data ={
		list:[],			//显示表格,表中的集合
		dep:{},				//表单
		serachName:'',		//名字搜索
		currentPage:1,		//当前页数
		pageSize:5,			//每页的记录数
		pageCount:0,		//总页数
		totalCount:0,		//总记录数
		departmentNo:'',
		numID:[],			//序号
		a:[]
	};
	
	//ViewModel  
	var vm=new Vue({
		el:"#app",
		data:data,
		methods:{
			table:function(){
				
				axios.get('/d/table',{	//url
					params:{			//传进来的参数
						serachName:this.serachName,
						currentPage:this.currentPage,
						pageSize:this.pageSize
						
					}
				//回应成功调用
				}).then(function(res){	//res后台返回的数据
					
					vm.list = res.data.list;
					vm.totalCount=res.data.totalCount;
					vm.pageCount=res.data.pageCount;
					vm.currentPage=res.data.currentPage;
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
				vm.dep=u;
			},
			//删除方法
			del:function(a){
				axios.get("/d/delete",{
					params:{
						departmentNo:a
					}
					
				}).then(function(boo){
//					alert("true");
					vm.table();
				}).catch(function(err){
					alert("删除失败主键被占用")
					console.log("请求失败");
					console.log(err);
				});
			},
			
			//添加修改删除
			addAndUpdate:function(){
				axios.get('/d/addAndUpdate',{
					params:{
						//控制器		:	前端
						departmentName:vm.dep.departmentName,
						departmentNo:vm.dep.departmentNo
					}
				}).then(function(res){
					if(res){
						
//						alert("true");
						vm.dep={};
						vm.table();
					}else{
						alert("false");
						vm.table();
					}
					
				}).catch(function(err){
					console.log("请求失败");
					console.log(err);
				});
			},
			
			//根据序号删除				this.numID往控制器传参
			delSelect:function(){			
				axios.post('/d/delSelect',this.numID).then(function(res){
					vm.table();
				}).catch(function(err){
					console.log("请求失败");
					console.log(err);
				});
				
			},
			//全选
			selectAll:function(){
				if(vm.length(vm.numID) < vm.length(vm.list)){
					for(var v in vm.list){
						vm.numID[v] = vm.list[v].departmentNo;
					}
					vm.table();
				}else{
					vm.numID = [];
					vm.table();
				}
				
			},
			//全选
			length:function(o){
				var count  = 0;
				for(var a in o){
					count++;
				}
				return count;
			}
			,
			//全选如果取消一个就取消全选
			aa:function(){
				
				if(vm.length(vm.numID) != vm.length(vm.list)){
					vm.a = [];
					vm.table();
				}else{
					vm.a = [0];
					vm.table();
				}
			}
			
			
			
			
			
			
			
			
			
		}
		
	});
	
	
	//调用表格数据的方法
	
	vm.table();
	
	
});

