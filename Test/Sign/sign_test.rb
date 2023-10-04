require_relative '../../lib/Sign/sign.rb'
require_relative '../../lib/Stamp/stamp.rb'
require_relative '../Helpers/test_helper.rb'
require 'test/unit'
require 'json'

class SignTest < Test::Unit::TestCase
    def test_sign_success
        xml = TestHelper::read_file('../Resources/cfdi/cfdi40.xml')
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v1(xml_signed)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status} - #{response.get_message}")
        assert(response.get_data != nil && !response.get_data.strip.empty)
    end
end