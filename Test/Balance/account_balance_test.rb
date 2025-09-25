require_relative '../../lib/Balance/balance.rb'
require_relative '../Helpers/test_helper.rb'
require 'test/unit'

class BalanceTest < Test::Unit::TestCase
    def test_Balance_auth
        params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Balance::set(params)
        result_balance = Balance::get_balance
        assert(result_balance.get_status == "success", "Expected \"success\" but was #{result_balance.get_status}")
        assert(result_balance.get_data != nil)
        assert(result_balance.get_data.idUser != nil)
        assert(result_balance.get_data.idUserBalance != nil)
        assert(result_balance.get_data.stampsAssigned != nil)
        assert(result_balance.get_data.stampsUsed != nil)
        assert(result_balance.get_data.stampsBalance != nil)
        data = result_balance.get_data
        data.instance_variables.each do |var|
            value = data.instance_variable_get(var)
            puts "#{var}: #{value}"
        end
    end

    def test_Balance
        params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
        Balance::set(params)
        result_balance = Balance::get_balance
        assert(result_balance.get_status == "success", "Expected \"success\" but was #{result_balance.get_status}")
        assert(result_balance.get_data != nil)
        assert(result_balance.get_data.idUser != nil)
        assert(result_balance.get_data.idUserBalance != nil)
        assert(result_balance.get_data.stampsAssigned != nil)
        assert(result_balance.get_data.stampsUsed != nil)
        assert(result_balance.get_data.stampsBalance != nil)
    end

    def test_Balance_add_auth
        params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Balance::set(params)
        id = "A1DFC01F-459A-4A05-BF68-1F04D1EF8860"
        timbres = 2
        comment = "Prueba Ruby"
        response = Balance::add_stamps(id,timbres,comment)
        assert(response.get_status == "success")
        assert(response.get_data != nil)
        puts response.get_data
    end

    def test_Balance_add
        params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
        Balance::set(params)
        id = "A1DFC01F-459A-4A05-BF68-1F04D1EF8860"
        timbres = 2
        comment = "Prueba Ruby"
        response = Balance::add_stamps(id,timbres,comment)
        assert(response.get_status == "success")
        assert(response.get_data != nil)
    end

    def test_Balance_remove_auth
        params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Balance::set(params)
        id = "A1DFC01F-459A-4A05-BF68-1F04D1EF8860"
        timbres = 1
        comment = "Prueba Ruby"
        response = Balance::remove_stamps(id,timbres,comment)
        assert(response.get_status == "success")
        assert(response.get_data != nil)
    end

    def test_Balance_remove
        params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
        Balance::set(params)
        id = "A1DFC01F-459A-4A05-BF68-1F04D1EF8860"
        timbres = 1
        comment = "Prueba Ruby"
        response = Balance::remove_stamps(id,timbres,comment)
        assert(response.get_status == "success")
        assert(response.get_data != nil)
    end
end
