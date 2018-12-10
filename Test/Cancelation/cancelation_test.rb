require_relative '../../lib/Cancelation/cancelation.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
  end

class CancelationTest < Test::Unit::TestCase 
    def test_cancelation_csd
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64_csd = read_file("../../resources/b64_csd.txt")
        b64_key = read_file("../../resources/b64_key.txt")
        password_csd = "12345678a"
        uuid = "3b99397c-7ca3-4dda-bd03-4a9e55a58e70"
        rfc = "LAN7008173R5"
        Cancelation::set(params)
        response = Cancelation::cancel_csd(uuid, rfc, password_csd, b64_csd, b64_key)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_Cancelation_pfx
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64_pfx = read_file("../../resources/b64_pfx.txt")
        password_csd = "12345678a"
        uuid = "3b99397c-7ca3-4dda-bd03-4a9e55a58e70"
        rfc = "LAN7008173R5"
        Cancelation::set(params)
        response = Cancelation::cancel_pfx(uuid, rfc, password_csd, b64_pfx)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_cancelation_xml
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        xml = read_file("../../resources/cancel_xml.xml")
        Cancelation::set(params)
        response = Cancelation::cancel_xml(xml)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_cancelation_uuid
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        uuid = "3b99397c-7ca3-4dda-bd03-4a9e55a58e70"
        rfc = "LAN7008173R5"
        Cancelation::set(params)
        response = Cancelation::cancel_uuid(uuid, rfc)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end