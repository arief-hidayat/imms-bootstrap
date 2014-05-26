package com.hida.imms

import org.joda.time.LocalDate

class Asset {

    static search = {
        code index: 'tokenized'
        name index: 'tokenized'
        priority index: 'un_tokenized'
        status index: 'un_tokenized'
        assetType index: 'un_tokenized'
        locationCd index: 'un_tokenized'
    }

    static mapping = {
        parentCd index : 'asset_parent_idx'
    }

    String code
    String parentCd
    String name
    String priority
    String modelNo
    String serialNo
    String status
    String manufacturer
    String assetType
    String assetGroup
    String locationCd
    String vendorCd
    LocalDate purchaseDate
    LocalDate baseDate
    LocalDate warrantyStartDate
    LocalDate warrantyEndDate
    BigDecimal originalCost = new BigDecimal(0)
    String originalCostUnit
    String depreciationType
    String depreciationInterval
    String description
    String note

    static constraints = {
        code(unique: true, blank: false, nullable: false, size: 1..50)
        name(blank: false, nullable: false, size: 1..150)
//        priority(nullable: false, inList: [ASSET_PRIORITY_CRITICAL, ASSET_PRIORITY_PRODUCTION, ASSET_PRIORITY_NON_PRODUCTION])
//        status(nullable: false, inList: [STATUS_IN_USE, STATUS_IN_SERVICE, STATUS_IN_REPAIR, STATUS_IN_STORE, STATUS_SCRAPPED])
        assetGroup(nullable: true)
        locationCd(nullable: false, validator: { val, obj, errors ->
            if(obj.id && obj.locationCd != val && obj.parentCd) {
                obj.errors.reject('custom.invalid.value', ["Asset"].toArray(),
                        "You are not allowed to set the asset as its own sub asset")
                return
            }
        })
        originalCost(min: new BigDecimal(0), nullable: false)
//        originalCostUnit(nullable: false, validator: {val, obj, errors ->
//            UnitOfMeasure defaultUnit = UnitOfMeasure.get(Constants.RESERVED_CURRENCY_UNIT_ID)
//            if (obj.originalCostUnit != null && !UnitOfMeasureConversion.isUnitConvertible(obj.originalCostUnit, defaultUnit.unitOfMeasure)) {
//                obj.errors.reject('custom.invalid.value', ["UnitOfMeasure"].toArray(),
//                        "Unit ${obj.originalCostUnit} should be convertible to default ${defaultUnit}.");
//            }
//        })
        note(nullable: true)
//        depreciationType(nullable: false, inList: [ASSET_DEPRECIATION_TYPE_STRAIGHT, ASSET_DEPRECIATION_TYPE_OTHER])
//        depreciationInterval(nullable: false, inList: [ASSET_DEPRECIATION_INTERVAL_ANNUALLY,
//                                                       ASSET_DEPRECIATION_INTERVAL_QUARTERLY])
        description(nullable: true, size: 0..1000)
        parentCd(nullable : true, validator: {val, obj, errors ->
            if(obj.parentCd) {
                if(obj.id && obj.code == obj.parentCd) {
                    obj.errors.reject('custom.invalid.value', ["Asset"].toArray(),
                            "You are not allowed to set the asset as its own sub asset")
                    return
                }
                def parentCd = obj.parentCd
                while(parentCd) {
                    if(parentCd == obj.code) {
                        obj.errors.reject('custom.invalid.value', ["Asset"].toArray(),
                                "Circular reference is detected");
                        return
                    }
                    parentCd = Asset.findByCode(parentCd)?.parentCd
                }
            }
        })
    }
}
