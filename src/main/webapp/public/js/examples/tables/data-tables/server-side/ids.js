/**
 * Admui v1.0.0 (http://www.admui.com/)
 * Copyright 2015-2017 Admui Team
 * Licensed under the Admui License 1.0 (http://www.admui.com/about/#license)
 */
(function (window, document, $) {
    "use strict";

    $('#dataTableExample').DataTable($.po('dataTable', {
        "processing": true,
        "serverSide": true,
        "ajax": $.ctx + "/employee/all/get",
        "columns": [
            {"data": "name"},
            {"data": "title"},
            {"data": "base"},
            {"data": "age"},
            {"data": "hireDate"},
            {"data": "salary"}
        ]
    }));
})(window, document, jQuery);

