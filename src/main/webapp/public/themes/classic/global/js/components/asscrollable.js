/**
 * Admui v1.0.0 (http://www.admui.com/)
 * Copyright 2015-2017 Admui Team
 * Licensed under the Admui License 1.0 (http://www.admui.com/about/#license)
 */
(function(window, document, $){
    "use strict";

    $.components.register("scrollable", {
        mode: "init",
        defaults: {
            namespace: "scrollable",
            contentSelector: "> [data-role='content']",
            containerSelector: "> [data-role='container']"
        },
        init: function (context) {
            if (!$.fn.asScrollable) {
                return;
            }
            var defaults = this.defaults;

            $('[data-plugin="pageAsideScroll"]', context).each(function () {
                var options = $.extend({}, defaults, $(this).data());

                $(this).asScrollable(options);
            });
        }
    });
})(window, document, jQuery);




