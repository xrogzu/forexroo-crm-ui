<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../includes/taglib.jsp"%>

<title>Flot</title>

<link rel="stylesheet" href="${ctx}/public/vendor/flot/flot.css">
<link rel="stylesheet" href="${ctx}/public/css/examples/charts/flot.css">

<div class=" page animation-fade">
    <div class="page-header">
        <h1 class="page-title">Flot 图表</h1>
        <div class="page-header-actions">
            <a class="btn btn-default btn-outline btn-round" href="http://www.flotcharts.org" target="_blank">
                <i class="icon fa-home" aria-hidden="true"></i> <span class="hidden-xs">官网</span></a>
        </div>
    </div>
    <div class="page-content">

        <div class="panel">
            <div class="panel-body container-fluid">
                <div class="row row-lg">
                    <div class="col-md-6">

                        <div class="example-wrap">
                            <h4 class="example-title">实时显示</h4>
                            <div class="example">
                                <div id="exampleFlotRealtime"></div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">

                        <div class="example-wrap">
                            <h4 class="example-title">全背景曲线图</h4>
                            <div class="example example-responsive">
                                <div class="width-xs-400" id="exampleFlotFullBg"></div>
                            </div>
                        </div>

                    </div>
                    <div class="clearfix hidden-xs hidden-sm"></div>
                    <div class="col-md-6">

                        <div class="example-wrap margin-md-0">
                            <h4 class="example-title">曲线图</h4>
                            <div class="example example-responsive">
                                <div class="width-xs-400" id="exampleFlotCurve"></div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">

                        <div class="example-wrap">
                            <h4 class="example-title">混合图</h4>
                            <div class="example example-responsive">
                                <div class="width-xs-400" id="exampleFlotMix"></div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="panel">
            <div class="panel-body container-fluid">
                <div class="row row-lg">
                    <div class="col-lg-6">

                        <div class="example-wrap margin-lg-0">
                            <h4 class="example-title">堆叠柱状图</h4>
                            <div class="example">
                                <div id="exampleFlotStackBar"></div>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-6">

                        <div class="example-wrap">
                            <h4 class="example-title">横向柱状图</h4>
                            <div class="example">
                                <div id="exampleFlotHorizontalBar"></div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">饼状图</h3>
            </div>
            <div class="panel-body">

                <div class="example-wrap">
                    <div class="example text-center">
                        <div id="exampleFlotPie"></div>
                    </div>
                    <div class="example-buttons text-center margin-bottom-30">
                        <button class="btn btn-primary btn-outline" id="btnPieDefault" type="button">默认</button>
                        <button class="btn btn-primary btn-outline" id="btnPieWithoutLegend" type="button">隐藏图例</button>
                        <button class="btn btn-primary btn-outline" id="btnPieLabelRadius" type="button">圆形</button>
                        <button class="btn btn-primary btn-outline" id="btnPieRectangular" type="button">矩形</button>
                        <button class="btn btn-primary btn-outline" id="btnPieDonutHole" type="button">环形</button>
                        <button class="btn btn-primary btn-outline" id="btnPieInteractivity" type="button">交互</button>
                    </div>
                </div>

            </div>
        </div>


        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">访客图</h3>
            </div>
            <div class="panel-body">

                <div class="example-wrap">
                    <div class="example">
                        <div id="exampleFlotVisitors"></div>
                        <div id="exampleFlotVisitorsOverview"></div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>

<script src="${ctx}/public/vendor/flot/jquery.flot.min.js" data-name="flot"></script>
<script src="${ctx}/public/vendor/flot/jquery.flot.resize.min.js" data-deps="flot"></script>
<script src="${ctx}/public/vendor/flot/jquery.flot.time.min.js" data-deps="flot"></script>
<script src="${ctx}/public/vendor/flot/jquery.flot.stack.min.js" data-deps="flot"></script>
<script src="${ctx}/public/vendor/flot/jquery.flot.pie.min.js" data-deps="flot"></script>
<script src="${ctx}/public/vendor/flot/jquery.flot.selection.min.js" data-deps="flot"></script>
<script src="${ctx}/public/js/examples/charts/flot.js"></script>
