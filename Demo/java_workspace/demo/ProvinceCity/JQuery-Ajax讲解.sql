JQuery
	1.是什么	基于JavaScript 脚本语言 弱类型语言 库
	2.为什么要使用 	写起来，用起来 方便 
					浏览器兼容性好 
					
					
	$("#mydiv");
	
	$("#mydiv").hide();
	$("#mydiv").show();
	3.JQuery 版本 
		1.x	
		2.x
		3.x 
	4.常用方法 
		1)选择器
		2)取值/赋值 
			val(),	表单域 value属性的值
			text(),	任何标签/节点，内容/文本
			html(), 任何标签/节点，内容带有标签
			attr(),
			prop(),
		3)	remove(), 	移除
			empty(),	清空	
			获取父节点
			获取子节点
			获取第几个子节点
			追加
		4)循环
		
		var arr = $("div");
		
		for(var i=0;i<arr.length;i++){
			var temp = arr[i];
			alert(temp.value);
		}
		
		JQuery 循环 遍历 
		
		$.each(arr, function(index, value) {
		  console.log(index+' : '+value);
		});
		
		
		
		$("div").each(function(){
		  var self=$(this);
		  console.log(self.text());
		});
		
		5)树形结构	插件 扩展 
			
			Json -> Java端 List<?>  1:M 
			
			父子节点表 结构  
		
			菜单 导航 树形结构 	
		
		id		name				pid		plevel	
		1		家用电器			0		1
		2		电视				1		2
		3		空调				1		2
		4		智能电视			2		3
		5		OLED电视			2		3
		6		中央空调			3		3
		7		移动空调			3		3
		8		手机/运营商/数码	0		1
		
		
		省市区 
		
		
	
	
	var temp = new Array();
	
	弱类型语言  PHP 
	强类型语言	Java .NET 
	
	int age = 28;
	
	<input type="text" id="first" value="123">
	
	$("#first").val(); $("#first").val(""); 
	
	<div id="mydiv">
		今天<a href="#">下午</a>下大雨!
	</div>
	
	$("#mydiv").text(); $("#mydiv").text("不可能！");
	
	$("#mydiv").html(); $("#mydiv").html("来吧！");
	
	
	
	<img id="ad" src="/img/001.jpg" />
	
	var srcValue = $("#ad").attr("src"); 1.9-
	
	$("#ad").attr("src","/img/002.jpg");
	
	var srcValue = $("#ad").prop("src"); 1.9+	
	
	$("#ad").prop("src","/img/002.jpg");
	
	
	<div>
		<ul>
			<li>1</li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
		</ul>
	</div>
	
	
	$("div").remove();
	$("div").empty();
	
Ajax 
		
		异步
		
		不同步 
		
		1~10 
		
		第7行 耗时 10秒 
		
		使用Ajax  
			1.原生态JavaScript代码 
				多，兼容性不好，不容易理解
			2.第三方JQuery 
				$.ajax({
					type:
					url:
					data:
					success:function(result){
					
				
					}
				});















