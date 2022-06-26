var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			username: null
		},
		xAxisType:'category',
		xAxisData:[],
		seriesData:[],
		seriesType:'line',
		title:null,
		roleList:{},
		user:{
			status:1,
			roleIdList:[]
		}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		saveOrUpdate: function (event) {
			var url = vm.user.userId == null ? "../sys/user/save" : "../sys/user/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.user),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		
		select: function(){
			var url = "/sys/echarts/select";
			$.ajax({
				type: "POST",
			    url: url,
//			    data: JSON.stringify(vm.user),
			    success: function(data){
			    	if(data.code === 0){
						
						vm.xAxisData = data.xAxisData;
						vm.seriesData = data.seriesData;
						loadChart();
					}else{
						alert(r.msg);
					}
				}
			});
		},
		reload: function (event) {
			$.post("../sys/echarts/select", function(r){
				vm.roleList = r.list;
			});
		}
	}
});

$(function () {
	vm.select();
});



function loadChart(){
	
	var myChart = echarts.init(document.getElementById('main'));
	
		option = {
		    xAxis: {
		        type: 'category',
		        data: vm.xAxisData
		        //['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [{
		        data: vm.seriesData,
		        //[820, 932, 901, 934, 1290, 1330, 1320],
		        type: vm.seriesType
		    }]
		};
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
	
	
}

