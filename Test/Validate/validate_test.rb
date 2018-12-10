require_relative '../../lib/Validation/validate.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
end

class ValidateTest < Test::Unit::TestCase 
    def test_validate_xml
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        xml = read_file('../../resources/xml_done.xml')
        Validate::set(params)
        response = Validate::validate_xml(xml)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_validate_LRFC
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        rfc = "LAN7008173R5"
        Validate::set(params)
        response = Validate::validate_LRFC(rfc)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_validate_LCO
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        no_cert = "20001000000300022815"
        Validate::set(params)
        response = Validate::validate_LCO(no_cert)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end