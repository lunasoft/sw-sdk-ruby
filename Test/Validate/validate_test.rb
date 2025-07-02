require_relative '../../lib/Validation/validate.rb'
require_relative '../Helpers/test_helper.rb'
require 'test/unit'


class ValidateTest < Test::Unit::TestCase
    def test_validate_xml
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/xml_done.xml"))
        Validate::set(params)
        response = Validate::validate_xml(xml)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end
