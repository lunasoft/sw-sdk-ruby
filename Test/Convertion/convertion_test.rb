require_relative '../Helpers/test_helper'
require_relative '../../lib/Stamp/stamp.rb'
require_relative '../../lib/Helpers/convertion_helper.rb'

require 'test/unit'
require 'json'

class ConvertionTest < Test::Unit::TestCase
    
    def test_convertion_cfdi40_success
        convertion_success_test('../Resources/cfdi/cfdi40.xml')
    end

    def test_convertion_cfdi40withcomplement_success
        convertion_success_test('../Resources/cfdi/nomina12.xml')
    end

    def test_convertion_invalidparams_error
        begin
            converted_v4 = ConvertionHelper::response_to_v4("", nil)
        rescue Exception => ex
            assert(ex.message == "El TFD o el CFDI se encuentran vacíos.", ex.message)
        end
    end

    def test_convertion_invalidtfd_error
        begin
            xml = TestHelper::read_file('../Resources/cfdi/cfdi40.xml')
            cfdi = TestHelper::get_cfdi(xml)
            converted_v4 = ConvertionHelper::response_to_v4("<?xml version=\"1.0\" encoding=\"utf-8\"?>", cfdi)
        rescue Exception => ex
            assert(ex.message == "El TFD se encuentra corrupto o es inválido.", ex.message)
        end
    end

    private
    def convertion_success_test(file_name)
        xml = TestHelper::read_file('../Resources/cfdi/cfdi40.xml')
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}

        Stamp::set(params)
        response_v4 = Stamp::stamp_v4(xml_signed)
        response_v1 = Stamp::stamp_v1(xml_signed)

        converted_v4 = ConvertionHelper::response_to_v4(response_v1.get_messageDetail, response_v4.get_data['cfdi'])
        
        response_data_v4 = response_v4.get_data
        properties_to_check = ['cadenaOriginalSAT', 'noCertificadoSAT', 'noCertificadoCFDI', 'uuid', 'selloSAT', 'selloCFDI', 'fechaTimbrado']

        properties_to_check.each do |property|
            assert(response_data_v4[property] == converted_v4[property],
                "Se esperaba #{response_data_v4[property]}, pero se obtuvo #{converted_v4[property]} para #{property}")
        end
        assert(converted_v4['qrCode'] != nil? && converted_v4['qrCode'].length > 0)
    end
end