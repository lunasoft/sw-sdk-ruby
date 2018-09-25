require_relative '../../Authentication/Auth.rb'
require_relative '../../Pendings/Pendings.rb'
require 'test/unit'

class PendingsTest < Test::Unit::TestCase 
    def test_Pendings
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        rfc = 'LAN7008173R5'
        Pendings::set(params)
        responsePendings = Pendings::getPendings(rfc)
        assert(responsePendings.getStatus() == "success", "Expected \"success\" but was #{responsePendings.getStatus()}")
    end
end