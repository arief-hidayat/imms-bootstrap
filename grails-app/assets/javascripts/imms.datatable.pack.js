// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require app/app.settings
//= require jquery
//= require jquery.dataTables.min
//= require dt/dataTables.ext
//= require dataTables.bootstrap
//= require imms.backbone.pack
//= require_self

(function($, Backbone, App){
    App.dataTableOptions = function(key) { // key is domainName e.g. asset, but it might be customized i.e. workOrder/closed
        var tableConf = App.dt.config.table[key];
        var customUrlConf = App.dt.config.customUrl[key];

        var pipelineOpt = { url : "dataTable/" + key};
        if(customUrlConf != undefined) {
            if(customUrlConf.url != undefined) pipelineOpt.url = customUrlConf.url;
            if(customUrlConf.data != undefined) pipelineOpt.data = customUrlConf.data;
        }
        var ret = {
            "processing": true,
            "serverSide": true,
            "columns" : tableConf.columns,
//            language: {
//                url: "/assets/localization/table/"+ App.options.language + ".json"
//            },
            "rowCallback": function( row, data, displayIndex ) { // make row selectable
                var selected = $('#example').data('selectedRows');
                if ( $.inArray(data.DT_RowId, selected) !== -1 ) { //must have row_id
                    $(row).addClass('selected');
                }
            },
            "ajax": $.fn.dataTable.pipeline(pipelineOpt)
        };
        if(tableConf.order != undefined) { ret.order = tableConf.order; }
        return ret;
    };

    App.initTable = function($root, key) {
        $root.data('selectedRows', []);
        $root.dataTable( App.dataTableOptions(key));
        $root.find('tbody').on('click', 'tr', function () {
            var id = this.id;
            var selected = $root.data('selectedRows');
            var index = $.inArray(id, selected);
            if ( index === -1 ) {
                selected.push( id );
            } else {
                selected.splice( index, 1 );
            }

            $(this).toggleClass('selected');
            $root.data('selectedRows', selected);
        } );
    };


})(jQuery, Backbone, App);