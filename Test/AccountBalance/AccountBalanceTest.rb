require_relative '../../Authentication/Auth.rb'
require_relative '../../Balance/Balance.rb'
require 'test/unit'

class BalanceTest < Test::Unit::TestCase 
    def test_Balance
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Balance::set(params)
        resultBalance = Balance::getAccountBalance()
        assert(resultBalance.getStatus() == "success", "Expected \"success\" but was #{resultBalance.getStatus()}")
    end
end