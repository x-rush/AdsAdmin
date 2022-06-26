	
		
//说明一:是jQuery框架固定模板
//说明二:是页面加载完成后出发的事件
//说明三:当浏览器加载完整个页面会就会调用整个方法
$(function(){

	//1.查询id是b01的按钮
	//2.添加单击事件,触发之后会调用方法
	$("#b01").click(function(){
		
		//1.$.ajax是jQuery框架发送异步请求的方法
		//2.url是控制器方法的访问路径	后台的地址
		//3.data是发送的数据
		//4.success是回调函数,服务器响应成功调用的方法
		//注意:当服务器端成功处理成功回应之后浏览器会自动调用success所绑定的方法
		//注意:浏览器会把后台发送回来的JSON数据通过参数传给我们调用
		$.ajax({
			url:"/a/login",
			data:"username="+$("#username").val()+"&password="+$("#password").val(),
					//name=			张三			password=			123
			
			success:function(boo){
//				alert("回调成功");
				if(boo){
					location.href="/page/index.html"
				}else{
					alert("登录失败,请重新登录")
				}
				
			}
		});
		
	});
	

	
})





