<%--
  Created by IntelliJ IDEA.
  User: 25760
  Date: 2019/10/9
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <%@ page isELIgnored="false" %>
    <meta charset="utf-8">
    <%@page pageEncoding="UTF-8" %>
    <script src="${ctx}/js/echarts.js"></script>
    <script src="${ctx}/js/jquery-3.4.1.js"></script>
</head>
<body style="height: 100%; margin: 0">
<div id="container" style="height: 100%"></div>

<script type="text/javascript">

    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    app.title = '折柱混合';

    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        legend: {
            data:['水含量','氮含量']
        },
        xAxis: [
            {
                type: 'category',
                data: ['第一垄','第二垄','第三垄'],
                axisPointer: {
                    type: 'shadow'
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '水含量',
                min: 0,
                max: 100,
                interval: 50,
                axisLabel: {
                    formatter: '{value} %'
                }
            },
            {
                type: 'value',
                name: '氮含量',
                min: 0,
                max: 225,
                interval: 5,
                axisLabel: {
                    formatter: '{value} mg/kg'
                }
            }
        ],
        series: [
            {
                name:'水含量',
                type:'bar',
                data:[]
            },
            {
                name:'氮含量',
                type:'bar',
                data:[]
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }

    var water=[];
    var salt=[];
    myChart.showLoading(); // 显示加载动画

    // 异步加载数据
    $.getJSON('${ctx}/element/data').done(function (data) {
        myChart.hideLoading(); // 隐藏加载动画
        console.log(data)
        //alert(typeof(data))
        //var json = JSON.parse(data);
        for (var i = 0; i < data.length; i++) {
            water.push(data[i].waterElement);    //挨个取出类别并填入类别数组
        }
        for (var i = 0; i < data.length; i++) {
            salt.push(data[i].saltElement);    //挨个取出销量并填入销量数组
        }



        // 填入数据
        myChart.setOption({
            series: [{
                name: '水含量', // 根据名字对应到相应的系列
                data: water
            },{
                name: '氮含量',
                data: salt
            }]
        });
    });

</script>
</body>
</html>