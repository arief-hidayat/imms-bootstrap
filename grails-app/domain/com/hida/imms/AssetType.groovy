package com.hida.imms

class AssetType implements Serializable {
    String type
    String note
    static searchable = {
        id name: 'assetTypeId'
        type name: 'assetType'
    }
    static constraints = {
        type(unique: true, blank: false,  size: 1..30)
        note(nullable: true, size: 0..76)
    }
}
