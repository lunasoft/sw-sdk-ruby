require_relative '../../lib/AcceptReject/accept_reject.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
end

class AcceptRejectTest < Test::Unit::TestCase 
    def test_accept_reject_csd
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        b64_csd = read_file('../Resources/csd/b64_csd.txt')
        b64_key = read_file('../Resources/csd/b64_key.txt')
        password_csd = '12345678a'
        uuids = []
        uuids << {"uuid" => "7FDA7D8C-1B1A-4E24-9AF6-7F7CB3950D51", "action" => "Rechazo"}
        rfc = 'EKU9003173C9'
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_csd(uuids, rfc, password_csd, b64_csd, b64_key)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_accept_reject_pfx
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        b64_pfx = read_file('../Resources/csd/b64_pfx.txt')
        password_csd = '12345678a'
        uuids = []
        uuids << {"uuid" => "7FDA7D8C-1B1A-4E24-9AF6-7F7CB3950D51", "action" => "Rechazo"}
        rfc = 'EKU9003173C9'
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_pfx(uuids, rfc, password_csd, b64_pfx)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_accept_reject_uuid
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        rfc = 'EKU9003173C9'
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_uuid("7FDA7D8C-1B1A-4E24-9AF6-7F7CB3950D51", rfc, "Rechazo")
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_accept_reject_xml
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        xml_accept_reject = read_file('../Resources/cfdi/xml_accept.xml')
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_xml(xml_accept_reject)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end