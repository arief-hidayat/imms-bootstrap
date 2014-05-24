package com.hida.imms

class AssetGroup implements Serializable {
    String groupName
    String description
    String responsibleDepartmentCd
    boolean emailNotificationNeeded = false
    boolean smsNotificationNeeded  = false

    static constraints = {
        groupName(unique: true, blank: false, size: 1..20)
        description(size: 0..76)
        responsibleDepartmentCd(nullable: true)
    }
}
