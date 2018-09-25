require_relative '../../Authentication/Auth.rb'
require_relative '../../Cancelation/Cancelation.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
  end

class CancelationTest < Test::Unit::TestCase 
    def test_CancelationCSD
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64CSD = read_file("../../resources/b64CSD.txt")
        b64Key = read_file("../../resources/b64Key.txt")
        passwordcsd = "12345678a"
        uuid = "6fa54afe-bf11-46ac-8af9-965526187212"
        rfc = "LAN7008173R5"
        Cancelation::set(params)
        resultCancelCSD = Cancelation::cancelCsd(uuid, rfc, passwordcsd, b64CSD, b64Key)
        assert(resultCancelCSD.getStatus() == "success", "Expected \"success\" but was #{resultCancelCSD.getStatus()}")
    end
    def test_CancelationPFX
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64PFX = read_file("../../resources/b64Pfx.txt")
        passwordcsd = "12345678a"
        uuid = "6fa54afe-bf11-46ac-8af9-965526187212"
        rfc = "LAN7008173R5"
        Cancelation::set(params)
        resultCancelPFX = Cancelation::cancelPfx(uuid, rfc, passwordcsd, b64PFX)
        assert(resultCancelPFX.getStatus() == "success", "Expected \"success\" but was #{resultCancelPFX.getStatus()}")
    end
    def test_CancelationXML
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        xml = read_file("../../resources/cancelByXml.xml")
        Cancelation::set(params)
        resultCancelXML = Cancelation::cancelXml(xml)
        assert(resultCancelXML.getStatus() == "success", "Expected \"success\" but was #{resultCancelXML.getStatus()}")
    end
    def test_CancelationUUID
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        uuid = "6fa54afe-bf11-46ac-8af9-965526187212"
        rfc = "LAN7008173R5"
        Cancelation::set(params)
        resultCancelUUID = Cancelation::cancelUuid(uuid, rfc)
        assert(resultCancelUUID.getStatus() == "success", "Expected \"success\" but was #{resultCancelUUID.getStatus()}")
    end
end