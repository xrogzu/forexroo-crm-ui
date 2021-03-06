<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../includes/taglib.jsp"%>

<title>笔记</title>

<link rel="stylesheet" href="${ctx}/public/vendor/bootstrap-markdown/bootstrap-markdown.css">
<link rel="stylesheet" href="${ctx}/public/css/examples/pages/team/notebook.css">

<div class="page page-full animation-fade page-notebook">

    <div class="page-aside">
        <div class="page-aside-switch">
            <i class="icon wb-chevron-left" aria-hidden="true"></i>
            <i class="icon wb-chevron-right" aria-hidden="true"></i>
        </div>
        <div class="page-aside-inner">
            <div class="input-search">
                <button class="input-search-btn" type="submit">
                    <i class="icon wb-search" aria-hidden="true"></i>
                </button>
                <form>
                    <input class="form-control" type="text" placeholder="快速查找" name="">
                </form>
            </div>
            <div class="notebook-list">
            	<div class="height-full" data-plugin="slimScroll">
	                <ul class="list-group">
	                    <li class="list-group-item active" data-toggle="context" data-target="#contextMenu">
	                        <h4 class="list-group-item-heading">新建笔记</h4>
	                        <p class="list-group-item-text">让大家吐彩虹的 Faceu</p>
	                        <div class="info">
	                            <i class="icon wb-folder"></i> <span class="category">工作</span> <span class="time">刚刚</span>
	                        </div>
	                    </li>
	                    <li class="list-group-item" data-toggle="context" data-target="#contextMenu">
	                        <h4 class="list-group-item-heading">未命名笔记</h4>
	                        <p class="list-group-item-text">1 亿美元，这是云鸟上周在App</p>
	                        <div class="info">
	                            <i class="icon wb-folder "></i> <span class="category">生活</span> <span class="time">15 分钟前</span>
	                        </div>
	                    </li>
	                    <li class="list-group-item" data-toggle="context" data-target="#contextMenu">
	                        <h4 class="list-group-item-heading">旅游随笔</h4>
	                        <p class="list-group-item-text">除了投资额，云鸟业务覆盖范</p>
	                        <div class="info">
	                            <i class="icon wb-folder "></i> <span class="category">旅游</span> <span class="time">今天 12:49</span>
	                        </div>
	                    </li>
	                    <li class="list-group-item" data-toggle="context" data-target="#contextMenu">
	                        <h4 class="list-group-item-heading">有感而发r</h4>
	                        <p class="list-group-item-text">没错，云鸟并不是一家面对普通消 </p>
	                        <div class="info">
	                            <i class="icon wb-folder "></i> <span class="category">美食</span> <span class="time">昨天 11:53</span>
	                        </div>
	                    </li>
	                    <li class="list-group-item" data-toggle="context" data-target="#contextMenu">
	                        <h4 class="list-group-item-heading">鱼鸟</h4>
	                        <p class="list-group-item-text">所以云鸟就是一家城配企业？ </p>
	                        <div class="info">
	                            <i class="icon wb-folder "></i> <span class="category">旅游</span> <span class="time">昨天 8:10</span>
	                        </div>
	                    </li>
	                    <li class="list-group-item" data-toggle="context" data-target="#contextMenu">
	                        <h4 class="list-group-item-heading">会议内容</h4>
	                        <p class="list-group-item-text">云鸟的肇始于几个创始人对 </p>
	                        <div class="info">
	                            <i class="icon wb-folder "></i> <span class="category">工作</span> <span class="time">昨天 3:55</span>
	                        </div>
	                    </li>
	                    <li class="list-group-item" data-toggle="context" data-target="#contextMenu">
	                        <h4 class="list-group-item-heading">浏览量统计</h4>
	                        <p class="list-group-item-text">很快他们着手服务升级，开</p>
	                        <div class="info">
	                            <i class="icon wb-folder "></i> <span class="category">资源</span> <span class="time">前天 10:40</span>
	                        </div>
	                    </li>
	                    <li class="list-group-item" data-toggle="context" data-target="#contextMenu">
	                        <h4 class="list-group-item-heading">待办事项</h4>
	                        <p class="list-group-item-text">但高品质城配并不是对云鸟 </p>
	                        <div class="info">
	                            <i class="icon wb-folder "></i> <span class="category">收藏</span> <span class="time">前天 9:23</span>
	                        </div>
	                    </li>
	                </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="page-main">

        <form>
            <textarea data-plugin="markdown" data-language="zh" data-iconlibrary="fa">最近，我身边越来越多朋友喜欢玩 Faceu，他们用它制作了各种加载了不同表情的小视频，无论通过微信分享给我，还是聚在一起拿出来玩，常常让人欢声笑语，其中吐彩虹以及鬼叫的表情，让人喜不自禁。

