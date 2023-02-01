require_relative '../../lib/Balance/balance.rb'
require 'test/unit'

class BalanceTest < Test::Unit::TestCase 
    def test_Balance
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Balance::set(params)
        result_balance = Balance::account_balance
        assert(result_balance.get_status == "success", "Expected \"success\" but was #{result_balance.get_status}")
    end
end