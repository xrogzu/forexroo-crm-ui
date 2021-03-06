<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../includes/taglib.jsp"%>

<title>代码编辑器</title>

<link rel="stylesheet" href="${ctx}/public/vendor/ace/ace.css">

<div class="page animation-fade page-forms">
    <div class="page-header">
        <h1 class="page-title">代码编辑器</h1>
        <ol class="breadcrumb">
            <li>
                <a>首页</a>
            </li>
            <li>
                <a href="javascript:;">表单</a>
            </li>
            <li class="active">代码编辑器</li>
        </ol>
        <div class="page-header-actions">
            <a class="btn btn-default btn-outline btn-round" href="https://github.com/ajaxorg/ace-builds" target="_blank">
                <i class="icon wb-link" aria-hidden="true"></i> <span class="hidden-xs">官网</span></a>
        </div>
    </div>
    <div class="page-content">

        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Ace Editor</h3>
            </div>
            <div class="panel-body">

                <div class="example-wrap">
                    <h4 class="example-title">Javascript</h4>
                    <div class="example">
              <pre class="ace-editor" id="exampleJavascript" data-plugin="ace" data-mode="javascript" style="width: 100%;">/**
 * In fact, you're looking at ACE right now. Go ahead and play with it!
 *
 * We are currently showing off the JavaScript mode. ACE has support for 45
 * language modes and 24 color themes!
 */
function add(x, y) {
    var resultString = "Hello, ACE! The result of your math is: ";
    var result = x + y;
    return resultString + result;
}
var addResult = add(3, 2);
console.log(addResult);
            </pre>
                    </div>
                </div>


                <div class="example-wrap">
                    <h4 class="example-title">Html</h4>
                    <div class="example">
              <pre class="ace-editor" id="exampleModeEmmet" data-plugin="ace" data-mode="html" style="width: 100%;">&lt;!--
* We are currently showing off the Html mode. ACE has support for 45
* language modes and 24 color themes!
 -->
&lt;!DOCTYPE html>
&lt;html lang="en">
&lt;head>
&lt;title>ACE in Action&lt;/title>
&lt;style>
    #editor {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
    }
&lt;/style>
&lt;/head>
&lt;body>
&lt;div id="editor">function foo(items) {
    var x = "All this is syntax highlighted";
    return x;
}&lt;/div>
&lt;script src="/ace-builds/src-noconflict/ace.js" charset="utf-8">&lt;/script>
&lt;script>
    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/monokai");
    editor.getSession().setMode("ace/mode/javascript");
&lt;/script>
&lt;/body>
&lt;/html>
            </pre>
                    </div>
                </div>


                <div class="example-wrap">
                    <h4 class="example-title">主题</h4>
                    <div class="example">
              <pre class="ace-editor" id="exampleTheme" data-plugin="ace" data-mode="html" data-theme="twilight" style="width: 100%;">&lt;!DOCTYPE html>
&lt;html lang="en">
&lt;head>
&lt;title>ACE in Action&lt;/title>
&lt;style type="text/css" media="screen">
    #editor {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
    }
&lt;/style>
&lt;/head>
&lt;body>
&lt;div id="editor">function foo(items) {
    var x = "All this is syntax highlighted";
    return x;
}&lt;/div>
&lt;script src="/ace-builds/src-noconflict/ace.js" type="text/javascript" charset="utf-8">&lt;/script>
&lt;script>
    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/twilight");
    editor.getSession().setMode("ace/mode/javascript");
&lt;/script>
&lt;/body>
&lt;/html>
            </pre>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>

<script src="${ctx}/public/vendor/ace/ace.js"></script>
