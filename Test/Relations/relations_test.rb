require_relative '../../lib/Authentication/auth.rb'
require_relative '../../lib/Relations/relations.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
end

class RelationsTest < Test::Unit::TestCase 
    def test_relations_csd
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64_csd = read_file('../../resources/b64_csd.txt')
        b64_key = read_file('../../resources/b64_key.txt')
        password_csd = '12345678a'
        uuid = "77e5ee7e-518e-48d1-b719-2562eaf9cb1f"
        rfc = 'LAN7008173R5'
        Relations::set(params)
        response = Relations::relations_csd(uuid, rfc, password_csd, b64_csd, b64_key)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_relations_pfx
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64_pfx = read_file('../../resources/b64_pfx.txt')
        password_csd = '12345678a'
        uuid = "77e5ee7e-518e-48d1-b719-2562eaf9cb1f"
        rfc = 'LAN7008173R5'
        Relations::set(params)
        response = Relations::relations_pfx(uuid, rfc, password_csd, b64_pfx)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_relations_uuid
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        uuid = "77e5ee7e-518e-48d1-b719-2562eaf9cb1f"
        rfc = 'LAN7008173R5'
        Relations::set(params)
        response = Relations::relations_uuid(uuid, rfc)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
    def test_relations_xml
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        xml_relations = read_file('../../resources/xml_relations.xml')
        Relations::set(params)
        response = Relations::relations_xml(xml_relations)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end