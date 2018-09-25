require_relative '../../Authentication/Auth.rb'
require_relative '../../Relations/Relations.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
end

class RelationsTest < Test::Unit::TestCase 
    def test_Relations_CSD
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64CSD = read_file('../../resources/b64CSD.txt')
        b64Key = read_file('../../resources/b64Key.txt')
        passwordcsd = '12345678a'
        uuid = "77e5ee7e-518e-48d1-b719-2562eaf9cb1f"
        rfc = 'LAN7008173R5'
        Relations::set(params)
        responseRelationsCSD = Relations::RelationsCsd(uuid, rfc, passwordcsd, b64CSD, b64Key)
        assert(responseRelationsCSD.getStatus() == "success", "Expected \"success\" but was #{responseRelationsCSD.getStatus()}")
    end
    def test_Relations_PFX
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64PFX = read_file('../../resources/b64Pfx.txt')
        passwordcsd = '12345678a'
        uuid = "77e5ee7e-518e-48d1-b719-2562eaf9cb1f"
        rfc = 'LAN7008173R5'
        Relations::set(params)
        responseRelationsPFX = Relations::RelationsPfx(uuid, rfc, passwordcsd, b64PFX)
        assert(responseRelationsPFX.getStatus() == "success", "Expected \"success\" but was #{responseRelationsPFX.getStatus()}")
    end
    def test_Relations_UUID
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        uuid = "77e5ee7e-518e-48d1-b719-2562eaf9cb1f"
        rfc = 'LAN7008173R5'
        Relations::set(params)
        responseRelationsUuid = Relations::RelationsUuid(uuid, rfc)
        assert(responseRelationsUuid.getStatus() == "success", "Expected \"success\" but was #{responseRelationsUuid.getStatus()}")
    end
    def test_Relations_XML
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        xmlRelations = read_file('../../resources/xmlRelations.xml')
        Relations::set(params)
        responseRelationsXML = Relations::RelationsXml(xmlRelations)
        assert(responseRelationsXML.getStatus() == "success", "Expected \"success\" but was #{responseRelationsXML.getStatus()}")
    end
end