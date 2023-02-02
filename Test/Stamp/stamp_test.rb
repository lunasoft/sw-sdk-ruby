require_relative '../../lib/Stamp/stamp.rb'
require_relative '../test_helper.rb'
require 'test/unit'

class StampTest < Test::Unit::TestCase 
    def test_stamp_v1
        xml = TestHelper::read_file('resources/cfdi40.xml')
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v1(xml_signed)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end

    def test_stamp_v2
        xml = TestHelper::read_file('resources/cfdi40.xml')
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v2(xml_signed)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end

    def test_stamp_v3
        xml = TestHelper::read_file('resources/cfdi40.xml')
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v3(xml_signed)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end

    def test_stamp_v4
        xml = TestHelper::read_file('resources/cfdi40.xml')
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v4(xml_signed)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end
