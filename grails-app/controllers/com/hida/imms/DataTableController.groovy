package com.hida.imms

import grails.converters.JSON
import grails.orm.PagedResultList
import org.grails.datastore.mapping.query.api.Criteria

class DataTableController {
    static scope = "singleton"
    def index() {}


    def asset() {
        DataTableRequest req = new DataTableRequest(params)
        println "inside dataTable/asset -> ${req.draw} ${req.start} ${req.length}. search : ${req.search}."


        for(DtReqOrder order : req.orders) {
            println "order ${req.columns.get(order.column).data}. dir ${order.dir}"
        }
        if(req.search?.value) {
            // search
        }

        Criteria criteria = Asset.createCriteria()
        PagedResultList results = criteria.list(max : req.length, offset: req.start) {
            for(DtReqOrder ord : req.orders)
                order(req.columns.get(ord.column).data, ord.dir)
        }
        DataTableResponse resp = new DataTableResponse(draw: req.draw,
                recordsTotal: Asset.count(),
                recordsFiltered: results.totalCount).
                withData(results.list)
        render resp as JSON
    }
}
