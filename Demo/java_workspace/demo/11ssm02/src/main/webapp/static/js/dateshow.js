//dateshow.js
window.onload = function(){
	var show = document.getElementById("show");
	window.setInterval(function(){
		var time = new Date();
		var m = time.getMonth()+1;
		var t = time.getFullYear()+"-"+ m+"-"+time.getDate() + " "
				+time.getHours()+":"+time.getMinutes()+":"
				+time.getSeconds();
		show.innerHTML=t;
	},1000);
}