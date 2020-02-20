<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
areaName = [];     //类别数组（实际用来盛放X轴坐标值）
nums = [];       //水分数组（实际用来盛放Y坐标值）
waterAvg=[];
nAvg=[];
saltAvg=[];
$.getJSON('http://148.70.138.222:8080/SpringMVC_Mybatis_Annotation/allAvg/getData',function(data) {
console.log(data);
//请求成功时执行该函数内容，result即为服务器返回的json对象

for (var i = 0; i < data.length; i++) {
areaName.push(data[i].areaName);
waterAvg.push(data[i].waterAvg);
nAvg.push(data[i].nAvg);
saltAvg.push(data[i].saltAvg);
}
})
</script>