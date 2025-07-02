require_relative '../../lib/AcceptReject/accept_reject.rb'
require 'test/unit'
require_relative '../Helpers/test_helper.rb'

class AcceptRejectTest < Test::Unit::TestCase
    def test_accept_reject_csd
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        b64_csd = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_csd_CACX7605101P8.txt"))
        b64_key = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_key_CACX7605101P8.txt"))
        password_csd = '12345678a'
        uuids = []
        uuids << {"uuid" => "af6f7430-cfed-493f-bf61-ba268a074e30", "action" => "Rechazo"}
        rfc = 'CACX7605101P8'
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_csd(uuids, rfc, password_csd, b64_csd, b64_key)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_accept_reject_pfx
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        b64_pfx = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_pfx_CACX7605101P8.txt"))
        password_csd = '12345678a'
        uuids = []
        uuids << {"uuid" => "af6f7430-cfed-493f-bf61-ba268a074e30", "action" => "Rechazo"}
        rfc = 'CACX7605101P8'
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_pfx(uuids, rfc, password_csd, b64_pfx)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_accept_reject_uuid
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        rfc = 'CACX7605101P8'
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_uuid("af6f7430-cfed-493f-bf61-ba268a074e30", rfc, "Rechazo")
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_accept_reject_xml
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        xml_accept_reject = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/xml_accept.xml"))
        AcceptReject::set(params)
        response = AcceptReject::accept_reject_xml(xml_accept_reject)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end
