require_relative '../../Authentication/Auth.rb'
require_relative '../../AcceptReject/AcceptReject.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
end

class AcceptRejectTest < Test::Unit::TestCase 
    def test_AcceptReject_CSD
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64CSD = read_file('../../resources/b64CSD.txt')
        b64Key = read_file('../../resources/b64Key.txt')
        passwordcsd = '12345678a'
        uuids = []
        uuids << {"uuid" => "6b02b155-25fd-488d-862b-5a5dc5694b62", "action" => "Rechazo"}
        uuids << {"uuid" => "ef47cd9e-b495-483d-b7ad-7f374fe8e353", "action" => "Rechazo"}
        rfc = 'LAN7008173R5'
        AcceptReject::set(params)
        responseAcceptRejectCSD = AcceptReject::AcceptRejectCsd(uuids, rfc, passwordcsd, b64CSD, b64Key)
        assert(responseAcceptRejectCSD.getStatus() == "success", "Expected \"success\" but was #{responseAcceptRejectCSD.getStatus()}")
    end
    def test_AcceptReject_PFX
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64PFX = read_file('../../resources/b64Pfx.txt')
        passwordcsd = '12345678a'
        uuids = []
        uuids << {"uuid" => "6b02b155-25fd-488d-862b-5a5dc5694b62", "action" => "Rechazo"}
        uuids << {"uuid" => "ef47cd9e-b495-483d-b7ad-7f374fe8e353", "action" => "Rechazo"}
        rfc = 'LAN7008173R5'
        AcceptReject::set(params)
        responseAcceptRejectPFX = AcceptReject::AcceptRejectPfx(uuids, rfc, passwordcsd, b64PFX)
        assert(responseAcceptRejectPFX.getStatus() == "success", "Expected \"success\" but was #{responseAcceptRejectPFX.getStatus()}")
    end
    def test_AcceptReject_UUID
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        rfc = 'LAN7008173R5'
        AcceptReject::set(params)
        responseAcceptRejectUUID = AcceptReject::AcceptRejectUuid("6b02b155-25fd-488d-862b-5a5dc5694b62", rfc, "Rechazo")
        assert(responseAcceptRejectUUID.getStatus() == "success", "Expected \"success\" but was #{responseAcceptRejectUUID.getStatus()}")
    end
    def test_AcceptReject_XML
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        xmlAcceptReject = read_file('../../resources/xmlAcceptReject.xml')
        AcceptReject::set(params)
        responseAcceptRejectXML = AcceptReject::AcceptRejectXml(xmlAcceptReject)
        assert(responseAcceptRejectXML.getStatus() == "success", "Expected \"success\" but was #{responseAcceptRejectXML.getStatus()}")
    end
end