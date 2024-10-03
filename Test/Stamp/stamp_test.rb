require 'nokogiri'
require_relative '../../lib/Stamp/stamp.rb'
require_relative '../../lib/Helpers/sign_helper.rb'
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
        puts response.get_message
        puts "__________"
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

    def test_stamp_v4_cp31
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/cfdi40_cp31.xml"))
        pfx = TestHelper::create_pfx
        password = "12345678a"
        xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v4(xml_signed)
        puts response
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status} - #{response.get_message}")
        assert(response.get_data != nil?)
    end

    def test_stamp_v4_cadena_cp31
        xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/cp31.xml"))
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Stamp::set(params)
        response = Stamp::stamp_v4(xml)
        cadena = SignHelper::get_cadena_original(xml)
        cadena_esperada = cadena.to_xml.gsub(/<\?xml[^>]+\?>|\n/, '')
        cadena_original = "||4.0|SerieCCP31|CP3.1|2024-06-24T00:00:55|01|30001000000500003416|100.00|MXN|100.00|I|01|PUE|42501|EKU9003173C9|ESCUELA KEMPER URGATE|601|URE180429TM6|UNIVERSIDAD ROBOTICA ESPAÑOLA|86991|601|S01|78101800|UT421511|1|H87|Pieza|Transporte de carga por carretera|100.00|100.00|01|3.1|CCCBCD94-870A-4332-A52A-A52AA52AA52A|No|1|Sí|01|01|Origen|OR101010|URE180429TM6|NombreRemitenteDestinatario1|2023-08-01T00:00:00|Calle1|211|212|1957|13|casa blanca|011|CMX|MEX|13250|Destino|DE202020|URE180429TM6|NombreRemitenteDestinatario2|2023-08-01T00:00:01|1|Calle2|214|215|0347|23|casa negra|004|COA|MEX|25350|1.0|XBX|1|Sí|11121900|Accesorios de equipo de telefonía|1.0|XBX|No|DenominacionGenericaProd1|DenominacionDistintivaProd1|Fabricante1|2003-04-02|LoteMedic1|01|01|RegistroSanita1|1|6309000100|1|OR101010|DE202020|TPAF01|NumPermisoSCT1|VL|1|plac892|2020|AseguraRespCivil|123456789|CTR004|VL45K98|01|URE180429TM6|NumLicencia1|NombreFigura1|Calle1|NumeroExterior1|NumeroInterior1|Colonia1|Localidad1|Referencia1|Municipio1|Estado1|AFG|CodigoPosta1||"
        assert(response.get_message =~ /^307/, "Expected \"success\" but was #{response.get_status}")
        assert(cadena_esperada == cadena_original)
    end
end
