<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Widgets -->
<div class="row clearfix">
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" onclick="show(1)">
        <div class="info-box bg-grey hover-expand-effect">
            <div class="icon">
                <i class="material-icons">N₂</i>
            </div>
            <div class="content">
                <div class="text">氮含量   mg/kg</div>
                <div id="n" class="number count-to" data-from="0" data-to="" data-speed="50" data-fresh-interval="20"></div>
            </div>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" onclick="show(2)">
        <div class="info-box bg-orange hover-expand-effect">
            <div class="icon">
                <i class="material-icons">盐</i>
            </div>
            <div class="content">
                <div class="text">土壤盐分   mS/cm</div>
                <div id="salt" class="number count-to" data-from="0" data-to="" data-speed="1" data-fresh-interval="20"></div>
            </div>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" onclick="show(3)">
        <div class="info-box bg-cyan hover-expand-effect">
            <div class="icon">
                <i class="material-icons">水</i>
            </div>
            <div class="content">
                <div class="text">土壤体积含水率  %</div>
                <div id="water" class="number count-to" data-from="0" data-to="" data-speed="5" data-fresh-interval="20"></div>
            </div>
        </div>
    </div>
</div>
<!-- #END# Widgets -->
