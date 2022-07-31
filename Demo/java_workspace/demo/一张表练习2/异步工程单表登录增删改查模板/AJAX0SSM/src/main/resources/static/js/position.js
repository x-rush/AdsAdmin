
$(function(){
	
	//Model	JSON数据
	var data ={
		list:[],			//显示表格,表中的集合
		pos:{},				//表单
		
		list_dep:[],		//
		dep:{},				//部门的集合
	
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
				
				axios.get('/p/table',{	//url
					params:{			//传进来的参数
						positionName:vm.positionName,
						baseSalary:vm.baseSalary,
						pageSize:this.pageSize
						
					}
				//回应成功调用
				}).then(function(res){	//res后台返回的数据
					vm.list_dep = res.data.list_dep;
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
			}
			
			,
			//删除方法
			del:function(a){
				alert(a);
				axios.get("/p/delete",{
					params:{
						positionId:a
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
				axios.get('/p/addAndUpdate',{
					params:{
						//控制器		:	前端
						positionName:vm.pos.positionName,
						baseSalary:vm.pos.baseSalary,
						departmentName:vm.pos.department
					}
				}).then(function(res){
					if(res){
						
//						alert("true");
						vm.pos={};
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
			
			//根据序号删除	this.numID往控制器传参
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

