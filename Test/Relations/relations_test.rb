require_relative '../../lib/Relations/relations.rb'
require 'test/unit'
require_relative '../Helpers/test_helper.rb'

class RelationsTest < Test::Unit::TestCase
    def test_relations_csd
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        b64_csd = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_csd.txt"))
        b64_key = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_key.txt"))
        password_csd = '12345678a'
        uuid = "f714443f-8d9c-4497-b297-7b8e8db00b8f"
        rfc = 'EKU9003173C9'
        Relations::set(params)
        response = Relations::relations_csd(uuid, rfc, password_csd, b64_csd, b64_key)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_relations_pfx
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        b64_pfx = TestHelper::read_file(File.join(__dir__, "../Resources/csd/b64_pfx.txt"))
        password_csd = '12345678a'
        uuid = "f714443f-8d9c-4497-b297-7b8e8db00b8f"
        rfc = 'EKU9003173C9'
        Relations::set(params)
        response = Relations::relations_pfx(uuid, rfc, password_csd, b64_pfx)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_relations_uuid
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        uuid = "f714443f-8d9c-4497-b297-7b8e8db00b8f"
        rfc = 'EKU9003173C9'
        Relations::set(params)
        response = Relations::relations_uuid(uuid, rfc)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end
