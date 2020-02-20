<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="content-type" content="text/html; charset=utf-8">
<script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js" charset="utf-8"></script>
<script src="js/jquery-3.4.1.js"></script>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>农业土壤元素含量检测</title>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
<!-- Bootstrap Core Css -->
<link href="plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- Waves Effect Css -->
<link href="plugins/node-waves/waves.css" rel="stylesheet" />
<!-- Animation Css -->
<link href="plugins/animate-css/animate.css" rel="stylesheet" />
<!-- Morris Chart Css-->
<link href="plugins/morrisjs/morris.css" rel="stylesheet" />
<!-- Custom Css -->
<link href="css/style.css" rel="stylesheet">
<!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="css/themes/all-themes.css" rel="stylesheet" />

<link rel="stylesheet" href="layui/css/layui.css" media="all">
<script>
    //这里代码多了几行，但是不会延迟显示，速度比较好，格式可以自定义，是理想的时间显示
    setInterval("fun(show_time)", 1000);

    function fun(timeID) {
        var date = new Date();  //创建对象  
        var y = date.getFullYear();     //获取年份  
        var m = date.getMonth() + 1;   //获取月份  返回0-11  
        var d = date.getDate(); // 获取日  
        var w = date.getDay();   //获取星期几  返回0-6   (0=星期天) 
        var ww = ' 星期' + '日一二三四五六'.charAt(new Date().getDay());//星期几
        var h = date.getHours();  //时
        var minute = date.getMinutes();  //分
        var s = date.getSeconds(); //秒
        if (m < 10) {
            m = "0" + m;
        }
        if (d < 10) {
            d = "0" + d;
        }
        if (h < 10) {
            h = "0" + h;
        }
        if (minute < 10) {
            minute = "0" + minute;
        }
        if (s < 10) {
            s = "0" + s;
        }
        document.getElementById("nowDiv").innerHTML = y + "-" + m + "-" + d + "   " + h + ":" + minute + ":" + s;
        document.getElementById("nowDiv1").innerHTML = ww;
    }

</script>
