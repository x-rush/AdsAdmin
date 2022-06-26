var prjName="/ProvinceCity/";
var ajaxObj;

function createAjaxObject(){
	try{return new ActiveXObject("Msxml2.XMLHTTP");}catch(e){};
	try{return new ActiveXObject("Microsoft.XMLHTTP");}catch(e){};
	try{return new XMLHttpRequest();}catch(e){};
	alert("XmlHttpRequest not supported!");
	return null;
}

function $(id){
     return document.getElementById(id);
}


