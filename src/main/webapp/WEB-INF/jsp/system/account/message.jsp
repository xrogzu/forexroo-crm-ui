<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../includes/taglib.jsp"%>

<div id="messageLists">
    <p class="text-center height-150 vertical-align">
        <small class="vertical-align-middle opacity-four">没有新消息</small>
    </p>
    <script type="text/html" id="newMessge">
        <div class="list-group list-group-full">
            {{each msgList}}
            <div class="list-group-item" role="menuitem" data-id="{{$value.messageId}}">
                <div class="media">
                    <div class="media-left">
                        <i class="icon {{$value.type | iconType}} white icon-circle" aria-hidden="true"></i>
                    </div>
                    <div class="media-body">
                        <h6 class="media-heading">
                            <a class="news-list" data-toggle="collapse" href="#msgContent-{{$index}}" aria-expanded="false" aria-controls="msgContent-{{$index}}">
                                {{if $value.readFlag === false}}
                                <i class="icon wb-medium-point red-600" aria-hidden="true"></i> {{/if}} {{$value.title}}
                            </a>
                        </h6>

                        <div class="collapse margin-top-10" id="msgContent-{{$index}}">
                            <div class="well">
                                <h5 class="message-title">{{$value.title}}</h5>
                                <div class="message-content">
                                    {{$value.content}}
                                </div>
                            </div>
                        </div>
                        <time class="media-meta" datetime="{{$value.sendTime}}">{{$value.sendTime | timeMsg}}</time>
                    </div>
                    <div class="media-right">
                        {{if $value.readFlag === true}}
                        <a type="button" href="#" title="删除" class="btn btn-pure btn-default icon wb-close"></a>
                        {{else}}
                        <a type="button" href="#" title="标为已读" class="btn btn-pure btn-default icon wb-check"></a>
                        {{/if}}
                    </div>
                </div>
            </div>
            {{/each}}
        </div>
        <nav id="paging" data-page="{{page}}" data-max-page="{{maxPage}}">
            <ul class="pager pager-sm margin-bottom-0">
                {{if page > 1}}
                <li class="previous">
                    <a href="javascript:;"><span aria-hidden="true">←</span> 上一页</a>
                </li>
                {{/if}} {{if page < maxPage}}
                <li class="next">
                    <a href="javascript:;">下一页 <span aria-hidden="true">→</span></a>
                </li>
                {{/if}}
            </ul>
        </nav>
    </script>
</div>

<script src="${ctx}/public/js/system/account/message.js"></script>
