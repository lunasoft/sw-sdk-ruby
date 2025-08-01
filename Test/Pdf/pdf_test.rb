require_relative '../../lib/Pdf/pdf.rb'
require_relative '../Helpers/test_helper.rb'
require 'test/unit'

class PdfTest < Test::Unit::TestCase
    def test_pdf_auth_success
        params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/xml_done.xml"))
        Pdf::set(params)
        response = Pdf::generate_pdf(xml,'cfdi40')
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end

    def test_pdf_token_success
        params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/xml_done.xml"))
        Pdf::set(params)
        response = Pdf::generate_pdf(xml,'cfdi40')
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end

    def test_pdf_extras_success
        params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/xml_done.xml"))
        extras = {'REFERENCIA': "Referencia de pruebas"}
        Pdf::set(params)
        response = Pdf::generate_pdf(xml,'cfdi40',nil,extras)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end

    def test_pdf_logo_success
        params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/xml_done.xml"))
        logo = "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"
        Pdf::set(params)
        response = Pdf::generate_pdf(xml,'cfdi40',logo)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end
