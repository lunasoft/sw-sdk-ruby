require_relative '../../lib/Pendings/pendings.rb'
require 'test/unit'

class PendingsTest < Test::Unit::TestCase 
    def test_pendings
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        rfc = 'EKU9003173C9'
        Pendings::set(params)
        response = Pendings::get_pendings(rfc)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end