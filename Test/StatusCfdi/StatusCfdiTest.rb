require_relative '../../StatusCfdi/StatusCfdi.rb'
require 'test/unit'

class StatusCfdiTest < Test::Unit::TestCase 
    def test_StatusCfdi
        responsestatusCfdi = StatusCfdi::Status("LAN7008173R5", "LAN8507268IA", "5800.00", "a9143107-25c5-4fb9-b0eb-2fcbcb855967", "http://consultaqrfacturaelectronicatest.sw.com.mx/ConsultaCFDIService.svc", "http://tempuri.org/IConsultaCFDIService/Consulta")
        assert(responsestatusCfdi.getStatusCode() == "200", "Expected \"success\" but was #{responsestatusCfdi.getStatusCode()}")
    end
end