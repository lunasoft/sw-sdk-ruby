require 'nokogiri'
require_relative '../../lib/Stamp/stamp.rb'
require_relative '../Helpers/test_helper.rb'
require 'test/unit'

class StampTest < Test::Unit::TestCase
    def test_stamp_v1
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/cfdi40.xml"))
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v1(xml_signed)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status} - #{response.get_message}")
        assert(response.get_data != nil?)
    end

    def test_stamp_v2
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/cfdi40.xml"))
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v2(xml_signed)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status} - #{response.get_message}")
        assert(response.get_data != nil?)
    end

    def test_stamp_v3
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/cfdi40.xml"))
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v3(xml_signed)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status} - #{response.get_message}")
        assert(response.get_data != nil?)
    end

    def test_stamp_v4
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/cfdi40.xml"))
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v4(xml_signed)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status} - #{response.get_message}")
        assert(response.get_data != nil?)
    end

    def test_stamp_v4_cp30
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/cp30.xml"))
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v4(xml)
        cadena = SignHelper::get_cadena_original(xml)
        cadena_esperada = cadena.to_xml.gsub(/<\?xml[^>]+\?>|\n/, '')
        cadena_original = "||4.0|Serie|Folio|2023-10-02T11:30:55|01|30001000000500003416|100.00|MXN|100.00|I|01|PUE|20000|EKU9003173C9|ESCUELA KEMPER URGATE|601|URE180429TM6|UNIVERSIDAD ROBOTICA ESPAÑOLA|86991|601|G01|78101800|UT421511|1|H87|Pieza|Transporte de carga por carretera|100.00|100.00|01|3.0|CCC98765-FEDC-5678-4321-ABCDEF098765|No|5|Origen|OR123456|URE180429TM6|2023-10-02T18:00:00|2109|05|057|OAX|MEX|70300|Destino|DE123456|URE180429TM6|2023-10-02T19:00:00|5|2109|05|057|OAX|MEX|70300|1|KGM|1|10101500|Mercancia|1.00|18|01|Medicamento|Medicamento|SW Sapien|2024-01-23|123456|01|03|123456789|1.00|1|OR123456|DE123456|TPAF01|12345|C2|100|ABC123|2023|SW Sapien|12345|01|123456789|Nombre Apellido||"
        assert(response.get_message =~ /^307/, "Expected \"success\" but was #{response.get_status}")
        assert(cadena_esperada == cadena_original)
    end
end
