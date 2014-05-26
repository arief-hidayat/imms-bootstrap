package com.hida.imms

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AssetController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Asset.list(params), model:[assetInstanceCount: Asset.count()]
    }

    def show(Asset assetInstance) {
        respond assetInstance
    }

    def create() {
        respond new Asset(params)
    }

    @Transactional
    def save(Asset assetInstance) {
        if (assetInstance == null) {
            notFound()
            return
        }

        if (assetInstance.hasErrors()) {
            respond assetInstance.errors, view:'create'
            return
        }

        assetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])
                redirect assetInstance
            }
            '*' { respond assetInstance, [status: CREATED] }
        }
    }

    def edit(Asset assetInstance) {
        respond assetInstance
    }

    @Transactional
    def update(Asset assetInstance) {
        if (assetInstance == null) {
            notFound()
            return
        }

        if (assetInstance.hasErrors()) {
            respond assetInstance.errors, view:'edit'
            return
        }

        assetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])
                redirect assetInstance
            }
            '*'{ respond assetInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Asset assetInstance) {

        if (assetInstance == null) {
            notFound()
            return
        }

        assetInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