因为有趣、好玩，Faceu 之前也成功登顶 App Store 免费排行榜榜首，成为近期增量最快的一款 App。

m1做了一款爆红的产品后，再做一款爆红的产品，是一种怎样的体验？

2014 年我们采访了脸萌郭列，2016 年邀请他参加 MindStore 社区的“MindTalk 线场”活动，对于这个问题，他说，“脸萌的爆红更多是惊喜和意外，而 Faceu 则是辛苦得到认可，和如何推动产品在火的时候，迅速优化。”

脸萌与 Faceu，共同的特点是“脸”。前者让人们个性化定制自己的头像，后者则是引入了动态脸部识别的功能，在视频当中动态为人们添加表情，形成生动有趣的短视频，激发人们分享的欲望。在脸萌团队内部，他们把这种效果称之为“短视频动态贴纸”。</textarea>
        </form>

    </div>

    <div class="site-action">
        <button type="button" class="site-action-toggle btn-raised btn btn-success btn-floating">
            <i class="front-icon wb-plus animation-scale-up" aria-hidden="true"></i>
            <i class="back-icon wb-close animation-scale-up" aria-hidden="true"></i>
        </button>
        <div class="site-action-buttons">
            <button type="button" data-action="trash" class="btn-raised btn btn-success btn-floating animation-slide-bottom">
                <i class="icon wb-trash" aria-hidden="true"></i>
            </button>
            <button type="button" data-action="folder" class="btn-raised btn btn-success btn-floating animation-slide-bottom">
                <i class="icon wb-print" aria-hidden="true"></i>
            </button>
            <button type="button" data-action="folder" class="btn-raised btn btn-success btn-floating animation-slide-bottom">
                <i class="icon wb-share" aria-hidden="true"></i>
            </button>
        </div>
    </div>

    <div id="contextMenu">
        <ul class="dropdown-menu" role="menu">
            <li>
                <a tabindex="-1"><i class="icon wb-folder" aria-hidden="true"></i> 归档</a>
            </li>
            <li>
                <a tabindex="-1"><i class="icon wb-trash" aria-hidden="true"></i> 删除</a>
            </li>
            <li>
                <a tabindex="-1"><i class="icon wb-print" aria-hidden="true"></i> 打印</a>
            </li>
            <li>
                <a tabindex="-1"><i class="icon wb-share" aria-hidden="true"></i> 分享</a>
            </li>
        </ul>
    </div>

</div>


<div class="modal fade" id="addNewNote" aria-hidden="true" aria-labelledby="addNewNote" role="dialog" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
                <h4 class="modal-title">新建笔记</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input class="form-control" type="text" name="noteName" placeholder="输入笔记标题">
                    </div>
                </form>
            </div>
            <div class="modal-footer text-left">
                <button class="btn btn-primary" data-dismiss="modal" type="submit">确定</button>
                <a class="btn btn-sm btn-white" data-dismiss="modal" href="javascript:;">取消</a>
            </div>
        </div>
    </div>
</div>


<script src="${ctx}/public/vendor/bootstrap-markdown/bootstrap-markdown.min.js" data-name="markdown"></script>
<script src="${ctx}/public/vendor/bootstrap-markdown/locale/bootstrap-markdown.zh.js" data-deps="markdown"></script>
<script src="${ctx}/public/vendor/marked/marked.min.js"></script>
<script src="${ctx}/public/vendor/to-markdown/to-markdown.min.js"></script>
<script src="${ctx}/public/vendor/bootstrap-contextmenu/bootstrap-contextmenu.min.js"></script>
<script src="${ctx}/public/themes/classic/global/js/plugins/action-btn.js"></script>
<script src="${ctx}/public/themes/classic/base/js/app.js" data-name="app"></script>
<script src="${ctx}/public/js/examples/pages/team/notebook.js" data-deps="app"></script>
