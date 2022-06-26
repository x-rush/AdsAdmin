<%@ page contentType="text/html; charset=UTF-8"%>
<%@page language="java" import="com.heyang.domain.Area"%>
<%@page language="java" import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>二级联动示例页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" rev="stylesheet" href="web/css/style.css" type="text/css" />
<script src="web/js/formchecker.js" type="text/javascript"></script>
<script src="web/js/ajax.js" type="text/javascript"></script>
</head>

<body>
	<div id="bodyDiv">
		<div id="header">
			<jsp:include page="/web/page/branch/header.jsp"/>
		</div>
		<div id="content">
			<form action="Login" onsubmit="return false;">
			<table class="holder" cellspacing="0">
				<caption><font face=webdings color="#ff8c00">8</font>&nbsp;<font color="#333333">用户登录</font></caption>
			   		<tbody> 
			   		 <tr>
			            <td width="120" align="right">用户名:</td>
			            <td align="left">
			            	<input type="text" name="username"/>
			            	<span id="nameMsg" class="feedbackHide">用户名必须输入两到三位汉字</span>
			            </td>
			          </tr>
			          
			   		  <tr>
			            <td width="120" align="right">省（直辖市）:</td>
			            <td align="left">
			            	<select name="provinces" id="provinces" size="1" onchange="changeProvince()">
			            		<% 
			            			List<Area> provinces=(List<Area>)request.getAttribute("provinces");
			            			
			            			for(Area province:provinces){
			            				out.print("<option value='");
			            				out.print(province.getId());			            				
			            				out.print("'>");
			            				out.print(province.getName());		
			            				out.print("</option>");
			            			}
			            		%>
			            	</select>
			            </td>
			          </tr>
			   		  <tr>
			            <td width="120" align="right">市（区）:</td>
			            <td align="left">
			            	<select name="cities" size="1" id="cities">
			            		<% 
			            			List<Area> cities=(List<Area>)request.getAttribute("cities");
			            			
			            			for(Area city:cities){
			            				out.print("<option value='");
			            				out.print(city.getId());			            				
			            				out.print("'>");
			            				out.print(city.getName());		
			            				out.print("</option>");
			            			}
			            		%>
			            	</select>
			            </td>
			          </tr>
			          
			          <tr>
			            <td width="120" align="right"></td>
			            <td><input type="submit" value="提交"/></td>
			          </tr>
			     </tbody> 
			</table>
			</form>
		</div>		
	</div>
	<div id="footer">
		<jsp:include page="/web/page/branch/footer.jsp"/>
	</div>
</body>
</html>

<script LANGUAGE="JavaScript">

/*
var test = $("provinces");
alert(test);
*/
// ajax 异步 同步 
function changeProvince(){
	// 交由XMLHttpRequest和后台进行异步通信
	ajaxObj=createAjaxObject();	
	var url=prjName+"GetCities?pid="+$("provinces").value;	
//  	alert("==>>"+url+"<<==");
	ajaxObj.open("Get",url,true);
	// 回调函数
	ajaxObj.onreadyStateChange=changeProvinceCallBack;
	ajaxObj.send(null);	
	
}

function changeProvinceCallBack(){
// 	alert(ajaxObj.readyState);
	if(ajaxObj.readyState==4){
//  		alert(ajaxObj.status);
		if(ajaxObj.status==200){
			var status=ajaxObj.responseXML.getElementsByTagName("status")[0].firstChild.data;
			alert(status);
			if(status=="ok"){	
				// 返回正确信息
				alert("调用成功!");
				// 清除原有数据
				var listBox=$("cities");
				//alert(listBox);
				for(var i=listBox.options.length-1;i>=0;i--){
					listBox.remove(i);
				}
				
				// 找到所有area节点放入数组
				var arr=ajaxObj.responseXML.getElementsByTagName("area");
				
				// 遍历这个数组
				for(var i=0;i<arr.length;i++){
					// 找到每个area
				    var areaNode=arr[i];
				    
				    // Get id && name
					var id=areaNode.getElementsByTagName("id")[0].firstChild.data;
					var name=areaNode.getElementsByTagName("name")[0].firstChild.data;
	
					// Create optionCtrl
					var optionCtrl=document.createElement("option");
					optionCtrl.setAttribute("value",id);
					optionCtrl.appendChild(document.createTextNode(name));
					
					// Refresh listBox
					listBox.appendChild(optionCtrl);	
				}
			}
			else{
				// 返回错误信息
				var text=ajaxObj.responseXML.getElementsByTagName("text")[0].firstChild.data;
				$("ajaxRunMsg").innerHTML=text;
				$("ajaxRuningDiv").className="showMe";
			}			
		}
	}
}

</script>