function ajax(url, fnSucc, fnFaild)
{
	//1.创建Ajax对象
	if(window.XMLHttpRequest)
	{
		var oAjax=new XMLHttpRequest();
	}
	else
	{
		var oAjax=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	//2.连接服务器（打开和服务器的连接）
	oAjax.open('GET', url, true);
	
	
	//3.发送请求
	oAjax.send();
	
	//4.接收返回值
	oAjax.onreadystatechange=function ()//服务器之间有交互时候触发的事件
	{
		if(oAjax.readyState==4)  //浏览器和服务器交换到哪一步01234
		{
			if(oAjax.status==200)//只有200代表成功
			{
				//alert('成功了：'+oAjax.responseText);
				fnSucc(oAjax.responseText);
			}
			else
			{
				//alert('失败了');
				if(fnFaild)
				{
					fnFaild();
				}
			}
		}
	};
}