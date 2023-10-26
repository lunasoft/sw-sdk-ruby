require_relative '../../lib/Storage/storage.rb'
require 'test/unit'

class StorageTest < Test::Unit::TestCase 
    def test_auth_storage_success
        params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        Storage::set(params)
        uuid = "f714443f-8d9c-4497-b297-7b8e8db00b8f"
        response = Storage::get_xml(uuid)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
        assert(response.get_data != nil?)
        assert(response.get_data['records'].count > 0)
    end
    def test_storage_success
        params = {"url_api" => 'http://api.test.sw.com.mx', "token" => ENV["SDKTEST_TOKEN"]}
        Storage::set(params)
        uuid = "f714443f-8d9c-4497-b297-7b8e8db00b8f"
        response = Storage::get_xml(uuid)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
        assert(response.get_data != nil?)
        assert(response.get_data['records'].count > 0)
    end
    def test_storage_invalid_auth
        begin
        params = {"url_api" => 'http://api.test.sw.com.mx'}
        Storage::set(params)
        uuid = "f714443f-8d9c-4497-b297-7b8e8db00b8f"
        response = Storage::get_xml(uuid)
        rescue RuntimeError => e
            assert(e.message == "Datos de autenticación deben especificarse", "Response was #{e.message}")
        end
    end
    def test_storage_invalid_url
        begin
            params = {"urlAPI" => 'http://api.test.sw.com.mx', "token" => ENV["SDKTEST_TOKEN"]}
            Storage::set(params)
            uuid = "f714443f-8d9c-4497-b297-7b8e8db00b8f"
            response = Storage::get_xml(uuid)
        rescue RuntimeError => e
            assert(e.message == "URL debe especificarse", "Response was #{e.message}")
        end
    end
    def test_storage_norecords
        params = {"url_api" => 'http://api.test.sw.com.mx', "token" => ENV["SDKTEST_TOKEN"]}
        Storage::set(params)
        uuid = "b35d525e-d845-42c9-bbfb-eeeef601e2b4"
        response = Storage::get_xml(uuid)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
        assert(response.get_data != nil?)
        assert(response.get_data['records'].count == 0)
    end
end