<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../includes/taglib.jsp"%>

<title>Isotope</title>

<link rel="stylesheet" href="${ctx}/public/vendor/animsition/animsition.css">
<link rel="stylesheet" href="${ctx}/public/vendor/magnific-popup/magnific-popup.css">
<link rel="stylesheet" href="${ctx}/public/css/examples/pages/general/gallery.css">

<div class="page animsition animation-fade page-gallery">
    <div class="page-header page-header-bordered page-header-tabs">
        <h1 class="page-title">Isotope</h1>
        <div class="page-header-actions">
            <a class="btn btn-inverse btn-round" href="https://github.com/metafizzy/isotope" target="_blank">
                <i class="icon wb-link" aria-hidden="true"></i> <span class="hidden-xs">官网</span></a>
        </div>
        <ul class="nav nav-tabs nav-tabs-line" role="tablist">
            <li class="active" role="presentation">
                <a href="#exampleList" aria-controls="exampleList" aria-expanded="true" role="tab" data-filter="*">所有
                </a>
            </li>
            <li role="presentation">
                <a href="#exampleList" aria-expanded="false" role="tab" data-filter="object">景物</a>
            </li>
            <li role="presentation">
                <a href="#exampleList" aria-expanded="false" role="tab" data-filter="city">城市</a>
            </li>
            <li role="presentation">
                <a href="#exampleList" aria-expanded="false" role="tab" data-filter="animal">动物</a>
            </li>
        </ul>
    </div>
    <div class="page-content">
        <ul class="blocks blocks-100 blocks-xlg-4 blocks-md-3 blocks-sm-2" id="exampleList" data-filterable="true">
            <li data-type="animal">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-1.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-1.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-1</h4>
                </div>
            </li>
            <li data-type="object">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-2.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-2.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-2</h4>
                </div>
            </li>
            <li data-type="object">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-3.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-3.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-3</h4>
                </div>
            </li>
            <li data-type="city">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-4.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-4.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-4</h4>
                </div>
            </li>
            <li data-type="scenery">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-5.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-5.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-5</h4>
                </div>
            </li>
            <li data-type="city">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-6.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-6.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-6</h4>
                </div>
            </li>
            <li data-type="animal">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-7.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-7.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-7</h4>
                </div>
            </li>
            <li data-type="city">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-8.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-8.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-8</h4>
                </div>
            </li>
            <li data-type="animal">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-9.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-9.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-9</h4>
                </div>
            </li>
            <li data-type="city">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-10.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-10.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-10</h4>
                </div>
            </li>
            <li data-type="object">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-11.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-11.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-11</h4>
                </div>
            </li>
            <li data-type="object">
                <div class="widget widget-shadow">
                    <figure class="widget-header overlay-hover overlay">
                        <img class="overlay-figure overlay-scale" src="${ctx}/public/images/photos/view-12.jpg" alt="...">
                        <figcaption class="overlay-panel overlay-background overlay-fade overlay-icon">
                            <a class="icon wb-search" href="${ctx}/public/images/photos/view-12.jpg"></a>
                        </figcaption>
                    </figure>
                    <h4 class="widget-title">View-12</h4>
                </div>
            </li>
        </ul>
    </div>
</div>

<script src="${ctx}/public/vendor/animsition/animsition.min.js"></script>
<script src="${ctx}/public/vendor/isotope/isotope.pkgd.min.js"></script>
<script src="${ctx}/public/vendor/magnific-popup/jquery.magnific-popup.min.js" data-name="magnific"></script>
<script src="${ctx}/public/js/examples/pages/general/gallery.js" data-deps="magnific"></script>
