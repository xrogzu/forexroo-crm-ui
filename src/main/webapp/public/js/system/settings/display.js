(function (window, document) {
    'use strict';

    window.Content = {
    	run: function(){
    		if ($('#admui-pageContent').find('#accountContent').size() > 0) {
    	        $('#displayForm').append('<input type="hidden" name="user.userId" value="' + $('#admui-signOut').attr("data-user") + '">');
    	    }

    	    if (document.addEventListener) {        

    	        var Skintools = {
    	            path: $.ctx + '/public/themes/classic/base/',
    	            $siteSidebar: $('.site-menubar'),
    	            $siteNavbar: $('.site-navbar'),
    	            navbarSkins: 'bg-primary-600 bg-brown-600 bg-cyan-600 bg-green-600 bg-grey-600 bg-indigo-600 bg-orange-600 bg-pink-600 bg-purple-600 bg-red-600 bg-teal-600 bg-yellow-700',            
    	            init: function () {
    	                var self = this,
    	                    $pageContent = $('#admui-pageContent');

    	                $pageContent.on('change', '#skintoolsSidebar', function () { // 菜单主题
    	                    self.sidebarEvents($(this));
    	                });
    	                $pageContent.on('click', '#skintoolsNavbar input', function () { // 导航条颜色
    	                    self.navbarEvents($(this));
    	                });
    	                $pageContent.on('click', '#skintoolsPrimary input', function () { // 主题颜色
    	                    self.primaryEvents($(this));
    	                });

    	                $pageContent.on("change", 'input[name="menuDisplay"]', function () { // 菜单显示
    	                    var $menuFold = $("#menuFoldSetting");
    	                    if ($(this).val() === 'site-menubar-unfold') {
    	                        $("body").removeClass("site-menubar-fold site-menubar-keep site-menubar-fold-alt").addClass("site-menubar-unfold");
    	                        $menuFold.addClass("hidden");
    	                        $.site.menubar.unfold();
    	                    } else {
    	                        $("body").addClass("site-menubar-fold site-menubar-keep").removeClass("site-menubar-unfold");
    	                        $menuFold.removeClass("hidden");
    	                        $.site.menubar.fold();
    	                    }
    	                });

    	                // 鼠标经过左侧菜单时显示文字 | 图标
    	                $pageContent.on("change", 'input[name="menuTxtIcon"]', function () {
    	                    if ($(this).val() === 'site-menubar-keep') { // 显示文字
    	                        $("body").removeClass("site-menubar-fold-alt").addClass("site-menubar-keep");
    	                    } else {
    	                        $("body").removeClass("site-menubar-keep").addClass("site-menubar-fold-alt");
    	                    }
    	                });

    	                $pageContent.on('change', 'input[name="tabFlag"]', function () { // Tab页签
    	                    if ($(this).val() === 'site-contabs-open') {
    	                        $("body").addClass("site-contabs-open");
    	                    } else {
    	                        $("body").removeClass("site-contabs-open");
    	                    }
    	                });

    	                $("#admui-pageContent").on("click", "button[name='save']", function (e) {
    	                    e.preventDefault();
    	                    $.ajax({
    	                        url: $.ctx + '/display/save',
    	                        type:'POST',
    	                        data: $(".form-horizontal").serialize(),
    	                        dataType: 'JSON',
    	                        success: function(data){
    	                            if(data.success)
    	                                location.reload(true);
    	                            else
    	                                toastr.error('出错了，请重试！');
    	                        },
    	                        error: function () {
    	                            toastr.error('服务器异常，请稍后再试！');
    	                        }
    	                    })
    	                });

    	                $('#admui-pageContent').on('click', '#skintoolsReset', function (e) { // 恢复默认
    	                    e.preventDefault();
    	                	var userId = $('#displayForm').find("[name='user.userId']").val() === undefined ? '' : $('#displayForm').find("[name='user.userId']").val();
    	                	
    	                    $.ajax({
    	                        url: $.ctx + '/display/reset?user.userId=' + userId,
    	                        type:'POST',
    	                        dataType: 'JSON',
    	                        success: function(data){
    	                            if(data.success)
    	                                location.reload(true);
    	                            else
    	                                toastr.error('出错了，请重试！');
    	                        },
    	                        error: function () {
    	                            toastr.error('服务器异常，请稍后再试！');
    	                        }
    	                    })
    	                });

    	                $('#skintoolsSidebar').selectpicker({
    	                    style: "btn-select",
    	                    iconBase: "icon",
    	                    tickIcon: "wb-check"
    	                });
    	            },            

    	            sidebarEvents: function ($item) {
    	                var val = $item.val();

    	                this.sidebarImprove(val);
    	            },
    	            navbarEvents: function ($item) {
    	                var val = $item.val(),
    	                    checked = $item.prop('checked');
    	                this.navbarImprove(val, checked);
    	            },
    	            primaryEvents: function ($item) {
    	                var val = $item.val();
    	                this.primaryImprove(val);

    	            },
    	            sidebarImprove: function (val) {
    	                if (val === 'site-menubar-light')
    	                    this.$siteSidebar.removeClass('site-menubar-dark').addClass(val);
    	                else
    	                    this.$siteSidebar.removeClass('site-menubar-light').addClass(val);
    	            },
    	            navbarImprove: function (val, checked) {
    	                if (val === 'navbar-inverse')
    	                    checked ? this.$siteNavbar.addClass(val) : this.$siteNavbar.removeClass(val);
    	                else
    	                    this.$siteNavbar.removeClass(this.navbarSkins).addClass(val);
    	            },
    	            primaryImprove: function (val) {
    	            	var $link = $('#admui-siteStyle', $('head')), href,
                        etx = $link.prop('href').indexOf('?v=') === -1 ? '' : '.min' ;

    	            	if (val === 'primary') {
    	                    href = this.path + '/css/site' + etx + '.css';
    	                }
    	                else {
    	                    href = this.path + '/skins/' + val + etx + '.css';
    	                }

    	                $link.attr('href', href);
    	            }
    	        };

    	        Skintools.init();
    	    }

    	}
    }
})(window, document);
