require_relative '../../lib/Authentication/auth.rb'
require 'test/unit'

class AuthTest < Test::Unit::TestCase 
    def test_Auth
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Auth::set(params)
        response = Auth::authentication
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end