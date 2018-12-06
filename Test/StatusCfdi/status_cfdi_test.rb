require_relative '../../lib/StatusCfdi/status_cfdi.rb'
require 'test/unit'

class StatusCfdiTest < Test::Unit::TestCase 
    def test_status_cfdi
        response = StatusCfdi::status("LSO1306189R5", "GACJ940911ASA", "4999.99", "e7df3047-f8de-425d-b469-37abe5b4dabb", "https://consultaqr.facturaelectronica.sat.gob.mx/ConsultaCFDIService.svc", "http://tempuri.org/IConsultaCFDIService/Consulta")
        assert(response.get_status_code == "200", "Expected \"success\" but was #{response.get_status_code}")
    end
end