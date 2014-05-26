package com.hida.imms

import grails.util.Holders

/**
 * new DataTableResponse(draw: 1, recordsTotal : 10, recordsFiltered : 10).withData( assets)
 */
class DataTableResponse {
    //https://datatables.net/examples/server_side/object_data.html
    //https://datatables.net/manual/server-side
    int draw, recordsTotal, recordsFiltered
    def data = []

    static def rowClassConf = Holders.config.imms?.datatable?.rowclass ?: [:]
    static def domainKeyConf = Holders.config.imms?.datatable?.domainkey ?: [:]
    static def domainFieldsConf = Holders.config.imms?.datatable?.domainfields ?: [:] // can be array of fieldName or callback function.
    static final String ROW_ID = "DT_RowId", ROW_CLASS= "DT_RowClass", ROW_DATA = "DT_RowData"

    DataTableResponse withData(def list) {
        list.each { data << DataTableResponse.Item.build(it) }
        this
    }
    static class Item {
        def map

        private Item(def domainData) { // as map
            map = populateFieldData(domainData);
        }

        static def build(def domainData) {
            new Item(domainData).populateKey(domainData).populateRowClass(domainData).map
        }

        private def populateFieldData(def it) {
            def map = [:]
            String domainNm = it.class.simpleName
            if(!domainFieldsConf.containsKey(domainNm)) throw new RuntimeException("missing configuration for ${domainNm}")
            def conf= domainFieldsConf[domainNm]
            if(conf instanceof Collection) {
                conf.each { fieldKey -> map[fieldKey] = it[fieldKey]}
            } else {
                map = conf(it) //expect a callback function.
            }
            return map;
        }

        /**
         * if not configured (e.g imms.datatable.domainkey.Asset). then it's a domain with id as single PK.
         * @param map
         * @param it
         */
        private Item populateKey(def it) {
            if(domainKeyConf.containsKey(it.class.simpleName)) {
                def conf = domainKeyConf[it.class.simpleName]
                conf.each { fieldKey -> map[fieldKey] = it[fieldKey]}
            } else {
                map[ROW_ID] = it.id
                map[ROW_DATA] = [ id : it.id]
            }
            return this
        }

        private Item populateRowClass(def it) {
            if(rowClassConf.containsKey(it.class.simpleName)) {
                def conf = rowClassConf[it.class.simpleName]
                String value = (conf instanceof String) ? conf : conf(it)
                if(value) map[ROW_CLASS] = value
            }
            return this
        }
    }


}
