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
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64_csd = read_file('../../resources/b64_csd.txt')
        b64_key = read_file('../../resources/b64_key.txt')
        password_csd = '12345678a'
        uuids = []
        uuids << {"uuid" => "FD74D156-B9B0-44A5-9906-E08182E8363E", "action" => "Rechazo"}
        rfc = 'LAN7008173R5'
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_csd(uuids, rfc, password_csd, b64_csd, b64_key)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_accept_reject_pfx
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64_pfx = read_file('../../resources/b64_pfx.txt')
        password_csd = '12345678a'
        uuids = []
        uuids << {"uuid" => "FD74D156-B9B0-44A5-9906-E08182E8363E", "action" => "Rechazo"}
        rfc = 'LAN7008173R5'
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_pfx(uuids, rfc, password_csd, b64_pfx)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_accept_reject_uuid
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        rfc = 'LAN7008173R5'
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_uuid("FD74D156-B9B0-44A5-9906-E08182E8363E", rfc, "Rechazo")
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_accept_reject_xml
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        xml_accept_reject = read_file('../../resources/xml_accept.xml')
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_xml(xml_accept_reject)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end