require_relative '../../Authentication/Auth.rb'
require_relative '../../Validation/Validate.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
end

class ValidateTest < Test::Unit::TestCase 
    def test_Validate_XML
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        xml = read_file('../../resources/xmlDone.xml')
        Validate::set(params)
        resultValidateXML = Validate::validateXml(xml)
        assert(resultValidateXML.getStatus() == "success", "Expected \"success\" but was #{resultValidateXML.getStatus()}")
    end
    def test_Validate_Lrfc
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        rfc = "LAN7008173R5"
        Validate::set(params)
        resultValidateLrfc = Validate::validateLrfc(rfc)
        assert(resultValidateLrfc.getStatus() == "success", "Expected \"success\" but was #{resultValidateLrfc.getStatus()}")
    end
    def test_Validate_Lco
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        noCert = "20001000000300022815"
        Validate::set(params)
        resultValidateNoCert = Validate::validateNoCert(noCert)
        assert(resultValidateNoCert.getStatus() == "success", "Expected \"success\" but was #{resultValidateNoCert.getStatus()}")
    end
end