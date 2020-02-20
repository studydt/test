<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Top Bar -->
<nav class="navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse"
               data-target="#navbar-collapse" aria-expanded="false"></a>
            <a href="javascript:void(0);" class="bars"></a>
            <a class="navbar-brand" href="index2.jsp">智慧农业 - 土壤元素含量检测</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">

                <!-- Notifications -->
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <i class="material-icons">notifications</i>

                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">当前系统时间</li>
                        <li class="body">
                            <ul class="menu">
                                <li>
                                    <a href="javascript:void(0);">
                                        <div class="icon-circle bg-light-green">
                                            <i class="material-icons"></i>
                                        </div>
                                        <div class="menu-info">
                                            <h4><div class="notification-content" id="show_time">
                                                <small class="notification-timestamp pull-right" id="nowDiv1"></small>
                                                <div class="notification-heading" id="nowDiv"></div>
                                            </div></h4>
                                            <p>
                                                </i>
                                            </p>
                                        </div>
                                    </a>
                                </li>

                            </ul>
                        </li>

                    </ul>
                </li>
                <!-- #END# Notifications -->
                <!-- #END# Tasks -->
            </ul>
        </div>
    </div>
</nav>
<!-- #Top Bar -->