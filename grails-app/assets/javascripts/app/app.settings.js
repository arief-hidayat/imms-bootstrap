App = window.App || {};
App.options = App.options || {
    language : "en"
};

App.dt = App.dt || { };
App.dt.config = App.dt.config || {};

App.dt.config.table = {
    asset : {
        columns : [ { "data": "code" }, { "data": "name" }, { "data": "assetType" }, { "data": "status" }, { "data": "locationCd" }],
        order : [[1, 'asc']]
    }
};

App.dt.config.customUrl = {
//        asset : {
//            url : "only for custom",
//            extraParams : function(request) { }
//        }
};