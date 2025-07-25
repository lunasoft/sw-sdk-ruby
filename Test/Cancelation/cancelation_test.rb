require_relative '../../lib/Cancelation/cancelation.rb'
require 'test/unit'
require_relative '../Helpers/test_helper.rb'

class CancelationTest < Test::Unit::TestCase
    def test_cancelation_csd
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        b64_csd = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_csd.txt"))
        b64_key = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_key.txt"))
        password_csd = "12345678a"
        uuid = "14575333-1bf4-4358-9adc-ee8f69ade7d4"
        rfc = "EKU9003173C9"
        motivo = "02"
        Cancelation::set(params)
        response = Cancelation::cancel_csd(uuid, rfc, password_csd, b64_csd, b64_key, motivo)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_cancelation_csd_sustitucion
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        b64_csd = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_csd.txt"))
        b64_key = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_key.txt"))
        password_csd = "12345678a"
        uuid = "3d565100-3518-43f9-9a87-fddb4a1a6453"
        rfc = "EKU9003173C9"
        motivo = "01"
        folio_sustitucion = "b02f0526-ad1a-4a0e-a493-17fb0c192f7d"
        Cancelation::set(params)
        response = Cancelation::cancel_csd(uuid, rfc, password_csd, b64_csd, b64_key, motivo, folio_sustitucion)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_Cancelation_pfx
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        b64_pfx = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_pfx.txt"))
        password_csd = "12345678a"
        uuid = "14575333-1bf4-4358-9adc-ee8f69ade7d4"
        rfc = "EKU9003173C9"
        motivo = "02"
        Cancelation::set(params)
        response = Cancelation::cancel_pfx(uuid, rfc, password_csd, b64_pfx, motivo)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_Cancelation_pfx_sustitucion
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        b64_pfx = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_pfx.txt"))
        password_csd = "12345678a"
        uuid = "3d565100-3518-43f9-9a87-fddb4a1a6453"
        rfc = "EKU9003173C9"
        motivo = "01"
        folio_sustitucion = "b02f0526-ad1a-4a0e-a493-17fb0c192f7d"
        Cancelation::set(params)
        response = Cancelation::cancel_pfx(uuid, rfc, password_csd, b64_pfx, motivo, folio_sustitucion)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_cancelation_xml
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/cancel_xml.xml"))
        Cancelation::set(params)
        response = Cancelation::cancel_xml(xml)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_cancelation_uuid
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        uuid = "14575333-1bf4-4358-9adc-ee8f69ade7d4"
        rfc = "EKU9003173C9"
        motivo = "02"
        Cancelation::set(params)
        response = Cancelation::cancel_uuid(uuid, rfc, motivo)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_cancelation_uuid_sustitucion
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        uuid = "3d565100-3518-43f9-9a87-fddb4a1a6453"
        rfc = "EKU9003173C9"
        motivo = "01"
        folio_sustitucion = "b02f0526-ad1a-4a0e-a493-17fb0c192f7d"
        Cancelation::set(params)
        response = Cancelation::cancel_uuid(uuid, rfc, motivo, folio_sustitucion)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end
