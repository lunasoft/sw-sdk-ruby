require_relative '../../Stamp/Stamp.rb'
require_relative '../../Authentication/Auth.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
end

class StampTest < Test::Unit::TestCase 
    def test_stampv1
        xml = read_file('..\..\resources\xml33.xml')
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Stamp::set(params)
        resultStamp = Stamp::stampV1(xml)
        assert(resultStamp.getMessage() =~ /^307/, "Expected \"error 307\" but was #{resultStamp.getMessage()}")
    end

    def test_stampv2
        xml = read_file('..\..\resources\xml33.xml')
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Stamp::set(params)
        resultStamp = Stamp::stampV2(xml)
        assert(resultStamp.getMessage() =~ /^307/, "Expected \"error 307\" but was #{resultStamp.getMessage()}")
    end

    def test_stampv3
        xml = read_file('..\..\resources\xml33.xml')
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Stamp::set(params)
        resultStamp = Stamp::stampV3(xml)
        assert(resultStamp.getMessage() =~ /^307/, "Expected \"error 307\" but was #{resultStamp.getMessage()}")
    end

    def test_stampv4
        xml = read_file('..\..\resources\xml33.xml')
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Stamp::set(params)
        resultStamp = Stamp::stampV4(xml)
        assert(resultStamp.getMessage() =~ /^307/, "Expected \"error 307\" but was #{resultStamp.getMessage()}")
    end
end