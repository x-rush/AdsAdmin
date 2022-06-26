$(document).ready(function(){
	vm.reload();
});
/*$(function () {
	vm.showAll();
});*/

var vm=new Vue({
	el:'#GoodsCheck',
	data:{
		information:[],
		showList:true,
		typeList:['是','否'],
		page:{
			pageCount:'',/*每页显示的信息条数*/
			pageNumber:'',/*当前页码*/
			pageTotalNumber:'',/*总页码*/
			totalCount:''/*总记录数*/
		},
		goodsCheck:{
			id:'',
			checknumber:'',
			stocknum:'',
			result:'',
			checknum:'',
			userid:'',
			memo:''
			
		},
		searchs:{
			checknumber:''
		},
		
	},
	methods:{
		/*返回主列表*/
		cancel:function(){
			$("input[type='checkbox'][name='choose']:checked").prop('checked',false);
			vm.showList=true;
			vm.cleanGoodsCheck();
//			vm.goodsCheck="";这种方法会清除对象的所有属性
		},
		
		/*添加数据*/
		add:function(){
			vm.showList=false;
			
		},
		
		/*条件搜索*/
		search:function(){
			console.log(vm.searchs);
			var checknumber=vm.searchs.checknumber
			console.log(checknumber);
			$.ajax({
				url:"/GoodsCheck/search",
				type:"post",
				data:JSON.stringify(vm.searchs),
				success:function(data){
					if(data.code==1){
//						console.log(data.list);
						vm.information=data.list;
					}else{
						alert("加载异常");
					}
				}
				
			});
		},
		
		/*选择所有数据*/
		chooseAll:function(){
			var chosen=$("#chooseAll").prop('checked');
			if(chosen){
				var ids=$("input[type='checkbox'][name='choose']").prop('checked',true);
			}else{
				var ids=$("input[type='checkbox'][name='choose']").prop('checked',false);
			}
			vm.del();
		},
		
		/*删除数据*/
		del:function(){
			var chosen=$("input[type='checkbox'][name='choose']:checked");
			if(chosen.length<=0){
				alert("请选择要删除的数据");
			}
			var arr=new Array();
			$.each(chosen,function(index,obj){
				var id=obj.value;
				arr.push(id);
				console.log(arr[index]);
			})
			confirm("确认要删除选中数据？",function(){
				$.ajax({
					url:"/GoodsCheck/delete",
					type:"post",
//					data:{"ids":arr},
					data:JSON.stringify(arr),
//					traditional:true,
					success:function(data){
						if(data.code==1){
							alert("操作成功",function(){
								vm.showAll();
//								vm.showAllByPage(1);
								$("input[type='checkbox'][name='choose']:checked").prop('checked',false);
							});
							
						}else{
							alert("序号为"+data.index+"删除失败");
						}
					}
				});
			});
			
			
			
			
//			$.post("/GoodsCheck/delete",{"ids":arr},true,function(data){
//				if(data.code==1){
//					vm.showAll();
////					vm.showAllByPage(1);
//				}else{
//					alert("删除失败");
//				}
//			});
			
		},
		
		/*修改数据*/
		update:function(){
			
//			var chosen=$("input[type='checkbox']:checked").val();
			var chosen=$("input[type='checkbox'][name='choose']:checked");
			
			var num=chosen.length;
			
			if(num!=1){
				alert("请选择一条信息");
				return;
			}
			var id=chosen[0].value;
			console.log(id);
			vm.showList=false;
			$.get("/GoodsCheck/update",{id,id}, function(data){
				if(data.code==1){
					vm.goodsCheck=data.record;
				}else{
					alert("加载异常");
					vm.showList=true;
				}
				
			});
			
		},
		
		/*保存数据*/
		save:function(){
			console.log(vm.goodsCheck);
			$.ajax({
				url:"/GoodsCheck/save",
				type:"post",
				data:JSON.stringify(vm.goodsCheck),
				success:function(data){
					if(data.code==1){
						vm.showList=true;
						$("input[type='checkbox'][name='choose']:checked").prop('checked',false);
						vm.showAllByPage(1);
//						vm.reload();
//						$.each(vm.goodsCheck,function(index,obj){
//							vm.goodsCheck.
//						});
						
						vm.cleanGoodsCheck();
						
						console.log(vm.goodsCheck);
//						vm.goodsCheck="";
					}else{
						alert("您输入的数据有误，请重新输入");
//						vm.goodsCheck="";
					}
				}
			});
		},
		
		/*获取总页数*/
		getTotalPageNumber:function(pageCount){
			vm.page.pageCount=pageCount;
			var pageCount= vm.page.pageCount;
//			console.log(pageCount);
			$.ajax({
				type:"post",
//				url:"/GoodsCheck/getTotalPageNumber?pageCount="+pageCount,
				url:"/GoodsCheck/getTotalPageNumber",
				data:{pageCount:pageCount},
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					if(data.code==1){
						vm.page.pageTotalNumber=data.pageTotalNumber;
						vm.page.totalCount=data.totalNumber;
//						console.log(vm.page.pageTotalNumber);
					}else{
						alert("加载异常");
					}
				}
			});
		},
		
		/*跳转到指定页码*/
		toPage:function(pageNumber){
//			vm.page.pageNumber=pageNumber;
			
			if(pageNumber<=0){
				alert("对不起，没有当前页码");
				vm.page.pageNumber=pageNumber+1;
			}else if(pageNumber>vm.page.pageTotalNumber){
				alert("对不起，没有当前页码");
				vm.page.pageNumber=pageNumber-1;
			}else{
				vm.showAllByPage(pageNumber);
			}
			
		},
		
		/*分页查询所有*/
		showAllByPage:function(pageNumber){
			vm.page.pageNumber=pageNumber;
			var page={pageNumber:vm.page.pageNumber,pageCount:vm.page.pageCount};
			$.ajax({
				url:"/GoodsCheck/showAllByPage",
				type:"post",
				data:JSON.stringify(page),
				success:function(data){
					if(data.code==1){
						vm.information=data.list;
					}else{
						alert("加载异常");
					}
				}
			});
		},
		
		/*查询所有--展示页面*/
		showAll:function(){
			$.ajax({
				url:'/GoodsCheck/showAll',
				type:'post',
				success:function(data){
					if(data.code==1){
						vm.information=data.list;
//						console.log(vm.information);
					}else{
						alert("查询异常");
					}
				}
			});
		},
		
		/*清空goodsCheck对象属性值*/
		cleanGoodsCheck:function(){
			for(var i in vm.goodsCheck ){
				vm.goodsCheck[i]="";
			}
		},
		
		/*重新加载*/
		reload:function(){
//			vm.showAll();
			vm.getTotalPageNumber(10);
			vm.showAllByPage(1);
		}
		
		
	}
	
	
	
});











