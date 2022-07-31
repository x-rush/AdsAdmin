/**
 * 
 */



$(document).ready(function() {

	vm.reload();

});

var vm = new Vue({
	el : '#app',
	data : {
		message : 'Hello Vue.js!',
		list_product : [],
		showList:true,
		totalPage : 0,
// name:"",
// price:"",
// num:""
		product:{
			name:"",
			price:"",
			num:""
		},
		q:{
			name:"",
			price_s:"",
			price_e:"",
			currPage : 1
		}
		
	},
	methods : {
		details : function() {
			return " - 学的不仅是技术，更是梦想！";
		},
		add : function() {
			vm.showList = false;
			
		},
		back : function() {
			vm.showList = true;
			
			
		},
		save : function() {
			vm.showList = true;
			// 获取数据

// alert(this.product.name);
// alert(this.product.price);
// alert(this.product.num);

			var name = this.product.name;
			var price = this.product.price;
			var num = this.product.num;
			
			
			$.ajax({
	            type : "POST",
	            url : "/product/save",
	            data : {
	            	name:name,
	            	price:price,
	            	num:num
	            	},
	            success : function(data) {
	                if(data.code == 0){
	                	vm.reload();
	                }
	                else{
	                	alert("添加失败");
	                }
	            },
	           
	        });
			
		},
		// 切换至 修改div
		update : function() {
			
			// 只能选中一条记录
			
			var ids = $("input[type='checkbox'][name='ids']:checked");
			
			if( ids.length != 1 ){
				alert("请选中一条信息!");
				return;
			}
			
			var id = ids[0].value;
			
// vm.product = {.........}
			
			$.ajax({
	            type : "POST",
	            url : "/product/getOne",
	            data : {id:id},
	            success : function(data) {
	                if(data.code == 0){
	                	
	                	vm.product = data.product;
	                	
	                	
	                }
	                else{
	                	alert("删除失败");
	                }
	            },
	           
	        });
			
			vm.showList = false;
			
			
		},
		// 切换至 修改div
		doupdate : function() {
			
			
			
			var name = this.product.name;
			var price = this.product.price;
			var num = this.product.num;
			
			$.ajax({
	            type : "POST",
	            url : "/product/doupdate",
	            data : {
	            	name:name,
	            	price:price,
	            	num:num
	            	},
	            success : function(data) {
	                if(data.code == 0){
	                	vm.reload();
	                }
	                else{
	                	alert("修改失败");
	                }
	            },
	           
	        });
			
			
		},
		
		
		del : function(id) {
			// alert(id);
			// 删除 id
			
			$.ajax({
	            type : "POST",
	            url : "/product/del",
	            data : {id:id},
	            success : function(data) {
	                if(data.code == 0){
	                	vm.reload();
	                }
	                else{
	                	alert("删除失败");
	                }
	            },
	           
	        });
			
			
		},
		dels : function() {
			
			// 获取选中的checkbox
			
			var ids = $("input[type='checkbox'][name='ids']:checked");
			
			var arr = new Array();
			
			// JQuery for
			$.each(ids,function(index,obj){
				var id = obj.value;
				arr.push(id);
			});
			
			
			$.ajax({
	            type : "POST",
	            url : "/product/dels",
	            data : {"ids":arr},
	            traditional:true,
	            success : function(data) {
	                if(data.code == 0){
	                	vm.reload();
	                }
	                else{
	                	alert("删除失败");
	                }
	            },
	           
	        });
			
			
		},
		
		all : function() {
			
			// 获取选中的checkbox JQuery 1.11
			
			var check = $("#all").prop("checked");
			
			if(check==true){
				$("input[type='checkbox'][name='ids']").prop("checked",true);
			}
			else{
				$("input[type='checkbox'][name='ids']").prop("checked",false);
			}
			
			
			
		},
		
		search : function(currPage) {
			
			// 获取参数 JSON.stringify(list)
			
			// JQuery方式
			// var s_name = $("#s_name").val();
			
//			var s_name = vm.q.name;
//			var price_s = vm.q.price_s;
//			var price_e = vm.q.price_e;
//			var currPage = vm.currPage;
			
			vm.q.currPage = currPage;
			
			
			$.ajax({
	            type : "POST",
	            url : "/product/search",
	            contentType: "application/json;charset=UTF-8",
	            data : JSON.stringify(vm.q),
	            success : function(data) {
	                vm.list_product = data.list_product;
	                vm.totalPage = data.totalPage;
            },
	           
	        });
	
		},
		
		page : function(currPage) {
			
			vm.search(currPage);
			
	
		},
		
		reload : function() {
			// 使用vue自带的请求方式
			
			// Jquery发送请求的方式 $.ajax $.post $.get
			
			$.ajax({
	            // 请求方式
	            type : "POST",
	            // 请求的媒体类型
// contentType: "application/json;charset=UTF-8",
	            // 请求地址
	            url : "/product/show",
	            // 数据，json字符串
// data : JSON.stringify(list),
	            // 请求成功
	            success : function(data) {
// alert(data.list_product);
	                vm.list_product = data.list_product;
// alert(vm.list_product);
	            },
	           
	        });
		}
	}
	
})






