require_relative '../../Authentication/Auth.rb'
require 'test/unit'

class AuthTest < Test::Unit::TestCase 
    def test_Auth
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Auth::set(params)
        resultAuth = Auth::authentication()
        assert(resultAuth.getStatus() == "success", "Expected \"success\" but was #{resultAuth.getStatus()}")
    end
end