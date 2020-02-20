<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="head.jsp"%>
    <%@ include file="Avg.jsp"%>
</head>

<body class="theme-green">
<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="preloader">
            <div class="spinner-layer pl-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
        <p>Please wait...</p>
    </div>
</div>
<!-- #END# Page Loader -->
<!-- Overlay For Sidebars -->
<div class="overlay"></div>
<!-- #END# Overlay For Sidebars -->

 <%@ include file="topBar.jsp"%>
 <%@ include file="menu.jsp"%><section class="content">
    <div class="container-fluid">
        <div class="block-header">
            <h2>C区土壤元素含量平均数值--点击查看处理策略</h2>
        </div>

         <%@ include file="threeTab.jsp"%><!-- CPU Usage -->
        <div class="row clearfix">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="card">
                    <div class="header">
                        <div class="row clearfix">
                            <div class="col-xs-12 col-sm-6">
                                <h2>C区土壤元素含量表</h2>
                            </div>

                        </div>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"
                                   role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="javascript:location.reload();">刷新</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                   <div class="body" style="">
                        <div id="container" class="dashboard-flot-chart" style="height: 450px;width: 100%"></div>
                    </div>
                    <script type="text/javascript">
                        var dom = document.getElementById("container");
                        var myChart = echarts.init(dom);
                        var app = {};
                        option = null;
                        option = {
                            title : {
                                text: 'C区 : 土壤水-盐-氮含量'
                            },
                            tooltip : {
                                trigger: 'axis'
                            },
                            legend: {
                                data:['水分','盐分','N含量']
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    dataView : {show: true, readOnly: false},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            calculable : true,
                            xAxis : [
                                {
                                    type : 'category',
                                    axisTick: {
                                        alignWithLabel: true
                                    }
                                }
                            ],
                            yAxis : [
                                {
                                    type: 'value',
                                    name: '水分',
                                    min: 0,
                                    max: 30,
                                    position: 'left',
                                    offset: 72,
                                    interval: 5,
                                    axisLabel: {
                                        formatter: '{value} %'
                                    }
                                },
                                {
                                    type: 'value',
                                    name: '盐分',
                                    min: 0,
                                    max: 10,
                                    position: 'left',
                                    interval: 2,
                                    axisLabel: {
                                        formatter: '{value} mS/cm'
                                    }
                                },
                                {
                                    type: 'value',
                                    name: 'N含量',
                                    min: 0,
                                    max: 300,
                                    interval: 50,
                                    position: 'right',


                                    axisLabel: {
                                        formatter: '{value} mg/kg'
                                    }
                                },
                            ],
                            series : [
                                {
                                    name:'水分',
                                    type:'bar',
                                    markPoint : {
                                        data : [
                                            {type : 'max', name: '最大值'},
                                            {type : 'min', name: '最小值'}
                                        ]
                                    },
                                    markLine : {
                                        data : [
                                            {type : 'average', name: '平均值'}
                                        ]
                                    }
                                },
                                {
                                    name:'盐分',
                                    type:'bar',
                                    yAxisIndex:1,
                                    markPoint : {
                                        data : [
                                            {name : 'max', type:'max'},
                                            {name : 'min', type:'min'}
                                        ]
                                    },
                                    markLine : {
                                        data : [
                                            {type : 'average', name : '平均值'}
                                        ]
                                    }
                                },
                                {
                                    name:'N含量',
                                    type:'bar',
                                    yAxisIndex:2,
                                    markPoint : {
                                        data : [
                                            {name : 'max', type:'max'},
                                            {name : 'min', type:'min'}
                                        ]
                                    },
                                    markLine : {
                                        data : [
                                            {type : 'average', name : '平均值'}
                                        ]
                                    }
                                }
                            ]
                        };

                        if (option && typeof option === "object") {
                            myChart.setOption(option, true);
                        }

                        myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画
                        areaName = [];     //类别数组（实际用来盛放X轴坐标值）
                        nums = [];       //水分数组（实际用来盛放Y坐标值）
                        waterElement=[];
                        nElement=[];
                        saltElement=[];
                        pointId=[];
                        $.getJSON('http://148.70.138.222:8080/SpringMVC_Mybatis_Annotation/AreaElement/getData?areaName=C',function(data){
                            console.log(data);
                            //请求成功时执行该函数内容，result即为服务器返回的json对象

                            for (var i=0;i<data.length;i++){
                                areaName.push(data[i].areaName+"号点");
                                waterElement.push(data[i].waterElement);
                                nElement.push(data[i].nElement);
                                saltElement.push(data[i].saltElement);
                                pointId.push(data[i].pointId)
                            }

                            myChart.hideLoading(); //隐藏加载动画
                            myChart.setOption({ //加载数据图表
                                xAxis : {
                                    data : pointId
                                },
                                series: [{
                                    name: '水含量', // 根据名字对应到相应的系列
                                    data: waterElement
                                },{
                                    name: '盐分',
                                    data: saltElement
                                },
                                    {
                                        name: '氮含量',
                                        data: nElement
                                    }]
                            });
                        });
                        window.onresize = function() {
                            myChart.resize();
                        };

                        function show(i){
                            var less="";
                            var many="";
                            var good="";
                            if(i==1){
                                for (var j=0;j<8;++j){
                                    if (nElement[j] <= 140){
                                        less = less + pointId[j]+"号点, ";
                                    }else if (nElement[j] >=225){
                                        many = many + pointId[j]+"号点, ";
                                    }else {
                                        good = good + pointId[j]+"号点, ";
                                    }
                                }
                                layer.open({
                                    type: 1,
                                    title: ['氮含量的正常范围： 140-225 mg/kg'],
                                    area: ['600px', '360px'],
                                    shadeClose: true, //点击遮罩关闭
                                    content: '\<\div style="padding:20px;"> '+areaName[0]+'地区'+good+'氮含量正常'+'<br/>地区'+many+'氮含量过多！请及时进行处理！'+'<br/>地区'+less+'氮含量缺失！请及时进行补充！\<\/div>',
                                    closeBtn: 1,
                                    Number: 30000
                                });
                            }else if(i ==2){
                                for (var j=0;j<8;++j){
                                    if (saltElement[j] <= 1){
                                        less = less + pointId[j]+"号点, ";
                                    }else if (saltElement[j] >=4){
                                        many = many + pointId[j]+"号点, ";
                                    }else {
                                        good = good + pointId[j]+"号点, ";
                                    }
                                }
                                layer.open({
                                    type: 1,
                                    title: ['盐含量的正常范围： 1-4 mS/cm'],
                                    area: ['600px', '360px'],
                                    shadeClose: true, //点击遮罩关闭
                                    content: '\<\div style="padding:20px;"> '+areaName[0]+'地区'+good+'盐含量正常'+'<br/>地区'+many+'盐含量过多！请及时进行处理！'+'<br/>地区'+less+'盐含量缺失！请及时进行补充！\<\/div>',
                                    closeBtn: 1,
                                    Number: 30000
                                });
                            }else if(i ==3){
                                for (var j=0; j<8; ++j){
                                    if (waterElement[j] <= 15.5){
                                        less = less + pointId[j]+"号点, ";
                                    }else if (waterElement[j] >=18.5){
                                        many = many + pointId[j]+"号点, ";
                                    }else {
                                        good = good + pointId[j]+"号点, ";
                                    }
                                }
                                layer.open({
                                    type: 1,
                                    title: ['水含量的正常范围： 15.5-18.5 %'],
                                    area: ['600px', '360px'],
                                    shadeClose: true, //点击遮罩关闭
                                    content: '\<\div style="padding:20px;"> '+areaName[0]+'地区'+good+'水含量正常'+'<br/>地区'+many+'水含量过多！请及时进行处理！'+'<br/>地区'+less+'水含量缺失！请及时进行补充！\<\/div>',
                                    closeBtn: 1,
                                    Number: 30000
                                });
                            }
                        }
                        $(function () {
                            $('#n').countTo({to: nAvg[2]});
                            $('#salt').countTo({to:saltAvg[2]});
                            $('#water').countTo({to:waterAvg[2]});
                        });
                    </script>
                </div>
            </div>
        </div>
        <!-- #END# CPU Usage -->
    </div>
</section>

<%@ include file="script.jsp"%>
</body>

</html>
