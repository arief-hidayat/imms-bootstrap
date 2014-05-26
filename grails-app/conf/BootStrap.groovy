import com.hida.imms.Asset
import com.hida.imms.AssetType

class BootStrap {

    def init = { servletContext ->
        def types = ["A_TYPE", "B_TYPE", "C_TYPE", "OTHER_TYPE"]

        AssetType.executeUpdate("delete from AssetType")
        Asset.executeUpdate("delete from Asset")

        types.each { String ty ->
            AssetType type = new AssetType(type: ty, note: "Note for type: $ty")
            type.save(failOnError: true)
        }

        (1..1_000_000).each {
            Asset.build(code: "AS$it", name : "Asset #$it", assetType: types[(int) (Math.random() * types.size())])
        }

        println "total asset : ${Asset.count()}"
    }
    def destroy = {
    }
}
