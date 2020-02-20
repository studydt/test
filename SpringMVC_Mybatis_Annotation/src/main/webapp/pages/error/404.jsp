<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../head.jsp"%>
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
<%@ include file="../../topBar.jsp"%>

<%@ include file="../../menu.jsp"%>

<section class="content">
<div class="page-wrap d-flex flex-row align-items-center">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 text-center">
                <h1>404</h1>
                <div class="mb-5 lead">找不到您要查找的页面。</div>
                <a href="index2.jsp" class="btn btn-link">返回主页</a>
            </div>
        </div>
    </div>
</div>
    </section>
<%@ include file="../../script.jsp"%>
</body>
</html>
