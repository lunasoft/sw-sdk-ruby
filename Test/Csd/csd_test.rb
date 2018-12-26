require_relative '../../lib/Csd/csd.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "rb")
    data = file.read()
    file.close
    return data
  end

class CsdTest < Test::Unit::TestCase 
    def test_upload_csd
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        b64_csd = read_file("../../resources/b64_csd.txt")
        b64_key = read_file("../../resources/b64_key.txt")
        password_csd = "12345678a"
        is_active = true
        certificate_type = "stamp"
        Csd::set(params)
        response = Csd::upload_csd(is_active, certificate_type, password_csd, b64_csd, b64_key)
        assert(response.get_status == "success", "Expected \"success\" but was #{response.get_status}")
    end
end